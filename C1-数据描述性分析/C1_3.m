%% C1.3 Sample Classification
% Author: Alephant
% Date: 25 Nov 2022
clc;
close all;
clear;


%% load data
% the first three are benign tumors
% the last five are malignant tumors
group = [1; 1; 1; 2; 2; 2; 2; 2];

training = [13.54,14.36,87.46,566.3,0.09779;
13.08,15.71,85.63,520,0.1075;
9.504,12.44,60.34,273.9,0.1024;
17.99,10.38,122.8,1001,0.1184;
20.57,17.77,132.9,1326,0.08474;
19.69,21.25,130,1203,0.1096;
11.42,20.38,77.58,386.1,0.1425;
20.29,14.34,135.1,1297,0.1003];

sample = [16.6,28.08,108.3,858.1,0.08455;
20.6,29.33,140.1,1265,0.1178;
7.76,24.54,47.92,181,0.05263];

training1 = training(1:3, :);
training2 = training(4:8, :);
mu1 = mean(training1);
mu2 = mean(training2);


% fail to use matlab 'classify'
% [C,err] = classify(sample, training, group, 'mahalanobis');
% Error using classify (line 282)
% The covariance matrix of each group in TRAINING must be positive definite.


%% C1.3.1 The covariance matrices are equal
Sigma = cov(training);
a1 = inv(Sigma) * mu1';
b1 = (-1/2) * mu1 * inv(Sigma) * mu1';
W1 = a1' * sample' + b1;

a2 = inv(Sigma) * mu2';
b2 = (-1/2) * mu2 * inv(Sigma) * mu2';
W2 = a2' * sample' + b2;

result_equal = 2 * ones(3,1);
result_equal((W1-W2)>=0) = 1;
disp("协方差矩阵相同时，样本分类结果：")
disp("（1=良性肿瘤，2=恶性肿瘤）")
disp(result_equal)
disp("-----------")


%% C1.3.2 The covariance matrices are unequal
warning("off")
Sigma1 = cov(training1);
Sigma2 = cov(training2);

d1_square = zeros(3,1);
d2_square = zeros(3,1);
for i = 1:3
    x = sample(i,:);
    d1_square(i) = (x - mu1) * inv(Sigma1) * (x - mu1)';
    d2_square(i) = (x - mu2) * inv(Sigma2) * (x - mu2)';
end

result_unequal = 2 * ones(3,1);
result_unequal((W1-W2)>=0) = 1;
disp("协方差矩阵不同时，样本分类结果：")
disp("（1=良性肿瘤，2=恶性肿瘤）")
disp(result_unequal)
disp("-----------")

