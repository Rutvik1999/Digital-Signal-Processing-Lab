%(i) Write a MATLAB program to design an IIR digital lowpass filter using 
%Butterworth, Chebyshev-I, Chebyshev-II and Elliptic approximation. 
%Determine order, cut off frequency, pole-zero pattern and frequency response plots in each case. 
%Obtain second order cascade structure for the designed IIR filter.
%Specifications: 
%w_p = 0.35pi    delta_p = 0.1
%w_s = 0.65pi    delta_s = 0.1
%Note: Use in-built functions: buttord, butter, cheb1ord, cheby1, cheb2ord, cheby2, ellipord, ellip, tf2sos.
delta_s = 0.1;
delta_p = 0.1;
Ap = -20*log10(1 - delta_p);
As = -20*log10(delta_s);
w_p = 0.35;
w_s = 0.65;
[N_butter, Wn_butter] = buttord(w_p, w_s, Ap, As);
[B_butter, A_butter] = butter(N_butter, Wn_butter, 'low');
figure(1);
zplane(B_butter, A_butter);
title('Pole-Zero Plot for Butterworth Design');
printer = sprintf('For Butterworth Filter');
disp(printer);
printer = sprintf('Order of Filter = %f',N_butter);
disp(printer);  %#ok<*DSPS>
printer = sprintf('Cut off Frequency = %f',Wn_butter);
disp(printer);
figure(2);
w = -pi:pi/2048:pi;
H_butter = freqz(B_butter, A_butter, w);
subplot(2,1,1);
plot(w,abs(H_butter));
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Response Plot (Butterworth)');
subplot(2,1,2);
plot(w,angle(H_butter));
xlabel('Frequency');
ylabel('Phase');
title('Phase Response Plot (Butterworth)');
[SOS_butter, G_butter] = tf2sos(B_butter, A_butter);
disp('Second Order Sections :');
disp(SOS_butter);

%Chebyshev I filter
[N_cheby1, Wp_cheby1] = cheb1ord(w_p, w_s, Ap, As);
[B_cheby1, A_cheby1] = cheby1(N_cheby1, Ap, Wp_cheby1,'low');

figure(3);
zplane(B_cheby1, A_cheby1);
title('Pole-Zero Plot for Chebyshev 1 Design');
printer = sprintf('For Chebyshev 1 Filter');
disp(printer);
printer = sprintf('Order of Filter = %f',N_cheby1);
disp(printer);
printer = sprintf('Cut off Frequency = %f',Wp_cheby1);
disp(printer);
figure(4);
H_cheby1 = freqz(B_cheby1, A_cheby1, w);
subplot(2,1,1);
plot(w,abs(H_cheby1));
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Response Plot (Chebyshev 1)');
subplot(2,1,2);
plot(w,angle(H_cheby1));
xlabel('Frequency');
ylabel('Phase');
title('Phase Response Plot (Chebyshev 1)');
[SOS_cheby1, G_cheby1] = tf2sos(B_cheby1, A_cheby1);
disp('Second Order Sections :');
disp(SOS_cheby1);


%Chebyshev II filter
[N_cheby2, Ws_cheby2] = cheb2ord(w_p, w_s, Ap, As);
[B_cheby2, A_cheby2] = cheby2(N_cheby2, As, Ws_cheby2,'low');

figure(5);
zplane(B_cheby2, A_cheby2);
title('Pole-Zero Plot for Chebyshev 2 Design');
printer = sprintf('For Chebyshev 2 Filter');
disp(printer);
printer = sprintf('Order of Filter = %f',N_cheby2);
disp(printer);
printer = sprintf('Cut off Frequency = %f',Ws_cheby2);
disp(printer);
figure(6);
H_cheby2 = freqz(B_cheby2, A_cheby2, w);
subplot(2,1,1);
plot(w,abs(H_cheby2));
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Response Plot (Chebyshev 2)');
subplot(2,1,2);
plot(w,angle(H_cheby2));
xlabel('Frequency');
ylabel('Phase');
title('Phase Response Plot (Chebyshev 2)');
[SOS_cheby2, G_cheby2] = tf2sos(B_cheby2, A_cheby2);
disp('Second Order Sections :');
disp(SOS_cheby2);

%elliptical
[N_ellip, Wp_ellip] = ellipord(w_p, w_s, Ap, As);
[B_ellip, A_ellip] = ellip(N_ellip, Ap, As, Wp_ellip,'low');

figure(7);
zplane(B_ellip, A_ellip);
title('Pole-Zero Plot for Elliptical Design');
printer = sprintf('For Elliptical Filter');
disp(printer);
printer = sprintf('Order of Filter = %f',N_ellip);
disp(printer);
printer = sprintf('Cut off Frequency = %f',Wp_ellip);
disp(printer);
figure(8);
H_ellip = freqz(B_ellip, A_ellip, w);
subplot(2,1,1);
plot(w,abs(H_ellip));
xlabel('Frequency');
ylabel('Magnitude');
title('Magnitude Response Plot (Elliptical)');
subplot(2,1,2);
plot(w,angle(H_ellip));
xlabel('Frequency');
ylabel('Phase');
title('Phase Response Plot (Elliptical)');
[SOS_ellip, G_ellip] = tf2sos(B_ellip, A_ellip);
disp('Second Order Sections :');
disp(SOS_ellip);

