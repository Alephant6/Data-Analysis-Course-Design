%%%%
clc,
clear all,
close all,
%%%%%%%%%%%%%原图像
x = imread('coins.png');
figure,
imshow(x);
y = double(x(:));
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%分割%%%%
startdata1 = [0;150];
idpixel = kmeans(y,2,'Start',startdata1);
idbw = (idpixel == 2);%%%%只选标号为2的
seg = reshape(idbw, size(x));
figure,
imshow(seg);
%%%%%%%%%%%%%%%%%%%%%

