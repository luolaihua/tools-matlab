clc,close all
t1=clock;t0=cputime;
Lena = imread('D:\1.jpg');
figure;imshow(Lena)
title('ԭͼ')
[M,N]   = size(Lena);
%Rm      = randsample(M,M)';%����һ����1-n�İ���n������������У�ÿ������ֻ����һ�Σ�����������������ʽ 
Rm=[1:M];

Mchange = [1:1:M;Rm];
Rn      = randsample(N,N)';
Nchange = [1:1:N;Rn];


%������˳��
Lena (Mchange(1,:),:) = Lena (Mchange(2,:),:);
 %figure;imshow(Lena);title('�м��ܺ�ͼ��')
%������˳��
Lena (:,Nchange(1,:)) = Lena (:,Nchange(2,:));
figure;imshow(Lena)
title('���ܺ�ͼ��')
%�б任��ԭ
Lena (:,Nchange(2,:)) = Lena (:,Nchange(1,:));
figure;imshow(Lena)
title('�н��ܺ�ͼ��')
%�б任��ԭ
Lena (Mchange(2,:),:) = Lena (Mchange(1,:),:);
figure;imshow(Lena)
title('���ܺ�ͼ��')
t2=clock;
etime(t2,t1)
tt=cputime-t0;
display(tt)