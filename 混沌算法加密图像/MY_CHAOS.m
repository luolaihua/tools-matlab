
clear;  
%Image0 = imread('1.jpg'); 
Image0 = imread('Lena.jpg'); 
a=ImgEntropy(Image0);


s = size(Image0);  %
N = s(1) * s(2) * s(3); 

m(1) = input('���������Կ�� ');  %��ԿΪ��ֵ
disp('������...'); 

u=4;% ��������

%����N�Σ����ɻ�������m
for i = 1:N-1  
    m(i+1) = u * m(i) - u * m(i)^2;
    m;
end 



m;%0-1��С��
m = mod(m * 1000, 256);  % mod(a,b)���������a����b���������ȷ�˵mod(100,3)=1,mod(17,6)=5,����mΪ0-256������

m = uint8(m);  %uint8�ķ�Χ��0-255��matlab�ṩǿ��ת��Ϊuint8�ĺ�����uint8(number)��
                %����������������ǰѴ���255����ȫ��ǿ����Ϊ255����С��255�Ĳ����򱣳�ԭ�����䡣
                %Ҳ���ǽ�һ��������m���е�ֵ��0-255֮��

                
n = 1;  
for i = 1:s(3)  
    for j = 1:s(2)  
        for k = 1:s(1)  
            Image1(k, j, i) = bitxor(m(n), Image0(k ,j, i));  
            n = n + 1;  
        end  
    end  
end  
disp('���ܳɹ�!'); 
figure(1);subplot(121);imshow(Image0);title('ԭͼ');subplot(122);imshow(Image1);title('���ܺ��ͼƬ');
figure(2);subplot(211);imhist(Image0);title('ԭͼ�ĻҶ�ֱ��ͼ');subplot(212);imhist(Image1);title('���ܺ�ĻҶ�ֱ��ͼ');
imwrite(Image1, 'EN_James2.bmp');
b=ImgEntropy(Image1);
disp(a);
disp(b);
m