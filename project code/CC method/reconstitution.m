% Phase Space Reconstruction
function X_r=reconstitution(X,m,tao)
% X : time series
% m : embed dimesion
% tao: delay time
% X_r : reconsitite X

N = numel(X);
M=N-(m-1)*tao;%��ռ��е�ĸ���
for j=1:M           %��ռ��ع�
    for i=1:m
        X_r(i,j)=X((i-1)*tao+j);
    end
end