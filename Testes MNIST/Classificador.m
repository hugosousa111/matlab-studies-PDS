% limpar variaveis, limpar console, fechar telas
clear; clc; close all; 

% carrega a base
data = load('mnist_train.csv');
data_test = load('mnist_test.csv');

% todas as linhas da primeira coluna sao as classes
labels = data(:,1);
labels_test = data_test(:,1);

% resto das linhas sao as imagens
images = data(:, 2:785);
images_test = data_test(:, 2:785);

% exibindo uma das imagens
% colormap gray
% % faz a imagem 
% imagesc(reshape(images(50,:), 28, 28)')

% filtro escolhido 
% blur
filtro = [0.0625 0.125 0.0625; 0.125 0.25 0.125;0.0625 0.125 0.0625];

% images_C eh matriz que vai guardar as imagens convoluidas

% chamando a funcao convolucao 
%images_C = convH_g(images(1:500,:), filtro);
images_C = convH_g(images, filtro);
images_C_test = convH_g(images_test, filtro);

% exibindo uma imagem especifica convoluida
% figure;
% colormap gray;
% imagesc(reshape(images_C(50,:), 26, 26)')

% teste
% imagem1 = (reshape(images(50,:), 28, 28)');
% teste = convH(imagem1, filtro);
% 
% figure;
% colormap gray
% imagesc(teste)


% fazendo a transformada de fourier 
%imagens_C_F = fftshift(fftH_g(images_C));
%imagens_C_F_test = fftshift(fftH_g(images_C_test));
imagens_C_F = images_C;
imagens_C_F_test = images_C_test;

% % exibindo uma imagem especifica transformada
% figure;
% colormap gray;
% imagesc(abs(reshape(images_C_F(50,:), 26, 26)'))

% figure;
% colormap gray;
% imagesc(abs(fftH(reshape(images_C(50,:), 26, 26)')));
%F = fftH(reshape(images_C(2,:), 26, 26)');

%%%%FALTA O FFSHIT

% extraindo as caracteristicas
% atrib_imgs = ex_atribH_g(imagens_C_F);
% atrib_imgs_test = ex_atribH_g(imagens_C_F_test);

% cont1 = 1;
% cont2 = 1;
% cont3 = 1;
% cont4 = 1;
% cont5 = 1;
% cont6 = 1;
% cont7 = 1;
% cont8 = 1;
% cont9 = 1;
% cont0 = 1;
% 
% %for i = 1:500
% for i = 1:length(labels)
%     if labels(i) == 1
%         classe_1_mean(cont1) = atrib_imgs(i,3);
%         cont1 = cont1+1;
%     end
%     if labels(i) == 2
%         classe_2_mean(cont2) = atrib_imgs(i,3);
%         cont2 = cont2+1;
%     end
%     if labels(i) == 3
%         classe_3_mean(cont3) = atrib_imgs(i,3);
%         cont3 = cont3+1;
%     end
%     if labels(i) == 4
%         classe_4_mean(cont4) = atrib_imgs(i,3);
%         cont4 = cont4+1;
%     end
%     if labels(i) == 5
%         classe_5_mean(cont5) = atrib_imgs(i,3);
%         cont5 = cont5+1;
%     end
%     if labels(i) == 6
%         classe_6_mean(cont6) = atrib_imgs(i,3);
%         cont6 = cont6+1;
%     end
%     if labels(i) == 7
%         classe_7_mean(cont7) = atrib_imgs(i,3);
%         cont7 = cont7+1;
%     end
%     if labels(i) == 8
%         classe_8_mean(cont8) = atrib_imgs(i,3);
%         cont8 = cont8+1;
%     end
%     if labels(i) == 9
%         classe_9_mean(cont9) = atrib_imgs(i,3);
%         cont9 = cont9+1;
%     end
%     if labels(i) == 0
%         classe_0_mean(cont0) = atrib_imgs(i,3);
%         cont0 = cont0+1;
%         
%     end
% end

% % normalizacao media 0 e desvio padrao unitario
% X_mean = mean(atrib_imgs);
% X_std= std(atrib_imgs);
% 
% X_normalizado = zeros(10000,4); % criacao da matriz que vai ter media 0 e desvio padrao unitario
% 
% X_mean_test = mean(atrib_imgs_test);
% X_std_test= std(atrib_imgs_test);
% 
% X_normalizado_test = zeros(10000,4);


% for aux = 1:1:60000
%     for col = 1:1:4
%         X_normalizado(aux,col) = (atrib_imgs(aux,col) - X_mean(col))/(X_std(col));
%         % formula para normalizar para os paramentos de media 0 e desvio padrao unitario
%     end
% end
% 
% for aux = 1:1:10000
%     for col = 1:1:4
%         X_normalizado_test(aux,col) = (atrib_imgs_test(aux,col) - X_mean_test(col))/(X_std_test(col));
%         % formula para normalizar para os paramentos de media 0 e desvio padrao unitario
%     end
% end

% % 
% CONSTANTE_SVM = 1;
% KERNEL = 'polynomial';
% % % 
% Md1 = fitcsvm(abs(atrib_imgs), labels, ...
%               'KernelFunction', KERNEL,'PolynomialOrder', 2, 'BoxConstraint', CONSTANTE_SVM,...
%               'Standardize', true, 'ClassNames', {int2str(0), int2str(9)});
%  % 
% % % 


% Mdl = fitcknn(abs(atrib_imgs(1:400,:)),labels(1:400,1),'NumNeighbors',5,'Standardize',1);
% Mdl = fitcknn(abs(X_normalizado(1:9000,:)),labels(1:9000,:),'NumNeighbors',5,'Standardize',1);

% Mdl = fitcknn(abs(X_normalizado(1:59999,:)),labels(1:59999,:),'NumNeighbors',5,'Standardize',1);


% y_pre = predict(Mdl,abs(atrib_imgs(401:500,:)));
% y_pre = predict(Mdl,abs(X_normalizado_test));
% y_pre = predict(Mdl,abs(X_normalizado(60000,:)));

% acuracia = sum(y_pre == labels(401:500,1)) / length(labels(401:500,1))*100;
% acuracia = sum(y_pre == labels_test) / length(labels_test) *100;



% Mdl = fitcknn(atrib_imgs,labels,'NumNeighbors',5,'Standardize',1);
% y_pre = predict(Mdl,atrib_imgs_test);
% acuracia_n_norma = sum(y_pre == labels_test) / length(labels_test) *100;



% for i=1:10000
%     r = randi([0 9],1,1);
%     y_aleatorio(i) = r;
% end
% 
% acuracia_ale = sum(y_aleatorio' == labels_test) / length(labels_test) *100;


% imagem = (reshape(images(18,:), 28, 28)');
% % convolucao da imagem 1 com o filtro
% C = convH(imagem, filtro);
% 
% C_linha = (reshape(C(:,:)', 676, 1)');
% % se comporta com o 'valid' - 26x26
% 
% %extracao de caracteristicas
% 
% 
% 
% 
% % exibindo a imagem toda doida
% figure;
% colormap gray
% imagesc(C)
% % se tiver usado um filtro que deixa valores negativos
% % fica num tom de cinza diferente
% 
% 
% % % passando por essa funcao de ativacao 
% % % pra tirar os negativos
% % C_2 =  max (0,C);
% % 
% % % exibindo imagem final estranha
% % figure;
% % colormap gray
% % imagesc(C_2)

q = 20;
Mdl2 = sparsefilt(abs(imagens_C_F),q,'IterationLimit',10);
NewX = transform(Mdl2,abs(imagens_C_F));

TestX = transform(Mdl2,abs(imagens_C_F_test));

% normalizacao media 0 e desvio padrao unitario
X_mean = mean(NewX);
X_std= std(NewX);
 
X_normalizado = zeros(60000,20); % criacao da matriz que vai ter media 0 e desvio padrao unitario

X_mean_test = mean(TestX);
X_std_test= std(TestX);
 
X_normalizado_test = zeros(10000,20);

for aux = 1:1:60000
    for col = 1:1:20
        X_normalizado(aux,col) = (NewX(aux,col) - X_mean(col))/(X_std(col));
        % formula para normalizar para os paramentos de media 0 e desvio padrao unitario
    end
end
 
for aux = 1:1:10000
    for col = 1:1:20
        X_normalizado_test(aux,col) = (TestX(aux,col) - X_mean_test(col))/(X_std_test(col));
        % formula para normalizar para os paramentos de media 0 e desvio padrao unitario
    end
end

Mdl = fitcknn(NewX,labels,'NumNeighbors',5,'Standardize',1);
%Mdl = fitcknn(X_normalizado,labels,'NumNeighbors',5,'Standardize',1);

y_pre = predict(Mdl,TestX);
%y_pre = predict(Mdl,X_normalizado_test);
acuracia = sum(y_pre == labels_test) / length(labels_test) *100;


%load train.mat;

%sound(y);