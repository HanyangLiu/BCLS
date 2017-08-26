function initialization(data, tmp_dir, infRes)
%INITIALIZATION Initialize the original data and other variates
%   Detailed explanation goes here

% load data
[Data_ori, gt, c] = loadData(data);
[~,n]=size(Data_ori);
[X, k, share] = pcaInit(Data_ori, infRes);
% X = Data_ori;

% centralization
H = eye(n) - 1/n*ones(n);
X = X*H;                    

save([tmp_dir 'init.mat'], 'X', 'gt', 'c');

end


