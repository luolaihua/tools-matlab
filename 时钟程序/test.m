clc,close all
t1=clock;t0=cputime;
Lena = imread('D:\1.jpg');
lena2 = Lena;
figure;imshow(Lena)
title('ԭͼ')
[M,N]   = size(Lena);
Rm      = randsample(M,M)';%����һ����1-n�İ���n������������У�ÿ������ֻ����һ�Σ�����������������ʽ 
Mchange = [1:1:M;Rm];
Rn      = randsample(N,N)';
Nchange = [1:1:N;Rn];


%������˳��
imshow(Lena)