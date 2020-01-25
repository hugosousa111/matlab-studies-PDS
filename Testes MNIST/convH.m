function retorno = convH(imagem, filtro)
    [l_f,c_f] = size(filtro);
    [l_i,c_i] = size(imagem);


    imagem_conv = zeros(l_i-l_f+1, c_i-c_f+1); %igual ao valid
    % pre estabelece o tamanho da imagem convoluida, 
    % esses valores foram de acordo com os teste
    % imagem(4x4) * filtro(2x2) -> conv(3x3)
    % imagem(28x28) * filtro(3x3) -> conv(26x26)

    for a = 1:l_i-l_f+1
        for b = 1:c_i-c_f+1
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
            %guarda o valor na posicao correta
            imagem_conv(a,b) = acumulador;
        end
    end

    retorno = imagem_conv;
end