clear all;
close all;
clc;

imagem = [1 1 1 3 5; 4 6 4 8 5; 30 0 1 5 5; 0 2 2 4 3; 1 1 1 3 5; 1 2 3 4 5];

F = fft2(imagem);
F_H = fftH(imagem);