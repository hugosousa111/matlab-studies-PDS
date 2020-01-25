clear all;
close all;
clc;

imagem = [1 1 1 3 5; 4 6 4 8 5; 30 0 1 5 5; 0 2 2 4 3; 1 1 1 3 5];

[l,c] = size(imagem);
% numero de linhas e colunas da imagem
    
% imagem de retorno
imagem_fourier = zeros(l, c);

% transformada
F = fft2(imagem);
Fsh = fftshift(F);

m = l;
n = c;
for p = 0:m-1
    for q = 0:n-1
        acumulador = 0;
        for j = 0:m-1
            for k = 0:n-1
                % aplicando a funcao de transformada de fourier 2d
                % e acumulando os valores
                acumulador = acumulador + (exp((((-2)*pi*1i)/m)*j*(p-m)) * exp((((-2)*pi*1i)/n)*k*(q-n)) * imagem(j+1,k+1));
            end
        end
        % pegando o resultado e colocando no pixel certo
        imagem_fourier(p+1,q+1) = acumulador;
    end
end

% acumulador = 0;
% for j = 0:l-1
%     for k = 0:c-1
%     	acumulador = acumulador + (exp((((-2)*pi*1i)/m)*j*(l-3)) * exp((((-2)*pi*1i)/n)*k*(c-3)) * imagem(j+1,k+1));
%         %acumulador = acumulador + exp(-i*2*pi*(((1/l)*m) + ((1/c)*n))) * imagem(j+1,k+1);
%     end
% end





