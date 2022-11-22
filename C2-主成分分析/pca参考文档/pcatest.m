%%%����һ��matlab help �е����ɷַ���ʾ��
load cities;
% whos
% categories
% first5 = names(1:5,:)
boxplot(ratings,'orientation','horizontal','labels',categories)
    
stdr = std(ratings);
sr = ratings./repmat(stdr,329,1);%%%�����ݽ��й淶��,��ʵ�Ƕ����ϵ������������ɷַ���

[coefs,scores,variances,t2] = pca(sr);%%%�����ݽ������ɷַ���

c3 = coefs(:,1:3) %%%���ɷַ�����ǰ���������ɷ�ϵ��

% ����ǰ�����÷�.
plot(scores(:,1),scores(:,2),'+')
xlabel('1st Principal Component');
ylabel('2nd Principal Component');
% gname(names)
% gname

%%%�Ѽ����˿ڽ϶��ȥ��
metro = [43 65 179 213 234 270 314];
names(metro,:)

rsubset = ratings;
nsubset = names;
nsubset(metro,:) = [];
rsubset(metro,:) = [];
size(rsubset)

%%%������ۻ�����
variances
percent_explained = 100*variances/sum(variances)

%%%����paretoͼ
pareto(percent_explained)
xlabel('Principal Component')
ylabel('Variance Explained (%)')


%%%��ʾ���
% biplot(coefs(:,1:2), 'scores',scores(:,1:2),'varlabels',categories);
% axis([-.26 1 -.51 .51]);



    