clear;

Image0 = imread('Lena.jpg'); 
picture = rgb2gray(Image0);
%���ó�ֵ---��Կ
x0= 0.1;
y0 = 0.1;
%���û������� u a b c
u=1.8;
a=0.5;
b=1;
c=1;

Image111 = my_2Dchaos_gray(picture,x0,y0,u,a,b,c);
figure(1);subplot(121);imshow(picture);title('ԭͼ');subplot(122);imshow(Image111);title('���ܺ��ͼƬ');
