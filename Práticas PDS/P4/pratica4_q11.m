clear; clc; close all;

% questao 1 ***************************

% sinal aletorio binario
b = randi([0, 1], [1, 10000]);
%sum(b) % probabilidade de 1 e 0 eh 0.5

figure;
% visualizando 
plot(b, 'o');
title('sinal b'); 

% questao 2 ***************************

% resposta ao impulso
h = [1 1 0.5 0.4 -0.3]'; 

figure;
stem(h, 'ko'); % visualizando a resposta ao impulso
title('resp ao impulso');
% impz(h) %mesma coisa

% transformada de fourier da resposta ao impulso eh a resposta em freq
tf = fftshift(fft(h)); 

% criando o eixo pra plotar a tf com esse eixo
eixo = linspace(-pi, pi, 5); 

% resposta em magnitude
figure;
plot(eixo,abs(tf));
title('resp em mag');

% resposta em fase
figure;
plot(eixo,angle(tf));
title('resp em fase');

% diagrama dos polos e zeros
zplane(tf);

% fvtool(tf);

% atraso de grupo do canal
grpdelay(tf) 


% questao 3 *******************

% convoluimos o sinal com o filtro(resp ao impulso)
y = conv(b, h); 
figure;
plot(y)


% questao 4 ********************

b_est = zeros(1,10000);

% preenchendo b_est
for n = 1:10000
    if y(n) > 0.5
        % quando maior que 0.5, coloca 1
        b_est(n) = 1;
    else
        % quando menor que 0.5, coloca 0
        b_est(n) = 0;
    end
end
    
% comparando b com b_est

cont = 0;
for n = 1:10000
    if b(n) ~= b_est(n) 
        % se for diferente entao conta 1
        cont = cont + 1;
    end
end

% taxa de erro de 0 a 1
taxa_de_erro = cont/10000;


% questao 5 ***************************

% 1/tf vezes a tf eh igual a 1

hi = ifft(ifftshift(1./tf));

figure;
% visualizando a resposta ao impulso inversa
stem(hi, 'ko'); 
title('inv resp ao impulso');
% impz(hi) %mesma coisa

%transformada de fourier
tf2 = fftshift(fft(hi));
% igual ao 1./tf

figure;
% resposta em mag inversa
plot(eixo,abs(tf2));
title('inv resp em mag');

figure;
% resposta em fase inversa
plot(eixo,angle(tf2));
title('resp em fase');

% polos e zeros do inverso
zplane(tf2);

fvtool(tf2);

% atraso de grupo do canal inverso
figure;
grpdelay(tf2) 

% atraso de fase do canal inverso
figure;
phasedelay(tf2)


% questao 6 *******************

% Nao eh estavel e causal pois nem todos os polos e zeros estao
% dentro da CRU


% questao 7 *******************

% filtrando com o sistema inverso
y_inv = conv(y, hi);
figure;
plot(y_inv);
title('y _ inv');


% questao 8 *******************

% o sinal b eh o sinal original com 0's e 1's 
% depois o sinal b passa por um sistema e vira y
% o y passa por um sistema inverso virando y_inv
% o y_inv eh quase o sinal b
% falta apenas fazer a estimacao dos seus valores


% questao 9 *******************
b_est2 = zeros(1,10000);

% preenchendo b_est2
for n = 1:10000
    if y_inv(n) > 0.5
        % se y_inv for maior que 0.5 entao vira 1 
        b_est2(n) = 1;
    else
        % se y_inv for menor que 0.5 entao vira 0
        b_est2(n) = 0;
    end
end

% comparando b com b_est
cont = 0;
for n = 1:10000
    if b(n) ~= b_est2(n) 
        % se for diferente soma 1
        cont = cont + 1;
        %disp('teste')
    end
end

% calcula a taxa de erro
taxa_de_erro2 = cont/10000;

% taxa de erro porque agora o sistema ficou irreversivel 
