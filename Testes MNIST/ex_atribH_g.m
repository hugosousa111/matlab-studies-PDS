function retorno = ex_atribH_g(imagens)
    % usa a funcao ex_atrib para tirar os atributos de cada imagem
    [l,c] = size(imagens);
    
    % matriz que vai guardar os atributos
    % pre-alocando
    atrib_imgs = zeros(l,4);
    
    for a = 1:l
        atrib_imgs(a,:) = ex_atrib(imagens(a,:));
    end
    
    retorno = atrib_imgs;
end