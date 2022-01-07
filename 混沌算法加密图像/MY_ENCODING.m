clc,close all;
clear;
image = imread('James1.bmp');
image = imnoise(image, 'salt & pepper', 0.1);

%figure(1);subplot(211);imhist(image);title('���ܵĻҶ�ֱ��ͼ')

figure(2);subplot(131);imshow(image)
title('����ͼ')

[M,N]   = size(image);

%������Կ
load('key1.mat');
Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
image (:,Nchange(2,:)) = image (:,Nchange(1,:));
figure(2);subplot(132); imshow(image);title('�н��ܺ�ͼ��')

image (Mchange(2,:),:) = image (Mchange(1,:),:);
figure(2);subplot(133);imshow(image);title('���ܺ�ͼ��')
%figure(1);subplot(212);imhist(image);title('���ܺ�ͼ��ĻҶ�ֱ��ͼ')
imwrite(image,'James1.jpg');