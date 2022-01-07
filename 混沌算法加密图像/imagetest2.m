%加密方法，混沌序列
clc,close all
t1=clock;
A=imread('D:\1.jpg'); 
imshow(A); title('原图') 
[M,N]=size(A);%原始图像A的尺寸一MxN 
u1=4;u2=4;
x1(1)=0.7;
x2(1)=0.7; 
sumA=sum(sum(A));  
k=mod(sumA,256)*1.0/255; 
%x1(1)=(x1(1)+k)/2;
%x2(1)=(x2(1)+k)/2;  
y1(1)=(1/3.1415926)*asin(sqrt(x1(1))); 
y2(1)=(1/3.1415926)*asin(sqrt(x2(1)));  
for i=1:1:M*N-1 %产生2个Logistic混沌序列   
    x1(i+1)=u1*x1(i)*(1-x1(i));   
    x2(i+1)=u2*x2(i)*(1-x2(i)); 
end
for i=1:1:M*N  %改造2个Logistic,得到两个y序列
      y1(i)=(1/3.1415926)*asin(sqrt(x1(i)));   
      y2(i)=(1/3.1415926)*asin(sqrt(x2(i))); 
end
n=1;  
for i=1:1:M   %由yl和y2序列对原图像进行值替代加密     
    for j=1:1:N        
        if mod(n,1)==0           
            k(n)=mod(floor(y1(n)*10^15),256);       
        else
            k(n)=mod(floor(y2(n)*10^15),256);       
        end
        A1(i,j)=bitxor(A(i,j),k(n));  %得到加密像素      
        n=n+1;     
    end
end
figure,imshow(A1);title('混沌加密图像')  %输出得到的加密图像 
n=1;  
for i=1:1:M     
    for j=1:1:N          
        if mod(n,1)==0             
            k(n)=mod(floor(y1(n)*10^15),256);         
        else
            k(n)=mod(floor(y2(n)*10^15),256);         
        end
        A2(i,j)=bitxor(A1(i,j),k(n));  %得到加密像素      
        n=n+1;     
    end
end
figure,imshow(A2);title('解密图像')  %输出得到的解密图像
t2=clock;
etime(t2,t1)