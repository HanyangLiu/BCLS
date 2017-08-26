function [X, gt] = fourgaussian_gen(num, var1)

n1 = floor(num/4);
m = [-1,0];
C = [var1,0;0,var1];
x1 = mvnrnd(m,C,n1);

m = [1,0];
x2 = mvnrnd(m,C,n1);

m = [0,1];
x3 = mvnrnd(m,C,n1);

m = [0,-1];
x4 = mvnrnd(m,C,n1);



X = [x1;x2;x3;x4];


gt = [ones(n1,1);2*ones(n1,1);3*ones(n1,1);4*ones(n1,1)];

% plot(X(:,1),X(:,2), '*')