%clear;
clc;

matriz = [1 1 1 3 5; 4 6 4 8 5; 30 0 1 5 5; 0 2 2 4 5];

filtro = [1 0; 0 1];

%C = conv2(matriz, filtro,'full')
%C = [1 1 1 3 0;4 7 5 9 3;30 4 7 9 8;0 32 2 5 5;0 0 2 2 4]

%C = conv2(matriz, filtro,'same')
%C = [7 5 9 3;4 7 9 8;32 2 5 5;0 2 2 4]


C = conv2(matriz, filtro,'valid') 
%C = [7 5 9;4 7 9;32 2 5] %----> igual ao do video 

% https://www.youtube.com/watch?v=ZOXOwYUVCqw&t=614s