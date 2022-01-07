% 二维CA-CFAR目标检测过程仿真

clear all;close all;clc;

%% 雷达参数设定
c=3e8;
fc=1e9;
lamda=c/fc;

Tp=10e-6;  %脉冲宽度
B=20e6;    %带宽
kr=B/Tp;   %调频斜率
fs=30e6;   %快时间采样率
ts=1/fs;   %时间采样间隔
pulse_sample_num=floor(Tp*fs);  %脉冲采样点数

R=10e3;    %目标距离10km
delay=2*R/c;  %时延
t=(delay-pulse_sample_num*ts):ts:(delay+2*pulse_sample_num*ts);
Nr=length(t);
t_start=t(1);
r_axis_real=t*c/2;     %绝对距离坐标轴

PRF = 256;
pri = 1/PRF;
Na = 512;    %脉冲个数，积累2s
ta = (0:Na-1)*pri;   %慢时间
%% 信号产生、脉冲压缩、加噪
for na=1:Na
    receiver_sig(na,:)= rectpuls(t-Tp/2-delay,Tp).*exp(1i*2*pi*fc*(-delay)).*exp(1i*pi*kr*(t-Tp/2-delay).^2);  
end
figure
imagesc(abs(receiver_sig))

st=rectpuls(t-t_start-Tp/2,Tp).*exp(1i*pi*kr*(t-t_start-Tp/2).^2);   %参考信号，实质时间是从0开始的，所以压缩完后反映的是真实距离

fft_st=fft(st);   %参考信号fft
receive_fft=fft(receiver_sig,[],2);   %接收信号fft 
for na=1:Na
    data_r(na,:)=ifft(receive_fft(na,:).*conj(fft_st));
end
figure
imagesc(abs(data_r));

Amp_max=max(abs(data_r(1,:)));   %压缩后信号的最大幅度
SNR=-5;    %压缩后信噪比
sigma_noise=Amp_max*10^(-SNR/20);     %噪声σ，信号功率Amp_max^2;所以信噪比SNR=20log(Amp_max/σ)
% ===========第一种加噪方式==============
real_noise=randn(Na,Nr);  %实部噪声
imag_noise=randn(Na,Nr);  %虚部噪声，功率为总功率的一半
noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %产生额定信噪比的噪声
data_r=data_r+noise;   %信号加噪声
% ==========第二种加噪方式===============
% for na=1:Na
%     real_noise=randn(1,Nr);
%     imag_noise=randn(1,Nr);
%     noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %产生额定信噪比的噪声
%     data_r(na,:)=data_r(na,:)+noise;
% end
% ======================================
figure
imagesc(abs(data_r));
data_r_fd=fftshift(fft(data_r,[],1),1);
figure
imagesc(abs(data_r_fd));


data_pingfang=data_r_fd.*conj(data_r_fd);  %数据的平方，噪声是高斯分布，噪声的平方是指数分布
figure
mesh(data_pingfang)
% log_data_pingfang=10*log10(data_pingfang);   %功率dB
% figure
% plot(log_data_pingfang(1,:));
% xlabel('距离/m');ylabel('幅度'); hold on;

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
alpha=num_cankao*(Pfa^(-1/num_cankao)-1);   %系数  门限系数
%alpha=5;   %系数  门限系数
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
figure
imagesc(detect_result)







