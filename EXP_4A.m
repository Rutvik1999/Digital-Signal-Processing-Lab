% For M-tap moving average filter, plot the magnitude and phase response 
% for different values of M using MATLAB. 
% Note: Use inbuilt function: freqz.

M = input('Enter value of M: ');
B = (1/M) .* ones(1, M);
A = 1;
figure(1);
zplane(B, A);
title('f(z) plot');

figure(2);
W = -pi:pi/255:pi;
H = freqz(B, A, W);
subplot(2,1,1);
plot(W, abs(H));
xlabel('W');
ylabel('Magnitude of H(W)');
title('Magnitude Plot of Frequency response');
subplot(2,1,2);
plot(W, angle(H));
xlabel('W');
ylabel('Angle  of H(W)');
title('Angle Plot of Frequency response');

