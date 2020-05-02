%Write a MATLAB program to design an IIR digital bandstop filter using Butterworth approximation. 
%Determine order, cut off frequency, pole-zero pattern and frequency response plots. 
%Obtain second order cascade structure for the designed IIR filter.

%|H(w)| <= 0.01;         0<=|w|<=0.3pi;
%0.89<=|H(w)| <= 1;   0.45pi<=|w|<=0.65pi
%|H(w)|<=0.01;           0.75<=|w|<=pi

%Note: Use in-built functions: buttord, butter, tf2sos.

delta_s = 0.01;
delta_p = 1 - 0.89;
Ap = -20*log10(1 - delta_p);
As = -20*log10(delta_s);
w_p = [0.45 0.65];
w_s = [0.3 0.75];
[N_butter, Wn_butter] = buttord(w_p, w_s, Ap, As);
[B_butter, A_butter] = butter(N_butter, Wn_butter, 'stop');
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