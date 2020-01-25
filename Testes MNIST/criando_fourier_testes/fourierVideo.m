% aprendendo a fazer fourier 
% seguindo o video
% https://www.youtube.com/watch?time_continue=2&v=nWGirrTlpnk

clear all;
close all;
clc;

% pegando a base
data = load('mnist_test.csv');  

% pegando a primeira imagem
images = data(:, 2:785);
imagem1 = (reshape(images(1,:), 28, 28)');

% exibe imagem
figure;
colormap gray;
imagesc(imagem1);

% pegando a transformada de fourier
F = fft2(imagem1);

% absoluto 
S = abs(F);

% exibe imagem
figure;
colormap gray;
imagesc(S);
title('Imagem Fourier');

%espectro central -> nao entendi muito bem
    % Deslocar o componente de frequência zero 
    % para o centro do espectro
Fsh = fftshift(F);

% exibe imagem
figure;
colormap gray;
imagesc(abs(Fsh));
title('Imagem Fsh');


%logaritmo 
S2 = 10*log10(abs(Fsh));
%video ->
    %apply log transform
    %S3 = log(1+abs(Fsh));

% exibe imagem
figure;
colormap gray;
imagesc(S2);
title('Imagem log10');


figure;
colormap gray;
imagesc(angle(Fsh));
title('Imagem angle Fsh');
    
% %reconstrucao
% F = ifftshift(Fsh);
% f = ifft2(F);
% % exibe imagem
% figure;
% colormap gray;
% imagesc(f);
% title('Imagem reconstruida');


