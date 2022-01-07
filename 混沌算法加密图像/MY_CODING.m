clc,close all
t0=cputime;

%image = imread('1.jpg');
image = imread('Lena.jpg');
figure(1);subplot(211);imhist(image);title('原图的灰度直方图')

%熵
a=ImgEntropy(image);
%加椒盐噪声
image = imnoise(image, 'salt & pepper', 0.1);


figure(2);subplot(131);imshow(image)
title('原图')


[M,N]   = size(image);
Rm      = randsample(M,M)';%转成行向量
Rn      = randsample(N,N)';

%保存秘钥 Rm Rn至key1.mat
save key1.mat Rm Rn;


Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];


%打乱行顺序
image (Mchange(1,:),:) = image (Mchange(2,:),:);

figure(2);subplot(132); imshow(image);title('行加密后图像')

%打乱列顺序
image (:,Nchange(1,:)) = image (:,Nchange(2,:));


figure(2);subplot(133);imshow(image);title('加密后图像')
figure(1);subplot(212);imhist(image);title('加密后图像的灰度直方图')
b=ImgEntropy(image);
imwrite(image,'James1.bmp');

time=cputime-t0;
display(time);
display(a);
display(b);