clear; 
clc,close all
t0=cputime;

%image = imread('1.jpg');
image = imread('Lena.jpg');
figure(2);subplot(121);imshow(image)
title('原图')

s = size(image);  
%N = s(1) * s(2) * s(3); 
M = s(1);
N=s(2);

m(1) = 0.222;  
disp('加密中...'); 
n(1)=m(1);


u=4;

for i = 1:M-1  
    m(i+1) = 3.8 * m(i) - 3.8 * m(i)^2;
end 

for i = 1:N-1  
    n(i+1) = 3.9 * n(i) - 3.9 * n(i)^2;
end 

m = mod(m * 10000, M);  
m1 = fix(m);  
n = mod(n * 10000, N);  
n1 = fix(n);  

%Rm      = randsample(M,M)';%转成行向量
%Rn      = randsample(N,N)';
Rm=m1;
Rn=n1;


zero_index = find(Rm==0);
Rm(zero_index) = Rm(zero_index)+3;

zero_index1 = find(Rn==0);
Rn(zero_index1) = Rn(zero_index1)+3;


Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];

for kkk=1:100
%打乱行顺序
image (Mchange(1,:),:) = image (Mchange(2,:),:);
%打乱列顺序
image (:,Nchange(1,:)) = image (:,Nchange(2,:));

end



figure(2);subplot(122);imshow(image);title('加密后图像')

