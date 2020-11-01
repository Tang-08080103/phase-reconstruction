function [xn,dn] = PhaSpaRecon(s,tau,m)
% �������е���ռ��ع� (phase space reconstruction)
% [xn,dn] = PhaSpaRecon(s,tau,m)
% ���������    s          ��������
%               tau        �ع�ʱ��
%               m          �ع�ά��
% ���������    xn         ��ռ��еĵ�����(ÿһ��Ϊ��ռ���һ����)
%               dn         һ��Ԥ���Ŀ��

len = length(s);
if (len-1-(m-1)*tau < 1)
    disp('err: delay time or the embedding dimension is too large!')
    xn = [];
    dn = [];
else
    xn = zeros(m,len-1-(m-1)*tau);
    for i = 1:m
        xn(i,:) = s(1+(i-1)*tau : len-1-(m-i)*tau);   % ��ռ��ع���ÿһ��Ϊһ���� 
    end
    dn = s(2+(m-1)*tau : end);    % Ԥ���Ŀ��
end