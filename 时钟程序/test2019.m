clear;

Image0 = imread('Lena.jpg'); 
picture = rgb2gray(Image0);
%设置初值---秘钥
x0= 0.1;
y0 = 0.1;
%设置混沌因子 u a b c
u=1.8;
a=0.5;
b=1;
c=1;

Image111 = my_2Dchaos_gray(picture,x0,y0,u,a,b,c);
figure(1);subplot(121);imshow(picture);title('原图');subplot(122);imshow(Image111);title('加密后的图片');
