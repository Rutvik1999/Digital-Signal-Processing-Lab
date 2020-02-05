clc;
close all;
B = input('Enter Coeffecients of Numerator of the transfer function : ');
A = input('Enter Coeffecients of Denominator of the transfer function : ');
%for part A
% B = [1]
% A = [1 -1]

%for part B
% B = [1]
% A = [1 1/2 -1/3]
[Z, P, K] = tf2zpk(B, A); %find poles and zeros
figure(1);
zplane(B, A);
title('f(z) plot');
if(isstable(B, A)) %is system stable
    disp('System is Stable');
else 
    disp('System is Unstable');
end

N = 256; %number of samples required (for plotting)
[h, n] = impz(B, A, N);
figure(2);
stem(n, h);
title('Unit impulse Response');

[s, n] = stepz(B, A, N);
figure(3);
stem(n, s);
title('Unit Step Response');
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

