%questao 3

funcao_1 = ones(1,201);
funcao_2 = [zeros(1,20) ones(1,181)];
funcao_3 = [zeros(1,40) ones(1,161)];

funcao_soma = funcao_1 + funcao_2 + funcao_3;

figure;
plot(funcao_soma)

%questao 4

m1 = 0;
m2 = 10;

for x = 1:190
    y(x) = (1/11)*(funcao_soma(m1+1)+funcao_soma(m1+2)+funcao_soma(m1+3)+funcao_soma(m1+4)+funcao_soma(m1+5)+funcao_soma(m1+6)+funcao_soma(m1+7)+funcao_soma(m1+8)+funcao_soma(m1+9)+funcao_soma(m1+10)+funcao_soma(m1+11));
    m1 = m1+1;
    m2 = m2+1;
end

hold on;
plot(y)

%ta suavisando, nao deixa mudancas brucas no sinal