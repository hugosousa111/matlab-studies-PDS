%% limpar variaveis, limpar console, fechar telas
clear; clc; close all;

%% carregando imagem
imdata = imread('lenna.jpg');
figure;
imshow(imdata); 
title('Original Lenna');

%% cinza
imdata_g = rgb2gray(imdata);
figure;
imshow(imdata_g); 
title('Cinza Lenna');

%% filtro escolhido 
% blur
filtro = [-2 -1 0; -1 1 1;0 1 2];

%% chamando a funcao convolucao 
images_C_train = convH(imdata_g, filtro);

%% cinza
figure(7);
imshow(uint8(images_C_train)); 
title('conv Lenna');

%% fourier
tic
F = fft2(imdata_g);
toc

tic
%F_2 = fftH(double(imdata_g));
toc

% Fourier transform of an image
S = abs(F);
figure(3);imshow(S,[]);title('Fourier transform of an image');

%get the centered spectrum
Fsh = fftshift(F);
figure(4);imshow(abs(Fsh),[]);title('Centered fourier transform of Image')

%apply log transform
S2 = log(1+abs(Fsh));
figure(5);imshow(S2,[]);title('log transformed Image')
%reconstruct the Image
F = ifftshift(Fsh);
f = ifft2(F);
figure(6);imshow(f,[]),title('reconstructed Image')

% %% exibindo uma das imagens
% % colormap gray
% % % faz a imagem
% % imagesc(reshape(images_train(50,:), 28, 28)')
% 
% % filtro escolhido
% % blur
% filtro = [-1 -2 -1; 0 0 0;1 2 1];
% 
% %% chamando a funcao convolucao
% images_C_train = convH_g(images_train, filtro);
% images_C_test = convH_g(images_test, filtro);