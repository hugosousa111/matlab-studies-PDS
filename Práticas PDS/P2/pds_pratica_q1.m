%questao 1
x = [1:200];

sinal_1 = 1 * sin(0.1*pi.*x);
sinal_2 = 1.5 * sin(0.5*pi.*x);
sinal_3 = 0.5 * sin(0.75*pi.*x);

sinal_soma = sinal_1 + sinal_2 + sinal_3;

figure;
plot(sinal_soma)

%questao 2

m1 = 0;
m2 = 3;

for x = 1:197
    y(x) = (1/4)*(sinal_soma(m1+1) + sinal_soma(m1+2)+sinal_soma(m1+3)+sinal_soma(m1+4));
    m1 = m1+1;
    m2 = m2+1;
end

hold on;
plot(y) %serve como um filtro passa baixa, fica como se fosse o sinal 1


