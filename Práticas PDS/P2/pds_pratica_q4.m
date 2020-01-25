%questao 7

n = [1:200];
u = ones(1,200);
x = ((1/3).^n).*u;

figure;
plot(x)

%questao 8

y = x(1);

for ii = 2:200
   y(ii) = x(ii) + y(ii-1);
end

hold on;
plot(y)