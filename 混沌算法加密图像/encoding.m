clc,close all
Lena = imread('aaa.bmp');
figure;
imshow(Lena)
title('ԭͼ')
[M,N]   = size(Lena);
load('key.mat');
Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
Lena (:,Nchange(2,:)) = Lena (:,Nchange(1,:));
figure;imshow(Lena)
title('�н��ܺ�ͼ��')
%�б任��ԭ
Lena (Mchange(2,:),:) = Lena (Mchange(1,:),:);
figure;imshow(Lena)
title('���ܺ�ͼ��')