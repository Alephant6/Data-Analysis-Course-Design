%%%�ο�matlab����
close('all');
clear;


randn('seed',0);
m=[0 0]';   %%%��ֵ
S=[1 0;0 1]; %%%Э����
N=500;
X = mvnrnd(m,S,N)';   %%%������̬�ֲ�

figure(1), plot(X(1,:),X(2,:),'.');
figure(1), axis equal
figure(1), axis([-7 7 -7 7])

