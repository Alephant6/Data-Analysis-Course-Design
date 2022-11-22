%% C3.2.1 C-means image segmentation
% Author: Alephant
% Date: 22 Nov 2022
clc;
close all;
clear;


%% paramters
figpath = 'figures/';
figtype = '.png';


%% raw png
raw_png = imread('elephant.png');
x = rgb2gray(raw_png);
figure,
imshow(x);
y = double(x(:));
saveas(gcf, [figpath, 'C3.2.1-raw', figtype]) 


%% segmentation
startdata1 = [0;150];
idpixel = kmeans(y,2,'Start',startdata1);
idbw = (idpixel == 2);%%%%只选标号为2的
seg = reshape(idbw, size(x));
figure,
imshow(seg);
saveas(gcf, [figpath, 'C3.2.1-seg', figtype]) 