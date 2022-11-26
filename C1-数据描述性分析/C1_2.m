%% C1.2 Analyze Observations
% Author: Alephant
% Date: 26 Nov 2022
clc;
close all;
clear;


%% load data
T = readtable('data_1.xls');
% delete 841
T(T.ID==841,:) = [];
A = table2array(T(:,2:5));


%% paramters
figpath = 'figures/';
figtype = '.png';


%% C1.2.1 plotmatrix
figure
plotmatrix(A,'*r');
saveas(gcf, [figpath, 'C1.2.1', figtype]) 


%% C1.2.2 boxplot
figure
boxplot(A,{'EXPE','QUAL','LOYA','SATI'})
saveas(gcf, [figpath, 'C1.2.2', figtype]) 


%% C1.2.3 Pearson correlation coefficient

[R, P] = corrcoef(A)
