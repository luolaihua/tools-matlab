clear;  
% ʵ�ֻҶ�ͼ��ļ���
Image0 = imread('Lena.jpg'); 
Image111 = rgb2gray(Image0);
s = size(Image111);
mm = max(s);
%���ó�ֵ---��Կ
x(1) = 0.1;
y(1) = 0.1;
%���û������� u a b c
u=1.8;
a=0.5;
b=1;
c=1;


%����mm�Σ����ɻ�������x ,y
for i = 1:mm-1  
    x(i+1) = u * y(i) - c * x(i) * y(i);
    y(i+1) = a * x(i) * x(i) - b * x(i);
end 

x = mod(x * 1000000, 256);  % mod(a,b)���������a����b���������ȷ�˵mod(100,3)=1,mod(17,6)=5,����xΪ0-256������
x = uint8(x);  %uint8�ķ�Χ��0-255��matlab�ṩǿ��ת��Ϊuint8�ĺ�����uint8(number)��
                %����������������ǰѴ���255����ȫ��ǿ����Ϊ255����С��255�Ĳ����򱣳�ԭ�����䡣
                %Ҳ���ǽ�һ������ʹx���е�ֵ��0-255֮��
y = mod(y * 1000000, 256);  
y = uint8(y); 


n = 1;  
  
   for j = 1:s(2)  
        for i = 1:s(1)  
        
            k(i,j) = bitxor( x(i) ,y(j));  
            Image222(i,j) = bitxor(k(i,j), Image111(i, j));  
          
        end  
    end                  
                
                
figure(1);subplot(121);imshow(Image111);title('ԭͼ');subplot(122);imshow(Image222);title('���ܺ��ͼƬ');
