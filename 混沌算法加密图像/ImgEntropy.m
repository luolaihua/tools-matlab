function [res] = ImgEntropy(I)
%��ͼ����ֵ
%����һ�Ų�ɫͼƬ�ľ���
%���ͼƬ��ͼ����ֵ

I_gray = rgb2gray(I);
[ROW,COL] = size(I_gray);


%%
%�½�һ��size =256�ľ�������ͳ��256���Ҷ�ֵ�ĳ��ִ���
temp = zeros(256);
for i= 1:ROW

for j = 1:COL
%ͳ�Ƶ�ǰ�Ҷȳ��ֵĴ���
temp(I_gray(i,j)+1)= temp(I_gray(i,j)+1)+1;

end
end

%%

res = 0.0 ; 
for  i = 1:256
%���㵱ǰ�Ҷ�ֵ���ֵĸ���
temp(i) = temp(i)/(ROW*COL);

%�����ǰ�Ҷ�ֵ���ֵĴ�����Ϊ0
if temp(i)~=0.0

res = res - temp(i) * (log(temp(i)) / log(2.0));
end
end
disp(res);
end