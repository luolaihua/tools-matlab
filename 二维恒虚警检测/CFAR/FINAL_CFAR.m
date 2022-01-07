% 二维CA-CFAR目标检测过程仿真
close all;clc;
%%导入数据
load('radar_image.mat');
figure('name','原始数据二维图')
imagesc(abs(radar_image)) 
figure('name','原始数据三维图')
mesh(abs(radar_image)) 
data_r=radar_image;
[Na,Nr]=size(radar_image);


%% 雷达参数设置
fc = 10e9;      %载波频率
B = 20e6;       %带宽
T = 20e-6;      %时宽
Tprf = 200e-6;  %脉冲周期
C = 3e8;        %传播速度
K = B/T;        %调频系数
fs =  2*B;      %取样频率
ts = 1/fs;
PulseNum = 256;  %脉压点数
TprfSampleNum = Tprf*fs;   %周期离散化
PulseSampleNum = floor(T*fs);   %脉冲离散化 
dis1 = 10000;       %目标距离
v1 = 10;            %目标速度
snr1 = 0;           %信噪比
Fp=2*dis1/C;        %时间延迟      
fd1=2*v1/C*fc;      %多普勒频率     

%% 信号加噪
Amp_max=max(abs(data_r(1,:)));   %压缩后信号的最大幅度
SNR=-34;    %压缩后信噪比
sigma_noise=Amp_max*10^(-SNR/20);     %噪声σ，信号功率Amp_max^2;所以信噪比SNR=20log(Amp_max/σ)
% ===========加噪==============
real_noise=randn(Na,Nr);  %实部噪声
imag_noise=randn(Na,Nr);  %虚部噪声，功率为总功率的一半
noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %产生额定信噪比的噪声
data_r=data_r+noise;   %信号加噪声
figure('name','加噪数据')
imagesc(abs(data_r));
figure('name','加噪数据mesh')
mesh(abs(data_r)) 
%%信噪比计算
snr=MY_SNR(radar_image,data_r);
fprintf('加噪信号信噪比：%f\n', snr )

%% 回波生成
tao1 = 2*dis1/C;               %时间延迟
t_qt = ((0:TprfSampleNum-1))/fs;  %[0, 200e-6], 
n_delay = floor(tao1*fs);   %时间延迟设置为整数个采样时间

i = 1:PulseNum;
Duo= exp(-1i*2*pi*fd1*i*Tprf);  %多普勒频移
Duo1 = repmat(Duo,Na,Nr);
Duo2 = Duo1(:,1:128);
data_r = data_r.* Duo2;   %混频
data_r = circshift(data_r,[0,n_delay]);  %得到回波信号有时延和多普勒频率

figure('name','回波图像二维')
imagesc(abs(data_r)) 
figure('name','回波图像三维')
mesh(abs(data_r)) 
%%信噪比计算
snr=MY_SNR(radar_image,data_r);
fprintf('回波信号信噪比：%f\n', snr )



% data_r_fd=fftshift(fft(data_r,[],1),1);
% figure('name','回波信号')
% imagesc(abs(data_r_fd));




data_pingfang=data_r.*conj(data_r);  %数据的平方，噪声是高斯分布，噪声的平方是指数分布
figure('name','data_pingfang')
 mesh(data_pingfang)
log_data_pingfang=10*log10(data_pingfang);   %功率dB
% figure('name','功率')
% plot(log_data_pingfang(1,:));
% xlabel('距离/m');ylabel('幅度'); hold on;

%%信噪比计算
snr=MY_SNR(radar_image,log_data_pingfang);
fprintf('平方后信号信噪比：%f\n', snr )


%% 二维CFAR
up=4;   %上面4个
low=up;
left=4;   %左面4个
right=left;
left_pro=2;
right_pro=2;
up_pro=2;
low_pro=2;
num_cankao=(up+low+1)*(left+right+1)-(left_pro+right_pro+1)*(up_pro+low_pro+1);   %参考单元9*9包围中间25个保护单元和检测单元，所以是56个
num_protect=(2+2+1)*(2+2+1)-1;   %5*5包围一个检测单元，所以为24个
Pfa=1e-6;   %恒虚警率
alpha1=num_cankao*(Pfa^(-1/num_cankao)-1);   %系数  门限系数
alpha=12;   %系数  门限系数  画出检测门限分别为8dB, 10dB 和 12dB 时的二维恒虚警检测结果
detect_result=zeros(Na,Nr);
for m=up+1:Na-low  %行
    for n=left+1:Nr-right  %列
     data_select=sum(sum(data_pingfang(m-up:m+low,n-left:n+right)))-sum(sum(data_pingfang(m-up_pro:m+low_pro,n-left_pro:n+right_pro)));   
     threshold(m,n)=data_select/num_cankao*alpha;       
     if data_pingfang(m,n)>=threshold(m,n)
        detect_result(m,n)=1;
     end
    end
end
hold on;
mesh(threshold); 
figure('name','检测结果二维')
imagesc(detect_result)
figure('name','检测结果三维')
mesh(detect_result) 
%%信噪比计算
snr=MY_SNR(radar_image,detect_result);
fprintf('检测结果信号信噪比：%f\n', snr )
fprintf('检测门限：%f\n', alpha1)






