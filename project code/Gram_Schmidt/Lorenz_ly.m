function dX = Lorenz_ly(t,X)
%  Lorenz�����ӣ���������Lyapunovָ��
%        
%        dx/dt = 10*(-x+y),
%        dy/dt = 28*x-y-x*z,
%        dz/dt = x*y-8/3*z,
x=X(1); y=X(2); z=X(3);
% Y������������Ϊ�໥�����ĵ�λ����
Y = [X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];
% ��������ĳ�ʼ�����ز�����
dX = zeros(12,1);
% Lorenz������
dX(1) = 10*(-x+y);
dX(2) = 28*x-y-x*z;
dX(3) = x*y-8/3*z;
% Lorenz�����ӵ�Jacobi����
Jaco = [-10 10 0;
        28-z -1 -x;
        y x  -8/3];
dX(4:12) = Jaco*Y;