clc,close all
t0=cputime;

%image = imread('1.jpg');
image = imread('Lena.jpg');
figure(1);subplot(211);imhist(image);title('ԭͼ�ĻҶ�ֱ��ͼ')

%��
a=ImgEntropy(image);
%�ӽ�������
image = imnoise(image, 'salt & pepper', 0.1);


figure(2);subplot(131);imshow(image)
title('ԭͼ')


[M,N]   = size(image);
Rm      = randsample(M,M)';%ת��������
Rn      = randsample(N,N)';

%������Կ Rm Rn��key1.mat
save key1.mat Rm Rn;


Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];


%������˳��
image (Mchange(1,:),:) = image (Mchange(2,:),:);

figure(2);subplot(132); imshow(image);title('�м��ܺ�ͼ��')

%������˳��
image (:,Nchange(1,:)) = image (:,Nchange(2,:));


figure(2);subplot(133);imshow(image);title('���ܺ�ͼ��')
figure(1);subplot(212);imhist(image);title('���ܺ�ͼ��ĻҶ�ֱ��ͼ')
b=ImgEntropy(image);
imwrite(image,'James1.bmp');

time=cputime-t0;
display(time);
display(a);
display(b);