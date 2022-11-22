%% C3.2.2 Vector quantization with C-means
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
figure(1),
imshow(x);
saveas(gcf, [figpath, 'C3.2.2-raw', figtype]) ;
y = double(x(:));


%% Vector quantization
startdata2 = [0;50;100;150;200;250];
idpixelq = kmeans(y,6,'Start',startdata2);
idq6 = (idpixelq == 6);
idq5 = (idpixelq == 5);
idq4 = (idpixelq == 4);
idq3 = (idpixelq == 3);
idq2 = (idpixelq == 2);
idq1 = (idpixelq == 1);

q5 = idq2.*50+ idq3.*100+ idq4.*150+ idq5.*200+ idq6.*250;
qresult5 = reshape(q5, size(x));
figure(2), imshow(qresult5/250);
saveas(gcf, [figpath, 'C3.2.2-5', figtype]) ;

q4 =  idq3.*100+ idq4.*150+ idq5.*200+ idq6.*250;
qresult = reshape(q4, size(x));
figure(3), imshow(qresult/250);
saveas(gcf, [figpath, 'C3.2.2-4', figtype]) ;

q3 =   idq4.*150+ idq5.*200+ idq6.*250;
qresult = reshape(q3, size(x));
figure(4), imshow(qresult/250);
saveas(gcf, [figpath, 'C3.2.2-3', figtype]) ;

q2 =  idq5.*200+ idq6.*250;
qresult = reshape(q2, size(x));
figure(5), imshow(qresult/250);
saveas(gcf, [figpath, 'C3.2.2-2', figtype]) ;

q1 =  idq6.*250;
qresult = reshape(q1, size(x));
figure(6), imshow(qresult/250);
saveas(gcf, [figpath, 'C3.2.2-1', figtype]) ;