L = imread('2.jpg');

J = imnoise(L, 'salt & pepper', 0.1);

imshow(J); 

imwrite(J, 'image_noise.jpg'); %��100%�������洢����������ͼƬ��Quality��Ĭ��ֵΪ75.