% Design a digital linear phase FIR highpass filter with 
% following specifications using proper window function : 
% (Select window function analytically)
% wp = 0.3*pi, ws = 0.2*pi
% Ap = 0.25dB, As = -50dB

% Write a MATLAB program to calculate all the required parameters 
% (only select window analytically), 
% plot the frequency response in 0 to pi range. 
% Determine stop band attenuation and passband ripple of designed filter. 
% Display the filter is meeting the designed specifications or not.
% Note: Use the inbuilt functions fir1 and window.

clc;
close all;
clear;

wp = 0.3*pi;    % Passband Edge Frequency
ws = 0.2*pi;    % Stopband Edge Frequency
Ap = 0.25;      % Peak Passband Deviation/Ripple(dB)
As = -50;       % Minimum Stopband Attenuation(dB)

Wp = 0.3;       % Normalised value of frequency
Ws = 0.2;

Wc = (Wp + Ws)/2;   % Cutoff Frequency
disp('Cutoff Frequency : ');
disp(Wc);
transition_width = (Wp - Ws)*pi;    % Transition Width

% As As = –50dB. Both Hamming and Blackman can provide attenuation 
% less than –50dB. We can choose the Hamming window, which
% provides the smaller transition width.
% Hence has the smaller length.

% transition_width = (6.6*pi)/M
% Length of filter (M) must be odd (Analitically)
M = ceil(6.6*pi/transition_width);  % Length of filter
if(rem(M,2)==0)
    M=M+1;      % Length of Filter must be odd
end

disp('Filter Length : ');
disp(M);
n = 0:M-1;      % Order of filter
WIN = window(@hamming, M); 

B = fir1(M-1, Wc, 'high', WIN);
disp('Filter Coefficients : ');
disp(B);

figure(1);      % Plot frequency response of designed frequency
freqz(B,1);
title('Frequency Reesonse of Designed Filter');

% Determine the passband ripple and stopband attenuation
w = Wp*pi:pi/255:pi;
Hp = freqz(B,1,w);
Hpmag = abs(Hp);
Hpdb = 20*log10(Hpmag);
Ap = max(Hpdb);
disp('Passband Ripple (dB) : ');
disp(Ap);

w = 0:pi/255:Ws*pi;
Hs = freqz(B,1,w);
Hsmag = abs(Hs);
Hsdb = 20*log10(Hsmag);
As = max(Hsdb);
disp('Stopband Attenuation (dB) : ');
disp(As);