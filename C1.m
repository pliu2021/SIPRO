clear all
close all
clc
%% C1.1
Nt = 12800;
fs = 1000;
f(1) = fs*5/128;
x(1) = 1/fs;
a = 1;
phi = 0;
for n = 2:Nt
    x(n) = n/fs;
    if n >= 0 && n <= Nt
        y(n) = a*cos(2*pi*n/fs + phi);
    else
        y(n) = 0;
    end
end
figure(1)
plot(x,y)


Fdc = fft(y);
figure(2)
plot(x,abs((1/fs)*Fdc*(f/fs)));






%plot(f,abs(tfx))