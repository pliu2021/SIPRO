clear all
close all
clc
%% C.1.1.a
Nt = 128;
fs = 1000;
f0 = 5/128*fs;
f(1) = fs*5/128;
x(1) = 0;
a = 1;
phi = 0;
for n = 2:Nt
    x(n) = n/fs;
    if n >= 0 && n <= Nt
        y(n) = sinewave(x(n),a,f0,phi);
    else
        y(n) = 0;
    end
end
figure("Name","C.1.1.a:Plot of magnitude spectrum")
plot(x,y)

Fdc11a = fft(y);
figure(10);
plot(Fdc11a);

%% C.1.1.b
Fdc = fft(y);
figure("Name","C1.1.b:Plot of magnitude spectrum for its Fourier Transform")
plot(x,abs((1/fs)*Fdc*(f/fs)));

%% C.1.3
clear n
for n = 1:Nt
    x(n) = n/fs;
    if n >= 0 && n <= Nt
        y13(n) = x(n)*(n/fs);
    else
        y13(n) = 0;
    end
end
figure("Name","C.1.3: The plot of the signal")
plot(x,y13)
Nf = 3;
[f13,tfx13] = transffourier(y13,Nf,fs,Nt);
figure("Name","C.1.3: The magnitude spectrum of its Fourier Transform")
plot(f13,abs(tfx13),"*")

%% C.1.4.a
Nt14 = 128;
fs = 1000;
f0 = 5/128*fs;
a = 1;
phi = 0;
for n = 1:Nt14-1
    y14(n) = sinewave(n/fs,a,f0,phi);
    x14(n) = n/fs;
end
figure("Name","C.1.4.a: The signal in function of time")
plot(x14,y14)

%% C.1.4.b
Nf = 1;
[f14,tfx14] = transffourier(y14,Nf,fs,Nt14-1);
figure("Name","C.1.4: The magnitude spectrum of its Fourier Transform")
plot(f14,abs(tfx14),"*")

function x = sinewave(t,a,f0,phi)
    x = a * cos(2*pi*f0*t+phi);
end

function [f,tfs] = transffourier(y,Nf,fs,Nt)
j = 1;
k = 1;
for i = 1:Nf
    Ynfk1 = 0;
    for n = 1:Nt
        Ynfk1 = Ynfk1 + y(n)*exp(-j*2*pi*k*n/Nf);
    end
    Ynfk(i) = Ynfk1;
    f(i) = k*fs/Nf;
end
tfs = Ynfk/fs;
end


