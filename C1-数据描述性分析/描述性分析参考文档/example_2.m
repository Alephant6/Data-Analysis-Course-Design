clc,clear all,close all,
load discrim
gplotmatrix(ratings(:,1:7));%%%自身的矩阵散点图
figure,boxplot(ratings(:,1:7));
% gplotmatrix(ratings(:,1:3),ratings(:,4:7));%%%与其他变量的矩阵散点图
% gplotmatrix(ratings(:,1:3),ratings(:,4:7),group);%%增加类别信息