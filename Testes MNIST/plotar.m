%Função utiizada para plotar o valor dos atributos de cada sinal.
function plt = plotar(c1, c2)
    x1 = 1:length(c1);
    x2 = length(c1)+1:length(c1)+length(c2);
    plot(x1, c1, 'bo', x2, c2, 'rs');
    %title(t);
end