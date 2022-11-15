%%%这是一个matlab help 中的主成分分析示例
load cities;
% whos
% categories
% first5 = names(1:5,:)
boxplot(ratings,'orientation','horizontal','labels',categories)
    
 stdr = std(ratings);
sr = ratings./repmat(stdr,329,1);%%%对数据进行规范化,其实是对相关系数矩阵进行主成分分析

[coefs,scores,variances,t2] = princomp(sr);%%%对数据进行主成分分析

c3 = coefs(:,1:3) %%%主成分分析的前面三个主成分系数

% 划出前两个得分.
plot(scores(:,1),scores(:,2),'+')
xlabel('1st Principal Component');
ylabel('2nd Principal Component');
% gname(names)
% gname

%%%把几个人口较多的去掉
metro = [43 65 179 213 234 270 314];
names(metro,:)

rsubset = ratings;
nsubset = names;
nsubset(metro,:) = [];
rsubset(metro,:) = [];
size(rsubset)

%%%方差及其累积贡献
variances
percent_explained = 100*variances/sum(variances)

%%%画出pareto图
pareto(percent_explained)
xlabel('Principal Component')
ylabel('Variance Explained (%)')


%%%显示结果
% biplot(coefs(:,1:2), 'scores',scores(:,1:2),'varlabels',categories);
% axis([-.26 1 -.51 .51]);



    