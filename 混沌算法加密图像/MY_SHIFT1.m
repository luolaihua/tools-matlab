clear;
x1=imread('Lena.jpg');
figure(1);imshow(x1);title('ԭͼ');
x=x1;

%������4λ��x1�ĺ���λ������Ȼ���ٰ�ǰ��λ��λ
x1 = bitshift(x1,-4);
x1 = bitshift(x1,4);

figure(2);imshow(x1);title('����λ�����ͼ');

x3=x-x1;
figure(3);imshow(x3);title('��ͼ������');