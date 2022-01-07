%利用Logistic混沌映射，对灰度图像进行序列加密
function v=lock_logistic_gray(picture,x0,y0,u,a,b,c)
 
Image111 = picture;
s = size(Image111);
mm = max(s);
%设置初值---秘钥
x(1) = x0;
y(1) = y0;

%迭代mm次，生成混沌序列x ,y
for i = 1:mm-1  
    x(i+1) = u * y(i) - c * x(i) * y(i);
    y(i+1) = a * x(i) * x(i) - b * x(i);
end 

x = mod(x * 1000000, 256);  % mod(a,b)就是求的是a除以b的余数。比方说mod(100,3)=1,mod(17,6)=5,所以x为0-256的序列
x = uint8(x);  %uint8的范围是0-255。matlab提供强制转换为uint8的函数即uint8(number)。
                %但这个函数的做法是把大于255的数全部强制置为255，而小于255的部分则保持原样不变。
                %也就是进一步处理，使x序列的值在0-255之间
y = mod(y * 1000000, 256);  
y = uint8(y); 

   for j = 1:s(2)  
        for i = 1:s(1)  
            k(i,j) = bitxor( x(i) ,y(j));  
            %Image222(i,j) = bitxor(k(i,j), Image111(i, j));  
     
        end  
    end                  
Fuc=reshape(k,s(1),s(2)); 
Image222=bitxor(Image111,Fuc);%异或操作加密

                
figure(1);subplot(121);imshow(Image111);title('原图');subplot(122);imshow(Image222);title('加密后的图片');

v=Rod;
% figure;
% imshow([picture,v]);