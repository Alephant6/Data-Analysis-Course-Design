%% C3.1 Use Euclidean distance to do the following fast cluster analysis
% Author: Alephant
% Date: 30 Nov 2022
clc;
close all;
clear;


%% load data
raw_data = xlsread("data31.xls", 'C2:F151');
category = xlsread("data31.xls", 'B2:B151');
k = 3; % number of cluster categories   


%% paramters
figpath = 'figures/';
figtype = '.png';


%% C3.1.1
% classify
X = raw_data(:, [2, 4]);
[idx, C] = kmeans(X, k);

% Look for misclassification and false positive rate
% This data takes 50 as a class 
% and assumes that the classification is roughly accurate
% so it can be calculated with the mode
seg_result = [idx(1:50), idx(51:100), idx(101:150)];
[M, F] = mode(seg_result);
bad_index = [idx(1:50) ~= M(1); idx(51:100) ~= M(2); idx(101:150) ~= M(3)];
false_rate = sum(bad_index)/150 ;

% test hypothesis
disp("若分类数是各一段50个中的众数，则假设成立，可以用该方法找分类错点。")
disp([M;F])
disp('变量：X=\left(X_2,X_4\right)^\mathbf{T}')
disp(['分类错误数：', num2str(sum(bad_index))])
disp(['分类错误率：', num2str(false_rate * 100),'%'])
disp('--------');

% plot
figure
gscatter(X(:,1),X(:,2),idx,'rgb','osd')
hold on
plot(C(:,1),C(:,2),'kp')
plot(X(bad_index,1), X(bad_index,2), 'kx')
legend('分类 1', '分类 2', '分类 3', '聚类中心', '分类错点')
xlabel('第一个变量')
ylabel('第二个变量')
saveas(gcf, [figpath, 'C3.1.1', figtype]) 


%% C3.1.2
% classify
X = raw_data(:, [1, 2, 3]);
[idx, C] = kmeans(X, k);

% Look for misclassification and false positive rate
% This data takes 50 as a class 
% and assumes that the classification is roughly accurate
% so it can be calculated with the mode
seg_result = [idx(1:50), idx(51:100), idx(101:150)];
[M, F] = mode(seg_result);
bad_index = [idx(1:50) ~= M(1); idx(51:100) ~= M(2); idx(101:150) ~= M(3)];
false_rate = sum(bad_index)/150 ;

% test hypothesis
disp("若分类数是各一段50个中的众数，则假设成立，可以用该方法找分类错点。")
disp([M;F])
disp('变量：X=\left(X_1,X_2,X_3\right)^\mathbf{T}')
disp(['分类错误数：', num2str(sum(bad_index))])
disp(['分类错误率：', num2str(false_rate * 100),'%'])
disp('--------');

% plot
figure
gscatter(X(:,1),X(:,2),idx,'rgb','osd')
hold on
plot(C(:,1),C(:,2),'kp')
plot(X(bad_index,1), X(bad_index,2), 'kx')
legend('分类 1', '分类 2', '分类 3', '聚类中心', '分类错点')
xlabel('第一个变量')
ylabel('第二个变量')
saveas(gcf, [figpath, 'C3.1.2', figtype]) 


%% C3.1.3
% classify
X = raw_data;
[idx, C] = kmeans(X, k);

% Look for misclassification and false positive rate
% This data takes 50 as a class 
% and assumes that the classification is roughly accurate
% so it can be calculated with the mode
seg_result = [idx(1:50), idx(51:100), idx(101:150)];
[M, F] = mode(seg_result);
bad_index = [idx(1:50) ~= M(1); idx(51:100) ~= M(2); idx(101:150) ~= M(3)];
false_rate = sum(bad_index)/150 ;

% test hypothesis
disp("若分类数是各一段50个中的众数，则假设成立，可以用该方法找分类错点。")
disp([M;F])
disp('变量：X=\left(X_1,X_2,X_3,X_4\right)^\mathbf{T}')
disp(['分类错误数：', num2str(sum(bad_index))])
disp(['分类错误率：', num2str(false_rate * 100),'%'])
disp('--------');

% plot
figure
gscatter(X(:,1),X(:,2),idx,'rgb','osd')
hold on
plot(C(:,1),C(:,2),'kp')
plot(X(bad_index,1), X(bad_index,2), 'kx')
legend('分类 1', '分类 2', '分类 3', '聚类中心', '分类错点')
xlabel('第一个变量')
ylabel('第二个变量')
saveas(gcf, [figpath, 'C3.1.3', figtype]) 


%% C3.1.4-1
% classify
X = raw_data;
[idx, C] = kmeans(X(:,[1,2,4]), k);

% Look for misclassification and false positive rate
% This data takes 50 as a class 
% and assumes that the classification is roughly accurate
% so it can be calculated with the mode
seg_result = [idx(1:50), idx(51:100), idx(101:150)];
[M, F] = mode(seg_result);
bad_index = [idx(1:50) ~= M(1); idx(51:100) ~= M(2); idx(101:150) ~= M(3)];
false_rate = sum(bad_index)/150 ;

% test hypothesis
disp("若分类数是各一段50个中的众数，则假设成立，可以用该方法找分类错点。")
disp([M;F])
disp('变量：X=\left(X_1,X_2,X_4\right)^\mathbf{T}')
disp(['分类错误数：', num2str(sum(bad_index))])
disp(['分类错误率：', num2str(false_rate * 100),'%'])
disp('--------');

% plot
figure
gscatter(X(:,1),X(:,2),idx,'rgb','osd')
hold on
plot(C(:,1),C(:,2),'kp')
plot(X(bad_index,1), X(bad_index,2), 'kx')
legend('分类 1', '分类 2', '分类 3', '聚类中心', '分类错点')
xlabel('第一个变量')
ylabel('第二个变量')
saveas(gcf, [figpath, 'C3.1.4-1', figtype]) 


%% C3.1.4-2
% classify
X = raw_data;
[idx, C] = kmeans(X(:,[2,3,4]), k);

% Look for misclassification and false positive rate
% This data takes 50 as a class 
% and assumes that the classification is roughly accurate
% so it can be calculated with the mode
seg_result = [idx(1:50), idx(51:100), idx(101:150)];
[M, F] = mode(seg_result);
bad_index = [idx(1:50) ~= M(1); idx(51:100) ~= M(2); idx(101:150) ~= M(3)];
false_rate = sum(bad_index)/150 ;

% test hypothesis
disp("若分类数是各一段50个中的众数，则假设成立，可以用该方法找分类错点。")
disp([M;F])
disp('变量：X=\left(X_2,X_3,X_4\right)^\mathbf{T}')
disp(['分类错误数：', num2str(sum(bad_index))])
disp(['分类错误率：', num2str(false_rate * 100),'%'])
disp('--------');

% plot
figure
gscatter(X(:,1),X(:,2),idx,'rgb','osd')
hold on
plot(C(:,1),C(:,2),'kp')
plot(X(bad_index,1), X(bad_index,2), 'kx')
legend('分类 1', '分类 2', '分类 3', '聚类中心', '分类错点')
xlabel('第一个变量')
ylabel('第二个变量')
saveas(gcf, [figpath, 'C3.1.4-2', figtype]) 

