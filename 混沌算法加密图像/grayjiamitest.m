clear;
x1=imread('4.jpg');
figure(1);imshow(x1)
x2=imread('3.jpg');
%x1=rgb2gray(x1);
%x2=rgb2gray(x2);
%������λ�����ؽ�һƬ�ڰ�
x2 = bitshift(x2,-4);
%figure(2);imshow(x2)

%������4λ��x1�ĺ���λ������Ȼ���ٰ�ǰ��λ��λ
x1 = bitshift(x1,-4);
x1 = bitshift(x1,4);
figure(2);imshow(x1)
x = x1+x2;
imwrite(x,'5.bmp');
figure(3);imshow(x)
figure(4);imshow(bitshift(x,4))