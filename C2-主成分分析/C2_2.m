%% C2.2 Principal Component Analysis Figures
% Author: Alephant
% Date: 22 Nov 2022
clc;
close all;
clear;


%% paramters
figpath = 'figures/';
figtype = '.png';


%% Train
train_path = 'TrainDatabase\';
train_files = dir([train_path, '*.jpg']);
train_files_num = size(train_files);
for i= 1 : train_files_num
    train_file_name = [train_path, num2str(i), '.jpg'];
    train_file_image_read=imread(train_file_name);
    train_file_image_gray=rgb2gray(train_file_image_read);
    train_data(:,i)=double(train_file_image_gray(:));
end
% pca, the number of components
components_num = 4;
[eigenvectors,m,lambda] = cvpca(train_data,components_num);

feature_space_coordinates = zeros([components_num train_files_num], 'double');
for j = 1 : train_files_num
    for i = 1 : components_num
        feature_space_coordinates(i,j)=eigenvectors(:,i)'*train_data(:,j);
    end
end

% plot feature faces
for i = 1 : components_num
    e1=eigenvectors(:,i);
    feature_face=reshape(e1',200,180);
    figure;
    imshow(feature_face,[])
    
    % save figure
    figname_feature_face = ['C2.2--',num2str(components_num), ' components--feature faces ', num2str(i)];
    saveas(gcf, [figpath, figname_feature_face, figtype]) 
end


%% Test
test_path = 'TestDatabase\';
test_files = dir([test_path, '*.jpg']);
test_file_num = size(test_files);

for i = 1:test_file_num
    test_file_name = [test_path, num2str(i), '.jpg'];
    test_file_image_read=imread(test_file_name);
    test_file_image_gray=rgb2gray(test_file_image_read);

    % projection of test file in feature space
    projection = eigenvectors' * double(test_file_image_gray(:));
    projections(:, i) = projection(:);

    % Projected coordinates to the distance of the 20 training files
    distance = dist(projection', feature_space_coordinates);
    distances(:, i) = distance(:);

    % Corresponds to the most recent training file
    position = find(distance==min(distance));
    positions(:,i) = position(:);

    % plot test and the result train
    figure
    subplot(1,2,1)
    imshow(test_file_name)
    title(['test ', num2str(i)])

    subplot(1,2,2)
    result_file_name = [train_path, num2str(position), '.jpg'];
    imshow([result_file_name])
    title(['分类结果：train ', num2str(position)])
    
    % save figure
    figname_result = ['C2.2--',num2str(components_num), ' components--test ', num2str(i)];
    saveas(gcf, [figpath, figname_result, figtype]) 
end

%% Classification basis
fprintf("选前%d个最大的特征值\n",components_num)
disp("10个测试文件，20个训练文件")
disp("分类依据：")
disp("1. 训练文件在特征空间的投影：")
disp(feature_space_coordinates)
disp("------------------------------")
disp("2. 测试文件在特征空间的投影：")
disp(projections)
disp("------------------------------")
disp("3. 在特征空间中，测试文件投影（列）与训练文件投影（行）的距离：")
disp(distances)
disp("------------------------------")
disp("4. 距离最小训练文件序号：")
disp(positions)


