%questao 1
clear all
close all
clc

x = [1:200];

sinal_1 = 1 * sin(0.1*pi.*x);
sinal_2 = 1.5 * sin(0.5*pi.*x);
sinal_3 = 0.5 * sin(0.75*pi.*x);

sinal_soma = sinal_1 + sinal_2 + sinal_3;

figure;
plot(sinal_soma)

figure;
eixo = linspace(-pi, pi, 200)
tf = abs(fftshift(fft(sinal_soma)))
plot(eixo,tf)


%0.3*pi / pi
[b,a] = butter(4,0.3);
[h,w] = freqz(b,a);
figure;
plot(w,abs(unwrap(angle(h))))

figure;
impz(b,a);


y_f = filter(b,a,sinal_soma);
%y_f = conv(sinal_soma, impz(b,a))
figure;
plot(y_f)

figure;
tf = abs(fftshift(fft(y_f)));
plot(eixo,tf)


%ruido branco
ruido_b = randn(1,10000)*sqrt(0.05);

%soma
y_s = y1'+sinal_soma;
figure;
plot(y_s)

%transfomada de f com ruido
figure;
tfs = abs(fftshift(fft(y_s)))
plot(eixo,tfs)


y_5 = conv(y1, impz(b,a)); %filtro  -----
figure;
plot(y_5)

