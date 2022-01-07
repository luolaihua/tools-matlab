
clear;  
%Image0 = imread('1.jpg'); 
Image0 = imread('Lena.jpg'); 
a=ImgEntropy(Image0);


s = size(Image0);  %
N = s(1) * s(2) * s(3); 

m(1) = input('输入加密密钥： ');  %秘钥为初值
disp('加密中...'); 

u=4;% 加密因子

%迭代N次，生成混沌序列m
for i = 1:N-1  
    m(i+1) = u * m(i) - u * m(i)^2;
    m;
end 



m;%0-1的小数
m = mod(m * 1000, 256);  % mod(a,b)就是求的是a除以b的余数。比方说mod(100,3)=1,mod(17,6)=5,所以m为0-256的序列

m = uint8(m);  %uint8的范围是0-255。matlab提供强制转换为uint8的函数即uint8(number)。
                %但这个函数的做法是把大于255的数全部强制置为255，而小于255的部分则保持原样不变。
                %也就是进一步处理，是m序列的值在0-255之间

                
n = 1;  
for i = 1:s(3)  
    for j = 1:s(2)  
        for k = 1:s(1)  
            Image1(k, j, i) = bitxor(m(n), Image0(k ,j, i));  
            n = n + 1;  
        end  
    end  
end  
disp('加密成功!'); 
figure(1);subplot(121);imshow(Image0);title('原图');subplot(122);imshow(Image1);title('加密后的图片');
figure(2);subplot(211);imhist(Image0);title('原图的灰度直方图');subplot(212);imhist(Image1);title('加密后的灰度直方图');
imwrite(Image1, 'EN_James2.bmp');
b=ImgEntropy(Image1);
disp(a);
disp(b);
m