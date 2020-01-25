clear all;
close all;
clc;

load train.mat;

%sound(y);
%sound(y,3*Fs);
%sound(y,Fs/2);


%%questao 2
figure;
plot(y);


figure;
eixo = linspace(-pi, pi, 12880);
tf = abs(fftshift(fft(y)));
tf = 10*log10(tf);
plot(eixo,tf);

%%questao 3
ruidoB = wgn(12880,1,randn*sqrt(0.1),0.01);
%disp('var');
%var(ruidoB);
%disp('mean');
%mean(ruidoB);

y_ruidoso = y + ruidoB;

figure;
plot(y_ruidoso);


figure;
eixo = linspace(-pi, pi, 12880);
tf = abs(fftshift(fft(y_ruidoso)));
tf = 10*log10(tf);
plot(eixo,tf);

%sound(y_ruidoso)

%%questao 4


%%questao 5

%0.3*pi / pi
[b,a] = butter(6,0.3);
%[b,a] = butter(2,0.3,'high');
[h,w] = freqz(b,a);
figure;
plot(w,abs(unwrap(angle(h))));
figure;
plot(w,unwrap(abs(h)));

figure;
impz(b,a);


%%questao 6
figure;
zplane(b,a);

%%questao 7
fvtool(b,a);

%%questao 8
y_f = filter(b,a,y_ruidoso);
%y_f = conv(y_ruidoso, impz(b,a));
figure;
plot(y_f);

%%questao 9

figure;
eixo = linspace(-pi, pi, 12880);
tf = abs(fftshift(fft(y_f)));

plot(eixo,tf);

%sound(y_f);
