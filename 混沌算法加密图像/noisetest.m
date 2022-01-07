L = imread('2.jpg');

J = imnoise(L, 'salt & pepper', 0.1);

imshow(J); 

imwrite(J, 'image_noise.jpg'); %按100%的质量存储加了噪声的图片，Quality的默认值为75.