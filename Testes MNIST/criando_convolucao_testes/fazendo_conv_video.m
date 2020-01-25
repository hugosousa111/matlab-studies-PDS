clear
clc
imagem = [1 1 1 3 5; 4 6 4 8 5; 30 0 1 5 5; 0 2 2 4 5];
filtro = [1 0; 0 1];

[l_f,c_f] = size(filtro);
[l_i,c_i] = size(imagem);


imagem_conv = zeros(l_i-l_f+1, c_i-c_f+1); %igual ao valid
%pre estabelece o tamanho da imagem convoluida, 
% esses valores foram de acordo com os teste
% imagem(4x4) * filtro(2x2) -> conv(3x3)
% imagem(28x28) * filtro(3x3) -> conv(26x26)

for a = 1:l_i-l_f+1 %l_i 
    for b = 1:c_i-c_f+1%c_i
        acumulador = 0;
        for j = 1:l_f
            % percorre todas as linhas do filtro
            for k = 1:c_f
                % percorre todas as colunas do filtro
                acumulador = acumulador + imagem(j+a-1,k+b-1)*filtro(j,k);
                % imagem(j+a-1,k+b-1) vai pulando na imagem, imagezinhas do
                % tamanho do filtro para convoluir
            end
        end
        imagem_conv(a,b) = acumulador;
    end
end

