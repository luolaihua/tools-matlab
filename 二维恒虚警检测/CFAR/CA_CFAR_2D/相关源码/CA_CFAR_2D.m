% ��άCA-CFARĿ������̷���

clear all;close all;clc;

%% �״�����趨
c=3e8;
fc=1e9;
lamda=c/fc;

Tp=10e-6;  %������
B=20e6;    %����
kr=B/Tp;   %��Ƶб��
fs=30e6;   %��ʱ�������
ts=1/fs;   %ʱ��������
pulse_sample_num=floor(Tp*fs);  %�����������

R=10e3;    %Ŀ�����10km
delay=2*R/c;  %ʱ��
t=(delay-pulse_sample_num*ts):ts:(delay+2*pulse_sample_num*ts);
Nr=length(t);
t_start=t(1);
r_axis_real=t*c/2;     %���Ծ���������

PRF = 256;
pri = 1/PRF;
Na = 512;    %�������������2s
ta = (0:Na-1)*pri;   %��ʱ��
%% �źŲ���������ѹ��������
for na=1:Na
    receiver_sig(na,:)= rectpuls(t-Tp/2-delay,Tp).*exp(1i*2*pi*fc*(-delay)).*exp(1i*pi*kr*(t-Tp/2-delay).^2);  
end
figure
imagesc(abs(receiver_sig))

st=rectpuls(t-t_start-Tp/2,Tp).*exp(1i*pi*kr*(t-t_start-Tp/2).^2);   %�ο��źţ�ʵ��ʱ���Ǵ�0��ʼ�ģ�����ѹ�����ӳ������ʵ����

fft_st=fft(st);   %�ο��ź�fft
receive_fft=fft(receiver_sig,[],2);   %�����ź�fft 
for na=1:Na
    data_r(na,:)=ifft(receive_fft(na,:).*conj(fft_st));
end
figure
imagesc(abs(data_r));

Amp_max=max(abs(data_r(1,:)));   %ѹ�����źŵ�������
SNR=-5;    %ѹ���������
sigma_noise=Amp_max*10^(-SNR/20);     %�����ң��źŹ���Amp_max^2;���������SNR=20log(Amp_max/��)
% ===========��һ�ּ��뷽ʽ==============
real_noise=randn(Na,Nr);  %ʵ������
imag_noise=randn(Na,Nr);  %�鲿����������Ϊ�ܹ��ʵ�һ��
noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %���������ȵ�����
data_r=data_r+noise;   %�źż�����
% ==========�ڶ��ּ��뷽ʽ===============
% for na=1:Na
%     real_noise=randn(1,Nr);
%     imag_noise=randn(1,Nr);
%     noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %���������ȵ�����
%     data_r(na,:)=data_r(na,:)+noise;
% end
% ======================================
figure
imagesc(abs(data_r));
data_r_fd=fftshift(fft(data_r,[],1),1);
figure
imagesc(abs(data_r_fd));


data_pingfang=data_r_fd.*conj(data_r_fd);  %���ݵ�ƽ���������Ǹ�˹�ֲ���������ƽ����ָ���ֲ�
figure
mesh(data_pingfang)
% log_data_pingfang=10*log10(data_pingfang);   %����dB
% figure
% plot(log_data_pingfang(1,:));
% xlabel('����/m');ylabel('����'); hold on;

%% ��άCFAR
shang=4;   %����4��
xia=shang;
zuo=4;   %����4��
you=zuo;
zuo_pro=2;
you_pro=2;
shang_pro=2;
xia_pro=2;
num_cankao=(shang+xia+1)*(zuo+you+1)-(zuo_pro+you_pro+1)*(shang_pro+xia_pro+1);   %�ο���Ԫ9*9��Χ�м�25��������Ԫ�ͼ�ⵥԪ��������56��
num_protect=(2+2+1)*(2+2+1)-1;   %5*5��Χһ����ⵥԪ������Ϊ24��
Pfa=1e-6;   %���龯��
alpha=num_cankao*(Pfa^(-1/num_cankao)-1);   %ϵ��  ����ϵ��
%alpha=5;   %ϵ��  ����ϵ��
detect_result=zeros(Na,Nr);
for m=shang+1:Na-xia  %��
    for n=zuo+1:Nr-you  %��
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







