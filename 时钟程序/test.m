clc,close all
t1=clock;t0=cputime;
Lena = imread('D:\1.jpg');
lena2 = Lena;
figure;imshow(Lena)
title('原图')
[M,N]   = size(Lena);
Rm      = randsample(M,M)';%返回一个从1-n的包含n个数的随机排列（每个数字只出现一次）——以行向量的形式 
Mchange = [1:1:M;Rm];
Rn      = randsample(N,N)';
Nchange = [1:1:N;Rn];


%打乱行顺序
imshow(Lena)