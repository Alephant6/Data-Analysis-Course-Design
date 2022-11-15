%%%%测试利用C均值进行向量量化的例子
clc,
clear all,
close all,
%%%%%%%%%%%%%原图像
x = imread('coins.png');
figure(1),
imshow(x);
y = double(x(:));
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%下面的例是向量量化的结果%%%%
startdata2 = [0;50;100;150;200;250];%%%%%这里以选6个类为例说明
idpixelq = kmeans(y,6,'Start',startdata2);
idq6 = (idpixelq == 6);
idq5 = (idpixelq == 5);
idq4 = (idpixelq == 4);
idq3 = (idpixelq == 3);
idq2 = (idpixelq == 2);
idq1 = (idpixelq == 1);
%%%%不同的重构结果
q5 = idq2.*50+ idq3.*100+ idq4.*150+ idq5.*200+ idq6.*250;%%%把后五类重构
qresult5 = reshape(q5, size(x));
figure(2), imshow(qresult5/250);

q4 =  idq3.*100+ idq4.*150+ idq5.*200+ idq6.*250;
qresult = reshape(q4, size(x));
figure(3), imshow(qresult/250);

q3 =   idq4.*150+ idq5.*200+ idq6.*250;
qresult = reshape(q3, size(x));
figure(4), imshow(qresult/250);

q2 =  idq5.*200+ idq6.*250;
qresult = reshape(q2, size(x));
figure(5), imshow(qresult/250);

q1 =  idq6.*250;
qresult = reshape(q1, size(x));
figure(6), imshow(qresult/250);



