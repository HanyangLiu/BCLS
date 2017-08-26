%   Balanced Clustering with Leas Square Regression
%   Main function
close all;
clear all;

globals;

%% initialization
display('Initializing data...');
initialization(data, tmp_dir, infRes);
load([tmp_dir 'init.mat']);
[d,n] = size(X);

StartInd = randsrc(n,1,1:c); Y0 = TransformL(StartInd, c); save([tmp_dir 'Y0'], 'Y0');
load([tmp_dir 'Y0']);


%% Optimization
display('Optimizing...');
[ID, Y, Obj] = BCLS_ALM(X, Y0, gamma, lam, mu);

%% Evaluation
ys = sum(Y);
result = ClusteringMeasure(gt, ID);
ACC = result(1);
NMI = result(2);
[entropy,~,~] = BalanceEvl(c, ys);

%% Show the results
% visualization(data, ID, la, X, n, c);
figure; plot(Obj);
figure; stem(ys);






