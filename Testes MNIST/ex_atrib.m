function retorno = ex_atrib(x)
    %extrair os atributos
    atributos = zeros(1, 4);
    
    atributos(1) = mean(x); %media
    % mean(mean(C)) %igual

    %var(x); %variancia

    atributos(2) = std(x); %desvio padrao
    %sqrt(var(x))
    
    atributos(3) = skewness(x); %assimetria

    atributos(4) = kurtosis(x); %curtose
    
    retorno = atributos;
end