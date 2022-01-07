% 二维CA-CFAR目标检测过程仿真
clear all;close all;clc;
%%导入数据
load('radar_image.mat');
figure('name','原始数据')
%imagesc(A) 将矩阵A中的元素数值按大小转化为不同颜色，并在坐标轴对应位置处以这种颜色染色
imagesc(abs(radar_image)) 
data_r=radar_image;
[Na,Nr]=size(radar_image);

%% 信号加噪
Amp_max=max(abs(data_r(1,:)));   %压缩后信号的最大幅度
SNR=-5;    %压缩后信噪比
sigma_noise=Amp_max*10^(-SNR/20);     %噪声σ，信号功率Amp_max^2;所以信噪比SNR=20log(Amp_max/σ)
% ===========加噪==============
real_noise=randn(Na,Nr);  %实部噪声
imag_noise=randn(Na,Nr);  %虚部噪声，功率为总功率的一半
noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %产生额定信噪比的噪声
data_r=data_r+noise;   %信号加噪声
figure('name','加噪数据')
imagesc(abs(data_r));


data_r_fd=fftshift(fft(data_r,[],1),1);
figure('name','啥啥啥数据')
imagesc(abs(data_r_fd));


data_pingfang=data_r_fd.*conj(data_r_fd);  %数据的平方，噪声是高斯分布，噪声的平方是指数分布
figure('name','data_pingfang')
mesh(data_pingfang)

%% 二维CFAR
shang=4;   %上面4个
xia=shang;
zuo=4;   %左面4个
you=zuo;
zuo_pro=2;
you_pro=2;
shang_pro=2;
xia_pro=2;
num_cankao=(shang+xia+1)*(zuo+you+1)-(zuo_pro+you_pro+1)*(shang_pro+xia_pro+1);   %参考单元9*9包围中间25个保护单元和检测单元，所以是56个
num_protect=(2+2+1)*(2+2+1)-1;   %5*5包围一个检测单元，所以为24个
Pfa=1e-6;   %恒虚警率
%alpha=num_cankao*(Pfa^(-1/num_cankao)-1);   %系数  门限系数
alpha=10;   %系数  门限系数  画出检测门限分别为8dB, 10dB 和 12dB 时的二维恒虚警检测结果------改这里
detect_result=zeros(Na,Nr);
for m=shang+1:Na-xia  %行
    for n=zuo+1:Nr-you  %列
     data_select=sum(sum(data_pingfang(m-shang:m+xia,n-zuo:n+you)))-sum(sum(data_pingfang(m-shang_pro:m+xia_pro,n-zuo_pro:n+you_pro)));   
     threshold(m,n)=data_select/num_cankao*alpha;       
     if data_pingfang(m,n)>=threshold(m,n)
        detect_result(m,n)=1;
     end
    end
end
hold on;
mesh(threshold); 
figure('name','检测结果')
imagesc(detect_result)







