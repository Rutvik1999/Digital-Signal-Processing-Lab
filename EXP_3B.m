clc;
close all;
B = input('Enter Coeffecients of Numerator of the transfer function : ');
% B = [1 zeros(1,239) 0.1]
% A = [1 zeros(1,239) -0.8]
A = input('Enter Coeffecients of Denominator of the transfer function : ');
[Z, P, K] = tf2zpk(B, A); %find poles and zeros
figure(1);
zplane(B, A);
title('f(z) plot');
if(isstable(B, A)) %is system stable
    disp('System is Stable');
else 
    disp('System is Unstable');
end

N = 5000; %number of samples required (for plotting)
[h, n] = impz(B, A, N);
figure(2);
stem(n, h);
title('Unit impulse Response');

%[s, n] = stepz(B, A, N);
%figure(3);
%stem(n, s);
%title('Unit Step Response');
figure(4);
if(isstable(B, A))
    W = -pi:pi/255:pi;
    H = freqz(B, A, W);
    subplot(2,1,1);
    plot(W, abs(H));
    xlabel('W');
    ylabel('Magnitude');
    title('Magnitude Plot of Frequency response');
    subplot(2,1,2);
    plot(W, angle(H));
    xlabel('W');
    ylabel('Angle');
    title('Angle Plot of Frequency response');
end

s_freq = 8000;
amp = input('Enter Amplitude : ');
seq_len = input('Enter Sequence Length : ');
f126 = 126 / s_freq;
f277 = 277 / s_freq;
f1050 = 1050 / s_freq;
f2277 = 2277 / s_freq;
f3400 = 3400 / s_freq;
n = 0:(seq_len - 1);
x = amp * ( sin((2 * pi * f126 * n )) + sin((2 * pi * f277 * n )) + sin((2 * pi * f1050 * n )) + sin((2 * pi * f2277 * n )) + sin((2 * pi * f3400 * n )));
x_norm = x / max(abs(x));
disp('Signal Generated');
bit_rate = input('Enter bit rate : ');
audiowrite('EXP_3B_original_audio.wav', x_norm, s_freq,'BitsPerSample',bit_rate);

filtered_x = filter(B, A, x);
filtered_x_norm = filtered_x / max(abs(filtered_x));
audiowrite('EXP_3B_filtered_audio.wav', filtered_x_norm, s_freq,'BitsPerSample',bit_rate);
audio_read_obj_org = audioread('EXP_3B_original_audio.wav');
audio_play_obj_org = audioplayer(audio_read_obj_org, s_freq);
disp('Press any key to play original(Unfiltered) audio :');
pause();
play(audio_play_obj_org);
audio_read_obj_fil = audioread('EXP_3B_filtered_audio.wav');
audio_play_obj_fil = audioplayer(audio_read_obj_org, s_freq);
disp('Press any key to play Filtered audio :');
pause();
play(audio_play_obj_fil);

figure(5);
subplot(2,1,1);
stem(1:seq_len, x_norm);
xlabel('Sample no. (n)');
ylabel('x(n)');
title('Original Signal');

subplot(2,1,2);
stem(1:seq_len, filtered_x_norm);
xlabel('Sample no. (n)');
ylabel('y(n)');
title('Filtered Signal');


