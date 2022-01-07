clc,close all;
clear;
image = imread('James1.bmp');
image = imnoise(image, 'salt & pepper', 0.1);

%figure(1);subplot(211);imhist(image);title('加密的灰度直方图')

figure(2);subplot(131);imshow(image)
title('加密图')

[M,N]   = size(image);

%加载秘钥
load('key1.mat');
Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
image (:,Nchange(2,:)) = image (:,Nchange(1,:));
figure(2);subplot(132); imshow(image);title('行解密后图像')

image (Mchange(2,:),:) = image (Mchange(1,:),:);
figure(2);subplot(133);imshow(image);title('解密后图像')
%figure(1);subplot(212);imhist(image);title('解密后图像的灰度直方图')
imwrite(image,'James1.jpg');