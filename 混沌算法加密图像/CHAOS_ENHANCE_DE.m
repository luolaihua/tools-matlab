clc,close all;
clear;
EN_Image0 = imread('ENHANCE_James2.bmp');
%image = imnoise(image, 'salt & pepper', 0.1);
%figure(1);subplot(211);imhist(image);title('加密的灰度直方图')
image=EN_Image0;
s1 = size(EN_Image0);  
N1 = s1(1) * s1(2) * s1(3);  
m1(1) = input('输入解密密钥： ');  
disp('解密中...');  
for i1 = 1:N1-1  
    m1(i1+1) = 4 * m1(i1) - 4 * m1(i1)^2;  
end  
m1 = mod(m1 * 1000, 256);  
m1 = uint8(m1);  
n1 = 1;  
for i1 = 1:s1(3)  
    for j1 = 1:s1(2)  
        for k1 = 1:s1(1)  
            DE_Image1(k1, j1, i1) = bitxor(m1(n1), EN_Image0(k1, j1, i1));  
            n1 = n1 + 1;  
        end  
    end  
end  
disp('解密成功!');  
%imwrite(DE_Image1, 'DE_James_1.jpg');  

image=DE_Image1;
[M,N]   = size(image);
load('key1.mat');
Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
image (:,Nchange(2,:)) = image (:,Nchange(1,:));

image (Mchange(2,:),:) = image (Mchange(1,:),:);
figure(2);imshow(image);title('解密后图像')
%figure(1);subplot(212);imhist(image);title('解密后图像的灰度直方图')
