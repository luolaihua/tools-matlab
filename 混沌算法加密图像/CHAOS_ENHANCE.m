clear;
clc,close all
t0=cputime;



m(1) = input('输入加密密钥： ');  
disp('加密中...'); 

u=4;



%image = imread('1.jpg');
image1 = imread('Lena.jpg');
%figure(1);subplot(211);imhist(image);title('原图的灰度直方图')
a=ImgEntropy(image1);
%image = imnoise(image, 'salt & pepper', 0.1);
image=image1;
[M,N]   = size(image);
Rm      = randsample(M,M)';%转成行向量
Rn      = randsample(N,N)';
save key1.mat Rm Rn;
Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
%打乱行顺序
image (Mchange(1,:),:) = image (Mchange(2,:),:);
%打乱列顺序
image (:,Nchange(1,:)) = image (:,Nchange(2,:));

Image0 = image; 

s = size(Image0);  
N = s(1) * s(2) * s(3); 


for i = 1:N-1  
    m(i+1) = u * m(i) - u * m(i)^2;
    m;
end 
m;%0-1的小数
m = mod(m * 1000, 256);  
m = uint8(m);  
n = 1;  
for i = 1:s(3)  
    for j = 1:s(2)  
        for k = 1:s(1)  
            Image1(k, j, i) = bitxor(m(n), Image0(k ,j, i));  
            n = n + 1;  
        end  
    end  
end  
disp('加密成功!'); 
figure(1);subplot(121);imshow(image1);title('原图');subplot(122);imshow(Image1);title('加密后的图片');

imwrite(Image1, 'ENHANCE_James2.bmp');
b=ImgEntropy(Image1);
time=cputime-t0;
display(time);