%limpar variaveis
clear; 
%limpar tela
clc; 
%fechar telas
close all; 

%carrega a base
data = load('mnist_test.csv'); 

%classes das imagens
labels = data(:,1);

% imagens eh o resto
images = data(:, 2:785);

% imagem 1 que ta na primeira linha
imagem1 = (reshape(images(1,:), 28, 28)');

% exibe imagem
colormap gray
imagesc(imagem1)
%saveas(imagem1,'imagem.jpg')

% filtro
filtro = [0.0625 0.125 0.0625; 0.125 0.25 0.125;0.0625 0.125 0.0625];

% convolucao da imagem 1 com o filtro
C = conv2(imagem1, filtro,'valid');

%'valid' - 26x26
%'same' - 28x28
%'full'/defalt - 30x30

% exibindo a imagem toda doida
figure;
colormap gray
imagesc(C)
%se tiver usado um filtro que deixa valores negativos
% fica num tom de cinza diferente


% passando por essa funcao de ativacao 
% pra tirar os negativos
C_2 =  max (0,C);

% exibindo imagem final estranha
figure;
colormap gray
imagesc(C_2)

