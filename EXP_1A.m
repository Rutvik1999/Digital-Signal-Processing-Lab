%Write a MATLAB program to plot the discrete sine wave with given 
%amplitude, frequency, phase, sampling frequency and
%length of the sequence. Also observe first alias.
amp = input('Enter Amplitude : ');
freq = input('Enter Frequency : ');
phase = input('Enter Phase : ');
freq_s = input('Enter Sampling Frequency : ');
seq_len = input('Enter Sequence Length Plot : ');
seq = 0:1:seq_len-1;
f = freq/freq_s;

x1 = amp * cos(2*pi*f*seq + phase);
figure(1);
subplot(2,1,1);
stem(seq, x1);
title('DT Signal (Original)');
xlabel('Time');
ylabel('DT Signal Amplitude')

x2 = amp * cos(2*pi*(f + 1)*seq + phase);
subplot(2,1,2);
stem(seq, x2);
title('DT Signal (first Alias)');
xlabel('Time');
ylabel('DT Signal Amplitude')