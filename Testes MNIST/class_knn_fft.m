%% limpar variaveis, limpar console, fechar telas
clear; clc; close all; 

% rng(1); %semente do rand

%% carrega a base
data_train= load('mnist_train.csv');
data_test = load('mnist_test.csv');

data = [data_train; data_test];


%% permutar a base 

rand_pos = randperm(length(data(:,1)));

data_randomico = zeros(length(data(:,1)),length(data(1,:)));

% novo matriz reorganizada
for k = 1:length(data(:,1))
    data_randomico(k,:) = data(rand_pos(k),:);
end

%% roda 5 vezes, pegando partes da base, e treinando

a = 14000; % auxiliar na parte de separar a base

acuracia = zeros(1,5);

for i=1:5 % roda 5 vezes
    disp(i)
    tic;
    %% separar 20% da base pra teste e 80% pra treino

    data_test = data((a-13999):a,:);

    if a == 14000
        data_train = data(14001:70000,:);
    elseif a == 70000
        data_train = data(1:56001,:);
    else
        data_train = data([1:(a-14000),(a+1):70000],:);
    end

    %% todas as linhas da primeira coluna sao as classes
    labels_train = data_train(:,1);
    labels_test = data_test(:,1);

    % resto das linhas sao as imagens
    images_train = data_train(:, 2:785);
    images_test = data_test(:, 2:785);

    %% exibindo uma das imagens
    % colormap gray
    % % faz a imagem 
    % imagesc(reshape(images_train(50,:), 28, 28)')

    %% filtro escolhido 
    % blur
    filtro = [0.0625 0.125 0.0625; 0.125 0.25 0.125;0.0625 0.125 0.0625];
    ffiltro = fftH(filtro);
    
    %% chamando a funcao convolucao 
    %images_C_train = convH_g(images_train, filtro);
    %images_C_test = convH_g(images_test, filtro);
    images_C_train = images_train;
    images_C_test = images_test;
    
    
    %% exibindo uma imagem especifica convoluida
    % figure;
    % colormap gray;
    % imagesc(reshape(images_C_train(50,:), 26, 26)')


    %% fazendo a transformada de fourier 
    imagens_C_F_train = fftshift(fftH_g(images_C_train));
    imagens_C_F_test = fftshift(fftH_g(images_C_test));
    %imagens_C_F_train = images_C_train;
    %imagens_C_F_test = images_C_test;

    %%%%%%%%%%%%%%%%%%%%%%%%%% pensar depois
    imag = filter2(imagens_C_F_train,ffiltro);
    
    %% exibindo uma imagem especifica transformada
    % figure;
    % colormap gray;
    % imagesc(abs(reshape(images_C_F(50,:), 26, 26)'))

    %% features
    q = 40;
    Mdl2 = sparsefilt(abs(imagens_C_F_train),q,'IterationLimit',10);
    New_train = transform(Mdl2,abs(imagens_C_F_train));

    New_test = transform(Mdl2,abs(imagens_C_F_test));


    %% treino
    Mdl = fitcknn(New_train,labels_train,'NumNeighbors',5,'Standardize',1);

    %% teste
    y_pre = predict(Mdl,New_test);

    acuracia(i) = sum(y_pre == labels_test) / length(labels_test) *100;

    disp(i)
end

%% media de acuracia
md_acuracia = sum(acuracia)/5;
