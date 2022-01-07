%混沌序列数字图像加密程序，输入的加密密钥在0～1范围的数  
clear;  
RGB = imread('2.jpg', 'jpg'); 

figure(1);subplot(211);imshow(RGB);subplot(212);imhist(RGB)

s = size(RGB);  

N = s(1) * s(2) * s(3);  
%m = 1:N;  
m(1) = input('输入加密密钥： ');  
disp('加密中...');  
for i = 1:N-1  
    m(i+1) = 4 * m(i) - 4 * m(i)^2;
    m;
end 
m;%0-1的小数
m = mod(m * 1000, 256);  
m = uint8(m);  
n = 1;  
%RGBS = zeros(s(1), s(2), s(3));  
for i = 1:s(3)  
    for j = 1:s(2)  
        for k = 1:s(1)  
            RGBS(k, j, i) = bitxor(m(n), RGB(k ,j, i));  
            n = n + 1;  
        end  
    end  
end  
disp('加密成功!'); 
figure(2);subplot(211);imshow(RGBS);title('加密后的图片');subplot(212);imhist(RGBS)
imwrite(RGBS, '加密后的aaa2.bmp','bmp');  