%������������ͼ����ܳ�������ļ�����Կ��0��1��Χ����  
clear;  
RGB = imread('2.jpg', 'jpg'); 

figure(1);subplot(211);imshow(RGB);subplot(212);imhist(RGB)

s = size(RGB);  

N = s(1) * s(2) * s(3);  
%m = 1:N;  
m(1) = input('���������Կ�� ');  
disp('������...');  
for i = 1:N-1  
    m(i+1) = 4 * m(i) - 4 * m(i)^2;
    m;
end 
m;%0-1��С��
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
disp('���ܳɹ�!'); 
figure(2);subplot(211);imshow(RGBS);title('���ܺ��ͼƬ');subplot(212);imhist(RGBS)
imwrite(RGBS, '���ܺ��aaa2.bmp','bmp');  