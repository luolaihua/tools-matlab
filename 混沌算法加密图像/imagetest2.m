%���ܷ�������������
clc,close all
t1=clock;
A=imread('D:\1.jpg'); 
imshow(A); title('ԭͼ') 
[M,N]=size(A);%ԭʼͼ��A�ĳߴ�һMxN 
u1=4;u2=4;
x1(1)=0.7;
x2(1)=0.7; 
sumA=sum(sum(A));  
k=mod(sumA,256)*1.0/255; 
%x1(1)=(x1(1)+k)/2;
%x2(1)=(x2(1)+k)/2;  
y1(1)=(1/3.1415926)*asin(sqrt(x1(1))); 
y2(1)=(1/3.1415926)*asin(sqrt(x2(1)));  
for i=1:1:M*N-1 %����2��Logistic��������   
    x1(i+1)=u1*x1(i)*(1-x1(i));   
    x2(i+1)=u2*x2(i)*(1-x2(i)); 
end
for i=1:1:M*N  %����2��Logistic,�õ�����y����
      y1(i)=(1/3.1415926)*asin(sqrt(x1(i)));   
      y2(i)=(1/3.1415926)*asin(sqrt(x2(i))); 
end
n=1;  
for i=1:1:M   %��yl��y2���ж�ԭͼ�����ֵ�������     
    for j=1:1:N        
        if mod(n,1)==0           
            k(n)=mod(floor(y1(n)*10^15),256);       
        else
            k(n)=mod(floor(y2(n)*10^15),256);       
        end
        A1(i,j)=bitxor(A(i,j),k(n));  %�õ���������      
        n=n+1;     
    end
end
figure,imshow(A1);title('�������ͼ��')  %����õ��ļ���ͼ�� 
n=1;  
for i=1:1:M     
    for j=1:1:N          
        if mod(n,1)==0             
            k(n)=mod(floor(y1(n)*10^15),256);         
        else
            k(n)=mod(floor(y2(n)*10^15),256);         
        end
        A2(i,j)=bitxor(A1(i,j),k(n));  %�õ���������      
        n=n+1;     
    end
end
figure,imshow(A2);title('����ͼ��')  %����õ��Ľ���ͼ��
t2=clock;
etime(t2,t1)