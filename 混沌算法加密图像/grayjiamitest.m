clear;
x1=imread('4.jpg');
figure(1);imshow(x1)
x2=imread('3.jpg');
%x1=rgb2gray(x1);
%x2=rgb2gray(x2);
%右移四位，隐藏进一片黑暗
x2 = bitshift(x2,-4);
%figure(2);imshow(x2)

%先右移4位将x1的后四位挤掉，然后再把前四位归位
x1 = bitshift(x1,-4);
x1 = bitshift(x1,4);
figure(2);imshow(x1)
x = x1+x2;
imwrite(x,'5.bmp');
figure(3);imshow(x)
figure(4);imshow(bitshift(x,4))