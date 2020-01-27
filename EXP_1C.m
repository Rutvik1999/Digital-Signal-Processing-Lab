%Write a MATLAB program for generation of an audio tone with
%given amplitude, frequency, phase, sampling frequency 
%and length of the sequence. Store it in .wav file with given 
%sampling frequency and BitsPerSample, read back and play the audio file.

amp = input('Enter Amplitude : ');
freq = input('Enter frequency : ');
phase = input('Enter Phase : ');
s_freq = input('Enter Sampling Frequency : ');
seq_len = input('Enter Sequence Length : ');
f = freq / s_freq;
n = 0:(seq_len - 1);
x = amp * sin((2 * pi * f * n ) + phase);
disp('Signal Generated');
bit_rate = input('Enter bit rate : ');
audiowrite('EXP_1C_audio.wav', x, s_freq,'BitsPerSample',bit_rate);
audio_read_obj = audioread('EXP_1C_audio.wav');
audio_play_obj = audioplayer(audio_read_obj, s_freq);
play(audio_play_obj);