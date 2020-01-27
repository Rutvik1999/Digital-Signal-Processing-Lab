%Write a MATLAB program for generation of DT unit impulse, step, and 
%ramp sequence for a given initial time, final time and start of sequence.

initial_time = input('Enter initial time :');
final_time = input('Enter final time :');
n0 = input('Enter start of sequence (n0) :');

n = initial_time:1:(final_time);
figure(1);

%unit impulse
unit_impulse = (n == n0);
subplot(3,1,1)
stem(n, unit_impulse);
title('Unit Impulse')
xlabel('Time');
ylabel('Amplitude');

%unit step
unit_step = (n >= n0);
subplot(3,1,2);
stem(n, unit_step);
title('Unit Step');
xlabel('Time');
ylabel('Amplitude');

%ramp
ramp = (n - n0) .* unit_step;
subplot(3,1,3);
stem(n, ramp);
title('Ramp');
xlabel('Time');
ylabel('Amplitude');

