% �������ּ��㺯��
% 1��������������֮��ľ��룬ȡ��������ó�ʸ���������� d = max|x(i) - y(j)|��
% 2������ d ������Ĺ���ʸ�� r ����tem = r -d 
% 3����λ���� Heaviside��tem��
% 4���������� Cr = 1/N^2 ��(Heaviside��tem��)

function Cr = CorrelationIntegral(Xr,r)
% Cr ��������
% Xr �ع���ռ�
% r �й�����ʸ��

tem = size(Xr); 
N = tem(2); %�ع��ռ��еĵ���
sum = 0;
for i = 1:N-1
    for j = i + 1:N
        d = norm((Xr(:,i)-Xr(:,j)),inf); %�����ع��ռ��е�ÿ������룬ȡ�����
        tem = r - d ;
        h_tem = heaviside(tem) ;
        sum = sum + h_tem;
    end
end
Cr=2*sum/(N*(N-1));
end
