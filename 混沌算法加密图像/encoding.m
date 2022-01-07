clc,close all
Lena = imread('aaa.bmp');
figure;
imshow(Lena)
title('原图')
[M,N]   = size(Lena);
load('key.mat');
Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
Lena (:,Nchange(2,:)) = Lena (:,Nchange(1,:));
figure;imshow(Lena)
title('列解密后图像')
%行变换还原
Lena (Mchange(2,:),:) = Lena (Mchange(1,:),:);
figure;imshow(Lena)
title('解密后图像')