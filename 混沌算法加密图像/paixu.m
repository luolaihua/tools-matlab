%����
clc;
clear all;
data=input('������һ�����֣�����[5 8 9 66 4]:');
[m n]=size(data);
for i=1:n-1
   for j=i+1:n
       if data(i)<data(j)
           t=data(i);
           data(i)=data(j);
           data(j)=t;
       end
   end
end
disp('�ô����ִӴ�С��˳��Ϊ��');
disp(data)
