clear all
close all
clc
%% C.1.4.a
Nt = 128;
fs = 1000;
f0 = 5/128*fs;
a = 1;
phi = 0;
for n = 1:Nt-1
    y(n) = sinewave(n/fs,a,f0,phi);
    x(n) = n/fs;
end
figure("Name","C.1.4.a: The signal in function of time")
plot(x,y)

function x = sinewave(t,a,f0,phi)
    x = a * cos(2*pi*f0*t+phi);
end