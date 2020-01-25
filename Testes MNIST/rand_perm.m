clear;
clc;
data = [1 2 3; 4 5 6; 7 8 9]; % your data

rand_pos = randperm(length(data(:,1))); %array of random positions

data_randomly_placed = zeros(length(data(:,1)),length(data(1,:)));

% new array with original data randomly distributed 
for k = 1:length(data(:,1))
    data_randomly_placed(k,:) = data(rand_pos(k),:);
end


data2 = [1 2 3; 4 5 6; 7 8 9]; % your data
data3 = [10 11 12; 13 14 15; 16 17 18]; % your data

data_f = [data2; data3];
