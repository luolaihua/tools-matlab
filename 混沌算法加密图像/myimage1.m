clc,close all
t1=clock;t0=cputime;
Lena = imread('D:\1.jpg');
figure;imshow(Lena)
title('原图')
[M,N]   = size(Lena);
Rm      = randsample(M,M)';
%返回一个从1-n的包含n个数的随机排列（每个数字只出现一次）——以行向量的形式 
Rn      = randsample(N,N)';

save key.mat Rm Rn;

Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
%打乱行顺序
Lena (Mchange(1,:),:) = Lena (Mchange(2,:),:);
figure;imshow(Lena);title('行加密后图像')
%打乱列顺序
Lena (:,Nchange(1,:)) = Lena (:,Nchange(2,:));
figure;imshow(Lena)
title('加密后图像')
imwrite(Lena,'aaa.bmp');
t2=clock;
etime(t2,t1)
tt=cputime-t0;
display(tt)