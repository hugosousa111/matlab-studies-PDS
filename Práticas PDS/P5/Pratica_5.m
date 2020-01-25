% filtragem de um sinal de audio

close all; clear; clc;

load y_desafio2.mat;

Fs = 44100;
n = 0:(length(y_desafio2)-1);
%sound(y_desafio2, Fs);

%plot(y_desafio2)

figure;
eixo = linspace(-pi, pi, 61440);
tf = abs(fftshift(fft(y_desafio2)));
%tf = 10*log10(tf);
plot(eixo,tf);

%[b,a] = butter(10,0.63,'high');
[b,a] = butter(10,[0.2 0.4]);
%[b,a] = butter(10,0.45,'high');

y_f = filter(b,a,y_desafio2);

figure;
plot(y_f);

figure;
tf = abs(fftshift(fft(y_f)));
%tf = 10*log10(tf);
plot(eixo,tf);

%sound(y_f, Fs)

%Newy = sin(y_f);

%sound(y_f, Fs)

for p = 1:61440
    New_y_f(p,1) = sin(0.3*pi*p)*y_f(p);
end

figure;
tf = abs(fftshift(fft(New_y_f)));
%tf = 10*log10(tf);
plot(eixo,tf);

%sound(New_y_f, Fs)


[b,a] = butter(10,0.25, 'low');
y_f = filter(b,a,New_y_f);

figure;
tf = abs(fftshift(fft(y_f)));
%tf = 10*log10(tf);
plot(eixo,tf);

sound(y_f, Fs)
% botao 