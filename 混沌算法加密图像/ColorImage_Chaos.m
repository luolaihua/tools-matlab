clear; 
% 实现彩色图像的加密


Image000 = imread('Lena.jpg'); 
%Image111 = rgb2gray(Image0);
s = size(Image000); 
mm = max(s);
%设置初值---秘钥
x(1) = 0.1;
y(1) = 0.1;
%设置混沌因子 u a b c
u=1.8;
a=0.5;
b=1;
c=1;

%-------------------------------------对应第一组方程
%迭代mm次，生成混沌序列x ,y
for i = 1:mm-1  
    x(i+1) = u * y(i) - c * x(i) * y(i);
    y(i+1) = a * x(i) * x(i) - b * x(i);
end 

%-------------------------------------对应第二、三组方程，处理混沌序列

x = mod(x * 1000000, 256);  % mod(a,b)就是求的是a除以b的余数。比方说mod(100,3)=1,mod(17,6)=5,所以m为0-256的序列
x = uint8(x);  %uint8的范围是0-255。matlab提供强制转换为uint8的函数即uint8(number)。
                %但这个函数的做法是把大于255的数全部强制置为255，而小于255的部分则保持原样不变。
                %也就是进一步处理，是m序列的值在0-255之间
y = mod(y * 1000000, 256);  
y = uint8(y); 
 

 %-------------------------------------对应第四、五组方程 ，实现图像的加密
for h = 1:s(3)  
    for j = 1:s(2)  
        for i = 1:s(1)  
            k(i,j) = bitxor( x(i) ,y(j));  
            Image222(i,j,h) = bitxor(k(i,j), Image000(i,j,h));   
        end  
    end  
end  
                
figure(1);subplot(121);imshow(Image000);title('原图');subplot(122);imshow(Image222);title('加密后的图片');
