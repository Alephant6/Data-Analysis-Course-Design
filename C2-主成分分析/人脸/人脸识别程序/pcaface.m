
clc
clear, close all
path = 'TrainDatabase';
path=[path '\'];
Filename=dir([path '*.jpg']);
[count,c]=size(Filename);
for i = 1 : count
    f=[path num2str(i) '.jpg'];
    F=imread(f);
    M=rgb2gray(F);
    temp=reshape(M,[200*180 1]);
    K(:,i)=double(temp);%������ѵ��ͼ�����K
end
[e,m,lambda] = cvPca(K,3);%��K�����ɷַ�����ȡ3�����ɷ�

for n=1:20
    for i=1:3 %����3�����ɷ�
        p(i,n)=e(:,i)'*K(:,n);%ѵ��ͼ���������ռ��ϵ�ͶӰ
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%����������
for i=1:3
   e1=e(:,i);
  tezhenglian=reshape(e1',200,180);
  figure;
   imshow(tezhenglian,[])
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im = imread('TestDatabase\4.jpg');%%%%��������ͼ��
g=rgb2gray(im);
figure;  imshow(g);    %%%%��ʾ����ͼ��
h=reshape(g,[200*180 1]);
L(:,1)=double(h);
pc=e'*L(:,1);%����ͼ���������ռ��е�ͶӰ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m=1:20
    d(m)=sum((pc(:,1)-p(:,m)).^2);%����ͼ���������ռ��е�ͶӰ��ѵ��ͼ���������ռ���ͶӰ�ľ���
end
posi=find(d==min(d));%�Ҿ�����С��һ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���������ɷݷ�����ѵ�����������ҵ��������ͼ������С��ͼ����ʾ����
f=[path num2str(posi) '.jpg'];
f1=imread(f);
result_image=rgb2gray(f1);
figure;
imshow(result_image)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������Ĳ���ͼҲ��ʾ����
path1= 'TestDatabase';
resu=round(posi/2);
path1=[path1 '\'];
f2=[path1 num2str(resu) '.jpg'];
f3=imread(f2);
result_image1=rgb2gray(f3);
figure;
imshow(result_image1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  t
posi
resu



