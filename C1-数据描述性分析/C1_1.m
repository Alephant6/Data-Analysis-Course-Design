%% C1.1 bivariate normal distribution vector
% Author: Alephant
% Date: 15 Nov 2022
clc;
close all;
clear;


%% paramters
n = 500;
mu = [0; 0];
Sigmas = {[1, 0; 0, 1]; [0.2, 0; 0, 0.2];
          [4, 0; 0, 4]; [0.2, 0; 0, 4];
          [4, 0; 0, 0.2]; [0.2, 0; 0, 4];
          [0.3, 0.5; 0.5, 4]; [4, 0.5; 0.5, 0.3]         
          };
figpath = 'figures/';
figtype = '.png';


%% run
for num = 1:8
    % define paramaters
    figure(num)
    Sigma = cell2mat(Sigmas(num));
    figname = ['C1.1.', num2str(num)];
    
    % calculate 
    X = mvnrnd(mu, Sigma, n);
    y = mvnpdf(X);
    
    % plot fig
    scatter3(X(:,1),X(:,2),y)
    xlabel('X1')
    ylabel('X2')
    zlabel('概率密度')
    title(figname)
    
    % save fig
    saveas(gcf, [figpath, figname, figtype]) 
end