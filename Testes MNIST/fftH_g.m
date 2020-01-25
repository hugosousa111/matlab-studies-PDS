function retorno = fftH_g(imagens)
    % pega a base e chama varias vezes a funcao de fourier pra cada imagem
    
    % pegando o tamanho da matriz imagem
    [l,c] = size(imagens);
    
    % matriz que vai guardar as imagens depois da fourier
    % pre-alocando
    imagens_F = zeros(l,676);
    
    for a = 1:l
        % organizo no formado 26x26 como uma imagem
        imagem = reshape(imagens(a,:), 26, 26)'; 
        
        % faz a transformada
        % aux = fftH(imagem);
        aux = fft2(imagem);
        
        % reorganizo do formado 26x26 para 1x676
        % e guardo dentro da variavel que vai retornar
        imagens_F(a,:) = (reshape(aux(:,:)', 676, 1)');
        %disp(a)
    end
    
    retorno = imagens_F;
end
