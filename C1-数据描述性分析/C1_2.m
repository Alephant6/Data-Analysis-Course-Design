%% C1.2 Analyze Observations
% Author: Alephant
% Date: 15 Nov 2022
clc;
close all;
clear;


%% load data
T = readtable('data_1.xls');
% delete 841
T(T.ID==841,:) = [];


%% paramters
figpath = 'figures/';
figtype = '.png';
variablenames = T.Properties.VariableNames;


%% C1.2.1 plotmatrix
for i = 2:5
    figure
    variablename = variablenames{i};
    figname1 = ['C1.2.1-', variablename];

    plotmatrix(table2array(T(:,i)));
    title(figname1)

    saveas(gcf, [figpath, figname1, figtype]) 
end


%% C1.2.2 boxplot
for i = 2:5
    figure
    variablename = variablenames{i};
    figname2 = ['C1.2.2-', variablename];

    boxplot(table2array(T(:,i)));
    title(figname2)

    saveas(gcf, [figpath, figname2, figtype]) 
end


%% C1.2.3 Pearson correlation coefficient
A = table2array(T(:,2:5));
[R, P] = corrcoef(A)
