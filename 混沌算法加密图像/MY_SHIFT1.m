clear;
x1=imread('Lena.jpg');
figure(1);imshow(x1);title('原图');
x=x1;

%先右移4位将x1的后四位挤掉，然后再把前四位归位
x1 = bitshift(x1,-4);
x1 = bitshift(x1,4);

figure(2);imshow(x1);title('后四位置零的图');

x3=x-x1;
figure(3);imshow(x3);title('两图做减法');