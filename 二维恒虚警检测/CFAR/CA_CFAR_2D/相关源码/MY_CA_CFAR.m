% ��άCA-CFARĿ������̷���
clear all;close all;clc;
%%��������
load('radar_image.mat');
figure('name','ԭʼ����')
%imagesc(A) ������A�е�Ԫ����ֵ����Сת��Ϊ��ͬ��ɫ�������������Ӧλ�ô���������ɫȾɫ
imagesc(abs(radar_image)) 
data_r=radar_image;
[Na,Nr]=size(radar_image);

%% �źż���
Amp_max=max(abs(data_r(1,:)));   %ѹ�����źŵ�������
SNR=-5;    %ѹ���������
sigma_noise=Amp_max*10^(-SNR/20);     %�����ң��źŹ���Amp_max^2;���������SNR=20log(Amp_max/��)
% ===========����==============
real_noise=randn(Na,Nr);  %ʵ������
imag_noise=randn(Na,Nr);  %�鲿����������Ϊ�ܹ��ʵ�һ��
noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %���������ȵ�����
data_r=data_r+noise;   %�źż�����
figure('name','��������')
imagesc(abs(data_r));


data_r_fd=fftshift(fft(data_r,[],1),1);
figure('name','ɶɶɶ����')
imagesc(abs(data_r_fd));


data_pingfang=data_r_fd.*conj(data_r_fd);  %���ݵ�ƽ���������Ǹ�˹�ֲ���������ƽ����ָ���ֲ�
figure('name','data_pingfang')
mesh(data_pingfang)

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
%alpha=num_cankao*(Pfa^(-1/num_cankao)-1);   %ϵ��  ����ϵ��
alpha=10;   %ϵ��  ����ϵ��  ����������޷ֱ�Ϊ8dB, 10dB �� 12dB ʱ�Ķ�ά���龯�����------������
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
figure('name','�����')
imagesc(detect_result)







