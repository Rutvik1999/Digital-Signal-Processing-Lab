 %Consider  a  discrete  time  message signal  m(n)  containing  sum  of  three  sinusoids  with amplitudes 
 %and  frequencies  (i)  1,  500Hz  (ii)  0.5,  600Hz and  (iii)  2,  700Hz. 
 %It  is  used  to  modulate  a  sinusoidal carrier   signal   c(n)   having  
 %peak   amplitude   1   and frequency  of  2.5  kHz  to  generate  a  double  
 %sideband signal  given  by  s(n)  =  m(n).c(n).  The  sampling  rate  is 10kHz. 
 %Generate  4096  samples  of  m(n),  c(n)  and  s(n) and  plot  500  samples  of  all 
 %of  them  in  one  graph  with proper   labels   and   titles.   The   signal   s(n)  
 %is   passed through  a  filter  given  in  figure.  Check  pole-zero  and stability of filter.
 %Obtain the output signal y(n) and plot its  500  samples.  Ensure  peak  amplitudes  of  all  signals in range [-1,1]. 
 
 clc;
close all;
B = [0.1 -0.8];
A = [1 0.08 -0.05];
s_freq = 10000;
seq_len = 4096;
f500 = 500 / s_freq;
f600 = 600 / s_freq;
f700 = 700 / s_freq;

n = 0:(seq_len - 1);
m = (1*sin((2 * pi * f500 * n )) + 0.5*sin((2 * pi * f600 * n )) + 2*sin((2 * pi * f700 * n )));
m_norm = m / max(abs(m));
figure(1);
subplot(4,1,1);
stem(n(1:500),m_norm(1:500));
xlabel('n');
ylabel('amplitude of normalized m(n)');
title('message signal');
disp('Signal Generated');

c = sin(2 * pi * (2500/s_freq) * n);
c_norm = c/max(abs(c));
subplot(4,1,2);
stem(n(1:500),c_norm(1:500));
xlabel('n');
ylabel('amplitude of normalized c(n)');
title('carrier signal');

s = c_norm .* m_norm;
s_norm = s/max(abs(s));
subplot(4,1,3);
stem(n(1:500),s_norm(1:500));
xlabel('n');
ylabel('amplitude of normalized s(n)');
title('modulated signal');



[Z, P, K] = tf2zpk(B, A); %find poles and zeros

if(isstable(B, A)) %is system stable
    disp('System is Stable');
else 
    disp('System is Unstable');
end


y_filtered = filter(B, A, s_norm);
subplot(4,1,4);
stem(n(1:500),y_filtered(1:500));
xlabel('n');
ylabel('filtered signal amplitude');
title('Filtered signal');

figure(2);
zplane(B, A);
title('H(z) plot');