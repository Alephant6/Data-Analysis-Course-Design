clc,clear all,close all,
load discrim
gplotmatrix(ratings(:,1:7));%%%����ľ���ɢ��ͼ
figure,boxplot(ratings(:,1:7));
% gplotmatrix(ratings(:,1:3),ratings(:,4:7));%%%�����������ľ���ɢ��ͼ
% gplotmatrix(ratings(:,1:3),ratings(:,4:7),group);%%���������Ϣ