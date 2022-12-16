clear all
close all
clc

[y,fs] = audioread('musique.wav');
fs
Y = fft(y);
figure("Name","Spectral Analysis")
subplot(Y)



play(audioplayer(y,fs));
