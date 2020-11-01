function logis_lya = logistic_ly(a,u,n)
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

logis_lya = sum(diff_value_ln) / n;
end
