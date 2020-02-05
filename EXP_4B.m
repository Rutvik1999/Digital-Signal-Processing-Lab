%Write a MATLAB program to generate a signal x(n)=2n (0.95)^n; 0?n?99. 
%Corrupt it by additive random noise with amplitude in interval [-0.5 0.5].
%Apply the signal to a Moving average filter with given tap length. 
%Plot the input signal, noise signal, corrupted signal and 
%filtered signal in same plot. Use proper labels and legends.
%Note: Use inbuilt functions: rand, filter 

n = 0:1:99;
amp = 1;
x = amp .* 2 .* n .* (0.95) .^ n;
noise = rand(1, 100) - 0.5;
x_noisey = x + noise;
M = input('Enter value of M (tap length): ');
B = (1/M) .* ones(1, M);
A = 1;
x_filtered = filter(B, A, x_noisey);
figure(1);
subplot(4,1,1);
stem(n, x);
xlabel('n');
ylabel('x(n)');
title('Input Signal');
subplot(4,1,2);
stem(n, noise);
xlabel('n');
ylabel('noise amplitude');
title('Noise Signal');
subplot(4,1,3);
stem(n, x_noisey);
xlabel('n');
ylabel('x(n) + noise');
title('Corrupted Signal');
subplot(4,1,4);
stem(n, x_filtered);
xlabel('n');
ylabel('filtered x(n)');
title('Filtered Signal');
