clear;  
EN_Image0 = imread('EN_James2.bmp', 'bmp'); 
%'gaussian''localvar'

%'poisson'

%'salt & pepper''speckle'
%EN_Image0 = imnoise(EN_Image0, 'gaussian', 0.1);
%EN_Image0 = imnoise(EN_Image0, 'speckle', 0.1);
%EN_Image0 = imnoise(EN_Image0, 'salt & pepper', 0.1);
s1 = size(EN_Image0);  
N1 = s1(1) * s1(2) * s1(3);  
   
m1(1) = input('���������Կ�� ');  
disp('������...');  
figure(1);subplot(211);imshow(EN_Image0);subplot(212);imhist(EN_Image0)
for i1 = 1:N1-1  
    %�����������
    m1(i1+1) = 4 * m1(i1) - 4 * m1(i1)^2;  
end  

m1 = mod(m1 * 1000, 256);  
m1 = uint8(m1);  
n1 = 1;  
for i1 = 1:s1(3)  
    for j1 = 1:s1(2)  
        for k1 = 1:s1(1)  
            DE_Image1(k1, j1, i1) = bitxor(m1(n1), EN_Image0(k1, j1, i1));  
            n1 = n1 + 1;  
        end  
    end  
end  
disp('���ܳɹ�!');  
imwrite(DE_Image1, 'DE_James_1.jpg');  
figure(3);subplot(121);imshow(EN_Image0);title('������ͼƬ');subplot(122);imshow(DE_Image1);title('���ܺ��ͼƬ');
figure(4);subplot(211);imhist(EN_Image0);title('����ͼ�ĻҶ�ֱ��ͼ');subplot(212);imhist(DE_Image1);title('���ܺ�ĻҶ�ֱ��ͼ');