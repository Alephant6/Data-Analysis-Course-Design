%%%参考matlab程序
close('all');
clear;


randn('seed',0);
m=[0 0]';   %%%均值
S=[1 0;0 1]; %%%协方差
N=500;
X = mvnrnd(m,S,N)';   %%%生成正态分布

figure(1), plot(X(1,:),X(2,:),'.');
figure(1), axis equal
figure(1), axis([-7 7 -7 7])

