%questao 5

n = [1:200];
n = n-100;

x = sin(0.3*pi.*n)./(0.3*pi.*n);

x(100) = 1; %correcao pq da NaN

figure;
plot(x)

%questao 6

y = x(1);

for ii = 2:200
   y(ii) = x(ii) + y(ii-1);
end

hold on;
plot(y)