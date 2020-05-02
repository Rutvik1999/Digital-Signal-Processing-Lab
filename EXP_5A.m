%Write a MATLAB program to plot time and frequency domain characteristics of 
%rectangular, Bartlett, Blackman, Hamming and Hanning window functions with given length. 
%Plot time domain characteristics in one plot for all windows and frequency
%domain characteristics in one plot for all windows. 
%Note: Use inbuilt functions: window.

N = input('Enter value of N : ');
w_rectangular = window(@rectwin, N);
w_bartlett = window(@bartlett, N);
w_blackman = window(@blackman, N);
w_hamming = window(@hamming, N);
w_hanning = window(@hann, N);
figure(1);
plot(1:N,[w_rectangular, w_bartlett, w_blackman, w_hamming, w_hanning]);  
legend('Rectangular', 'Bartlett', 'Blackman', 'Hamming', 'Hanning');
xlabel('N');
ylabel('Amplitude');
title('Time Domain');
A = 1;
N_w = -pi:pi/1024:pi;
H_w_rectangular = freqz(w_rectangular, A, N_w);
H_w_bartlett = freqz(w_bartlett, A, N_w);
H_w_blackman = freqz(w_blackman, A, N_w);
H_w_hamming = freqz(w_hamming, A, N_w);
H_w_hanning = freqz(w_hanning, A, N_w);

figure(2);
plot(N_w, [abs(H_w_rectangular)', abs(H_w_bartlett)', abs(H_w_blackman)', abs(H_w_hamming)', abs(H_w_hanning)']);
legend('Rectangular', 'Bartlett', 'Blackman', 'Hamming', 'Hanning');
xlabel('w');
ylabel('|H(w)|');
title('Frequency Domain');