%����Logistic����ӳ�䣬�ԻҶ�ͼ��������м���
function v=lock_logistic_gray(picture,x0,y0,u,a,b,c)
 
Image111 = picture;
s = size(Image111);
mm = max(s);
%���ó�ֵ---��Կ
x(1) = x0;
y(1) = y0;

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

   for j = 1:s(2)  
        for i = 1:s(1)  
            k(i,j) = bitxor( x(i) ,y(j));  
            %Image222(i,j) = bitxor(k(i,j), Image111(i, j));  
     
        end  
    end                  
Fuc=reshape(k,s(1),s(2)); 
Image222=bitxor(Image111,Fuc);%����������

                
figure(1);subplot(121);imshow(Image111);title('ԭͼ');subplot(122);imshow(Image222);title('���ܺ��ͼƬ');

v=Rod;
% figure;
% imshow([picture,v]);