%排序
clc;
clear all;
data=input('请输入一串数字，例如[5 8 9 66 4]:');
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
disp('该串数字从大到小的顺序为：');
disp(data)
