%% C2.1 Principal Component Analysis
% Author: Alephant
% Date: 22 Nov 2022
clc;
close all;
clear;


%% C2.1.0 load data
ratings = xlsread('data21.xls', "B4:I34");
[~, names] = xlsread('data21.xls', "A4:A34");
[~, categories] = xlsread('data21.xls', "B3:I3");


%% paramters
figpath = 'figures/';
figtype = '.png';


%% boxplot
figure
boxplot(ratings,'orientation','horizontal','labels',categories)
saveas(gcf, [figpath, 'C2.1-data-boxplot', figtype]) 


%% C2.1.1 pca
% normalization
stdr = std(ratings);
sr = ratings./repmat(stdr,31,1);

% pca
[coefs,scores,variances,t2] = pca(sr);

% var - Contribution rate of each component
percent_explained = 100*variances/sum(variances);
% plot pareto
figure
pareto(percent_explained, categories,1)
xlabel('主成分')
ylabel('方差解释 (%)')
saveas(gcf, [figpath, 'C2.1.1', figtype]) 


%% C2.1.2 ranking
figure
c1 = scores(:,1);
[c1_sorted,index] = sort(c1);
bar(c1_sorted);
set(gca, 'XTickLabel', names(index),'XTick',1:31)
saveas(gcf, [figpath, 'C2.1.2', figtype]) 



%% C2.1.3 scatter
% The first two principal component coefficients.
figure
plot(scores(:,1),scores(:,2),'x')
xlabel('第一主成分：食品');
ylabel('第二主成分：衣着');
% label the names of the regions
% gname(names);
% saveas(gcf, [figpath, 'C2.1.3', figtype]) 



