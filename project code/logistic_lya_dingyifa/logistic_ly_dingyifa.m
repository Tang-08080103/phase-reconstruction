%���巨��Logistic��lyapunovָ��
%Logistic: x(n+1)= u * x(n) * (1- x(n)) 

%%   
%��ʼ��
syms x;
u = 0.5;
logis = u * x * (1 - x); %������ʽ
diff_logis = diff(logis,x,1)%�󷽳̵ĵ���
a = 0.1;%��ֵ
n=5000;%��������
%%
%function x = Logistic(x,u):��ֵ��ϵ��u����������n
%����1000�δﵽ��̬��
temp = Logistic(a,u,1000);
a = Logistic(temp(1000),u,5000);

diff_value=[];
diff_value_ln=[];

  for i = 1 : n
    diff_value(i) = u - 2 * u * a(i);%���㵱ǰ����ֵ
    diff_value_ln(i) = log(abs(diff_value(i)));%ȡ��Ȼ����
  end
% ����subs���㣬��Ҫ�����������ͣ������ٶ���
%     for i = 1 : 5000
%     diff_value(i) = subs(diff_logis,x,a(i));%���㵱ǰ����ֵ
%     diff_value_ln(i) = log(abs(diff_value(i)));%ȡ��Ȼ����
%  end

logis_lya = sum(diff_value_ln) / n



 
