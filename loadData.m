function [Data_ori, gt, c] = loadData(data)

     switch data
         case 'USPS'
             load('Data/USPS/te')
             Data_ori = [];
             gt = [];
             c = numel(X);
             for k=1:c
                 clu = X{1,k};
                 nn = 100;%size(clu,3);
                 A = reshape(clu, 256, []);
                 Data_ori = [Data_ori, A(:,1:100)];
                 ind = k*ones(nn,1);
                 gt = [gt; ind];
             end
             
   
         case 'cmu'
             load('Data/cmu/cmu_tr_64x64')
             Data_ori = [];
             gt = [];
             c = 20;%numel(X);
             for k=1:c
                 clu = X{1,k};
                 nn = size(clu,3);
                 A = reshape(clu, 64*64, []);
                 Data_ori = [Data_ori, A];
                 ind = k*ones(nn,1);
                 gt = [gt; ind];
             end
             
          case 'cmu32x32'
             load('Data/cmu/cmu_tr_32x32')
             Data_ori = [];
             gt = [];
             c = numel(X);
             for k=1:c
                 clu = X{1,k};
                 nn = size(clu,3);
                 A = reshape(clu, 32*32, []);
                 Data_ori = [Data_ori, A];
                 ind = k*ones(nn,1);
                 gt = [gt; ind];
             end
             
       case 'yale-b'
             load('Data/YALE-B/X.mat')
             Data_ori = [];
             gt = [];
             c = numel(X);
             for k=1:c
                 clu = X{1,k};
                 nn = 59;%size(clu,3);
                 A = reshape(clu, 32*32, []);
                 Data_ori = [Data_ori, A(:, 1:nn)];
                 ind = k*ones(nn,1);
                 gt = [gt; ind];
             end
                
         case 'UMIST'
             load('Data/UMIST/UMIST')
             Data_ori = [];
             gt = [];
             c = numel(X);
             for k=1:c
                 clu = X{1,k};
                 nn = 19;%size(clu,3);
                 A = reshape(clu, 112*92, []);
                 Data_ori = [Data_ori, A(:, 1:19)];
                 ind = k*ones(nn,1);
                 gt = [gt; ind];
             end
         
         case 'pollen'
             load('Data/pollen/pollen_tr_25x25');
             Data_ori = [];
             gt = [];
             c = numel(X);
             for k=1:c
                 clu = X{1,k};
                 nn = size(clu,3);
                 A = reshape(clu, 25*25, []);
                 Data_ori = [Data_ori, A];
                 ind = k*ones(nn,1);
                 gt = [gt; ind];
             end
             
         case 'usps_resampled'  
             load('Data/usps_resampled/loadBinaryUSPS')
             cat1 = 3;
             cat2 = 4;
            
             [X, gt, d1, d2] = initializeData(cat1, cat2); % initialize data for binary classification, X is data, lab is groundtruth label
            
         case 'simp'
             X1 = rand(1,20)-2;
             X2 = rand(1,20)+1;
             Data_ori = [X1 X2];
             
             gt = [ones(20,1); 2*ones(20,1)];
             c = 2;
             
         case 'fourgaussian'
             [X,gt] = fourgaussian_gen(1000, 0.1);
             Data_ori = X';
             c =4;
         
         case 'twobunch'
             [X,gt] = twobunch_gen(500, 500, 0.22, 0, 2);
             Data_ori = X';
             c =2;
             
         case 'twomoon'
             [X,gt] = twomoon_gen(500);
             Data_ori = X';
             c =2;    
             
         case 'toy2'
             load 'Data/data.mat';
             Data_ori = data;
             gt = [];
             c = 10;
             for k=1:c
                 ind = k*ones(40,1);
                 gt = [gt; ind];
             end
             
         case 't4'
             load 'Data/CLUTO/t4.mat' -ASCII;
             Data_ori = (t4(2:1001,:))';
             c = 20;
             gt = ones(1000,1);
             
         case 'minist'
             load 'Data/minist/minist_X.mat';
             load 'Data/minist/minist_Y.mat';
             n = 5000;
             Data_ori = X(:, 1:n);
             gt = Y(1:n);
             c = 10;
             
         case 'minist2k2k'
             load 'Data/minist/2k2k.mat';
             gt = gnd+1;
             Data_ori = fea';
             c = 10;
             
         case 'coil20'
             load 'Data/COIL/COIL20_X.mat';
             load 'Data/COIL/COIL20_Y.mat';
             gt = Y;
             c = 20;
             Data_ori = X;
 
          case 'coil100'
             load 'Data/COIL/COIL100_X.mat';
             load 'Data/COIL/COIL100_Y.mat';
             gt = Y;
             c = 100;
             Data_ori = X;

         case 'Iris'
             load 'Data/Iris/X.mat';
             load 'Data/Iris/Y.mat';
             gt = Y;
             c = 3;
             Data_ori = X;
             
         case 'MPEG7'
             load 'Data/MPEG7/X.mat';
             load 'Data/MPEG7/Y.mat';
             gt = Y;
             c = 70;
             Data_ori = X;
             
         case 'AR'
             load 'Data/AR/X.mat';
             load 'Data/AR/Y.mat';
             X = X(:, 1:700);
             gt = Y(1:700);
             c = 50;
             Data_ori = X;
             
         case 'AR2'
             load 'Data/AR/AR.mat';
             Data_ori = Data;
             c = 100;
             gt = gt;
             
         case 'optdigits'
             load 'Data/optdigits/optdigits_te.mat';
             load 'Data/optdigits/gt_te.mat';
             gt = gt_te;
             c = 10;
             Data_ori = optdigits_te';
             
         case 'AT&T'
             load 'Data/AT&T/X.mat';
             load 'Data/AT&T/Y.mat';
             gt = Y;
             c = 40;
             Data_ori = X;
             
         case 'AT&T2'
             load 'Data/AT&T/AT&T.mat';
             c = 40;
             Data_ori = Data;

             
         case 'JAFFE'
             load 'Data/JAFFE/X.mat';
             load 'Data/JAFFE/Y.mat';
             gt = Y;
             c = 10;
             Data_ori = X;
             
         case 'CMU_PIE'
             load 'Data/CMU_PIE/X_sub.mat';
             load 'Data/CMU_PIE/Y_sub.mat';
             c = 20;
             gt = Y_sub;
             Data_ori = X_sub;
             
         case 'vote';
             load 'Data/House Votes/X_ba.mat';
             load 'Data/House Votes/Y_ba.mat';
             c = 2;
             gt = Y_ba;
             Data_ori = X_ba;
             
         case 'balance';
             load 'Data/balance/X.mat';
             load 'Data/balance/Y.mat';
             c = 3;
             gt = Y;
             Data_ori = X;
             
         case 'pima';
             load 'Data/pima/X.mat';
             load 'Data/pima/Y.mat';
             c = 2;
             gt = Y;
             Data_ori = X;
             
         case 'wine';
             load 'Data/wine/X.mat';
             load 'Data/wine/Y.mat';
             c = 3;
             gt = Y;
             Data_ori = X;
             
         case 'ionosphere';
             load 'Data/ionosphere/X.mat';
             load 'Data/ionosphere/Y.mat';
             c = 2;
             gt = Y;
             Data_ori = X;
             
     end

end