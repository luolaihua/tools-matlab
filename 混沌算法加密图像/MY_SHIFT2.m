clear;
%ʵ������ͼ������һ�𣬽�һ��ͼ��������һ��ͼ��

x1=imread('4.jpg');
figure(1);imshow(x1)
x2=imread('3.jpg');
figure(2);imshow(x2)


x2 = bitshift(x2,-4);

x1 = bitshift(x1,-4);
x1 = bitshift(x1,4);
%figure(2);imshow(x1)
x = x1+x2;
imwrite(x,'5.bmp');
figure(3);imshow(x)
figure(4);imshow(bitshift(x,4))