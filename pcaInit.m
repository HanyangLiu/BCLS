function  [X_reduce, k, share] = pcaInit(X, thresh)
%PCAINIT Applying dimentional reduction for the original data using PCA.
%   Detailed explanation goes here

X = zscore(X');
[~, SCORE, latent]=princomp(X); 
contr = cumsum(latent)./sum(latent);
k = find(contr>=thresh,1);
share = contr(k);
X_reduce = (SCORE(:,1:k))';

end

