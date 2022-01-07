clc;
clear;
 a=[17 24 1 8 15;23 5 7 14 16 ;4 6 13 20 22 ;10 12 19 21 3 ;11 18 25 2 9 ];
fid=fopen('b.txt','w');%写入文件路径
[m,n]=size(a);
 for i=1:1:m
    for j=1:1:n
       if j==n
         fprintf(fid,'%gn',a(i,j));
      else
        fprintf(fid,'%gt',a(i,j));
       end
    end
end
fclose(fid);