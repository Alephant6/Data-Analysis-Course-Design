%%%%
clc,
clear all,
close all,
%%%%%%%%%%%%%ԭͼ��
x = imread('coins.png');
figure,
imshow(x);
y = double(x(:));
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%�ָ�%%%%
startdata1 = [0;150];
idpixel = kmeans(y,2,'Start',startdata1);
idbw = (idpixel == 2);%%%%ֻѡ���Ϊ2��
seg = reshape(idbw, size(x));
figure,
imshow(seg);
%%%%%%%%%%%%%%%%%%%%%

