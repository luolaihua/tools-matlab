function hist  = calcrgb2hist(picname)  
pic1 = imread(picname);  
pic1R = pic1(:,:,1);  
pic1G = pic1(:,:,2);  
pic1B = pic1(:,:,3);  
  
  
figure,imshow(pic1R)                   
title('R分量的图像')  
  
  
% 二，绘制直方图  
[m,n]=size(pic1R);                            %测量图像尺寸参数  
rhist=zeros(1,256);                           %预创建存放灰度出现概率的向量  
for k=0:255      
    rhist(k+1)=length(find(pic1R==k))/(m*n);     %计算每级灰度出现的概率，将其存入rhist中相应位置  
end  
figure,bar(0:255,rhist,'r')                   %绘制直方图   
title('R像直方图')  
xlabel('灰度值')  
ylabel('出现概率')  
%%  
ghist=zeros(1,256);   
for k=0:255      
    ghist(k+1)=length(find(pic1G==k))/(m*n);       
end  
figure,bar(0:255,ghist,'g')                  
title('G像直方图')  
xlabel('灰度值')  
ylabel('出现概率')  
  
  
%%  
bhist=zeros(1,256);   
for k=0:255      
    bhist(k+1)=length(find(pic1B==k))/(m*n);      
end  
figure,bar(0:255,bhist,'b')                   
title('B像直方图')  
xlabel('灰度值')  
ylabel('出现概率')  
hist = [reshape(rhist',1,256),reshape(ghist',1,256),reshape(bhist',1,256)]; %将直方图拼接成 256*3 的向量。  
end  