% Video aula
% https://www.youtube.com/watch?v=9onT6_pz4ks

data = load('mnist_test.csv');
%size(data)
%10000         785
% imagens sao 28 * 28 = 784 pixels
%pq o primeiro eh a classe
% data(1,1)

%todas as linhas da primeira coluna
labels = data(:,1);

% resto sao as imagens
images = data(:, 2:785);

% pegar primeira imagem e 
% reorganizar pra ficar uma matrix
%  reshape(images(1,:), 28, 28);

colormap gray
% faz a imagem 
imagesc(reshape(images(1,:), 28, 28)')
