function retorno = convH_g(imagens, filtro)
    % pega a base e chama varias vezes a convolução pra cada imagem
    
    % pegando o tamanho da matriz imagem
    [l,c] = size(imagens);
    
    % matriz que vai guardar as imagens convoluidas
    % pre-alocando
    imagens_C = zeros(l,676);
    
    for a = 1:l
        % organizo no formado 28x28 como uma imagem
        imagem = reshape(imagens(a,:), 28, 28)'; 
        
        % faz a convolucao
        aux = convH(imagem, filtro);
        
        % reorganizo do formado 26x26 para 1x676
        % e guardo dentro da variavel que vai retornar
        imagens_C(a,:) = (reshape(aux(:,:)', 676, 1)');
    end
    
    retorno = imagens_C;
end