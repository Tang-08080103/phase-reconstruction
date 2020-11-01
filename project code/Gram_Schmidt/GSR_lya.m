% ����Lorenz�����ӵ�Lyapunovָ��
clear;
yinit = [1,1,1];
orthmatrix = [1 0 0;
              0 1 0;
              0 0 1];
          
y = zeros(12,1);
% ��ʼ������
y(1:3) = yinit;
y(4:12) = orthmatrix;
tstart = 0; % ʱ���ʼֵ
tstep = 1e-2; % ʱ�䲽��
wholetimes = 1e6; % �ܵ�ѭ������
steps = 10; % ÿ���ݻ��Ĳ���
iteratetimes = wholetimes/steps; % �ݻ��Ĵ���
mod = zeros(3,1);
lp = zeros(3,1);
% ��ʼ������Lyapunovָ��
Lyapunov1 = zeros(iteratetimes,1);
Lyapunov2 = zeros(iteratetimes,1);
Lyapunov3 = zeros(iteratetimes,1);

%%
for i=1:iteratetimes
    tspan = tstart:tstep:(tstart + tstep*steps);   
    [T,Y] = ode45('Lorenz_ly', tspan, y);
    % ȡ���ֵõ������һ��ʱ�̵�ֵ
    y = Y(size(Y,1),:);
    % ���¶�����ʼʱ��
    tstart = tstart + tstep*steps;
    y0 = [y(4) y(7) y(10);
          y(5) y(8) y(11);
          y(6) y(9) y(12)];
    %������
    y0 = ThreeGS(y0);
    % ȡ����������ģ
    mod(1) = sqrt(y0(:,1)'*y0(:,1));
    mod(2) = sqrt(y0(:,2)'*y0(:,2));
    mod(3) = sqrt(y0(:,3)'*y0(:,3));
    y0(:,1) = y0(:,1)/mod(1);
    y0(:,2) = y0(:,2)/mod(2);
    y0(:,3) = y0(:,3)/mod(3);
    lp = lp+log(abs(mod));
    %����Lyapunovָ��
    Lyapunov1(i) = lp(1)/(tstart);
    Lyapunov2(i) = lp(2)/(tstart);
    Lyapunov3(i) = lp(3)/(tstart);
        y(4:12) = y0';
end

%%
% ��Lyapunovָ����ͼ
i = 1:iteratetimes;
plot(i,Lyapunov1,i,Lyapunov2,i,Lyapunov3)