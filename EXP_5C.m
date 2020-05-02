%Bandpass filter with given specs.
%|H(w)| <= 0.01;         0<=|w|<=0.25pi;
%0.95<=|H(w)| <= 1.05;   0.3pi<=|w|<=0.6pi
%|H(w)|<=0.01;           0.65<=|w|<=pi

w_lp = 0.3*pi;
w_ls = 0.25*pi;
w_hp = 0.6*pi;
w_hs = 0.65*pi;
w_l = (w_lp + w_ls)/2;
w_h = (w_hp + w_hs)/2;

transition_width_l = abs(w_lp - w_ls);
transition_width_h = abs(w_hp - w_hs);
transition_width = min(transition_width_l, transition_width_h);
%As = -20 * log10(0.01); required
%Ap = 20 * log10(1.05); required
M = ceil(6.2*pi/transition_width);  % Length of filter
if(rem(M,2)==0)
    M=M+1;      % Length of Filter must be odd
end

disp('Filter Length : ');
disp(M);
n = 0:M-1;      % Order of filter
WIN = window(@hann, M); 
w_h_norm = w_h/pi;
w_l_norm = w_l/pi;
B = fir1(M-1,[w_l_norm w_h_norm], 'bandpass', WIN);
disp('Filter Coefficients : ');
disp(B);

figure(1);      % Plot frequency response of designed frequency
freqz(B,1);
title('Frequency Reesonse of Designed Filter');

% Determine the passband ripple and stopband attenuation
w = w_lp*pi:pi/255:w_hp;
Hp = freqz(B,1,w);
Hpmag = abs(Hp);
Hpdb = 20*log10(Hpmag);
Ap = max(Hpdb);
disp('Passband Ripple (dB) : ');
disp(Ap);

w = [0:pi/255:w_ls w_hs:pi/255:pi];
Hs = freqz(B,1,w);
Hsmag = abs(Hs);
Hsdb = 20*log10(Hsmag);
As = max(Hsdb);
disp('Stopband Attenuation (dB) : ');
disp(As);
