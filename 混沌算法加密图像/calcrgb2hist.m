function hist  = calcrgb2hist(picname)  
pic1 = imread(picname);  
pic1R = pic1(:,:,1);  
pic1G = pic1(:,:,2);  
pic1B = pic1(:,:,3);  
  
  
figure,imshow(pic1R)                   
title('R������ͼ��')  
  
  
% ��������ֱ��ͼ  
[m,n]=size(pic1R);                            %����ͼ��ߴ����  
rhist=zeros(1,256);                           %Ԥ������ŻҶȳ��ָ��ʵ�����  
for k=0:255      
    rhist(k+1)=length(find(pic1R==k))/(m*n);     %����ÿ���Ҷȳ��ֵĸ��ʣ��������rhist����Ӧλ��  
end  
figure,bar(0:255,rhist,'r')                   %����ֱ��ͼ   
title('R��ֱ��ͼ')  
xlabel('�Ҷ�ֵ')  
ylabel('���ָ���')  
%%  
ghist=zeros(1,256);   
for k=0:255      
    ghist(k+1)=length(find(pic1G==k))/(m*n);       
end  
figure,bar(0:255,ghist,'g')                  
title('G��ֱ��ͼ')  
xlabel('�Ҷ�ֵ')  
ylabel('���ָ���')  
  
  
%%  
bhist=zeros(1,256);   
for k=0:255      
    bhist(k+1)=length(find(pic1B==k))/(m*n);      
end  
figure,bar(0:255,bhist,'b')                   
title('B��ֱ��ͼ')  
xlabel('�Ҷ�ֵ')  
ylabel('���ָ���')  
hist = [reshape(rhist',1,256),reshape(ghist',1,256),reshape(bhist',1,256)]; %��ֱ��ͼƴ�ӳ� 256*3 ��������  
end  