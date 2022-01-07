%混沌加密的解密程序，输入的解密密钥即是加密密钥  
%注意：使用非立即加密和解密的算法进行数字图像加密时，当对jpg格式的图像进行加密后  
%的写入，再在解密程序中读入加密后的jpg的图片，图片会部分失真，而利用bmp格式的图像  
%进行写入和读出时就不会出现这样的情况，由于jpg格式的图像是有损压缩，虽然是同一张  
%图像写入和读出的数字图像的RGB值已经不同了；与此相反bmp格式的图像是无损压缩，因此  
%不会出现这样的情况。  
clear;  
RGBS1 = imread('加密后的aaa2.bmp', 'bmp');  
RGBS1 = imnoise(RGBS1, 'salt & pepper', 0.1);
s1 = size(RGBS1);  
N1 = s1(1) * s1(2) * s1(3);  
%m = 1:N;  
m1(1) = input('输入解密密钥： ');  
disp('解密中...');  
figure(1);subplot(211);imshow(RGBS1);subplot(212);imhist(RGBS1)
for i1 = 1:N1-1  
    %构造混沌序列
    m1(i1+1) = 4 * m1(i1) - 4 * m1(i1)^2;  
end  
%RGBE = zeros(s(1), s(2), s(3));  
m1 = mod(m1 * 1000, 256);  
m1 = uint8(m1);  
n1 = 1;  
for i1 = 1:s1(3)  
    for j1 = 1:s1(2)  
        for k1 = 1:s1(1)  
            %这里不能使用RGBS1，由于jpg是有损压缩格式，读入和读出存在误差；  
            %故使用加密后没写入jpg格式时的RGB;  
            %RGBE(k1, j1, i1) = bitxor(m1(n1), RGBS1(k1, j1, i1));  
            RGBE(k1, j1, i1) = bitxor(m1(n1), RGBS1(k1, j1, i1));  
            n1 = n1 + 1;  
        end  
    end  
end  
disp('解密成功!');  
imwrite(RGBE, '解密后的bb2.jpg', 'jpg');  
figure(2);subplot(211); imshow(RGBE); title('解密后的图片'); subplot(212);imhist(RGBE) 