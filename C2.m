clear all
close all
clc

[y,fs] = audioread('musique.wav');
Y = fft(y);
figure("Name","Spectral Analysis")
plot(abs(Y))

player = audioplayer(y,fs);
play(player);
SampleRate = player.SampleRate
Quantization = player.BitsPerSample
%spectrogram(y,1024,[],[],fs);

fmin = 0;
fmax = 10000;
[npt, echelle] = codeur(y, fs, Quantization, fmin, fmax,'newmusique.wav');

