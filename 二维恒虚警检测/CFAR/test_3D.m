% ��άCA-CFARĿ������̷���
close all;clc;
%%��������
load('radar_image.mat');
figure('name','ԭʼ���ݶ�άͼ')
imagesc(abs(radar_image)) 
figure('name','ԭʼ������άͼ')
mesh(abs(radar_image)) 
data_r=radar_image;
[Na,Nr]=size(radar_image);


%% �״��������
fc = 10e9;      %�ز�Ƶ��
B = 20e6;       %����
T = 20e-6;      %ʱ��
Tprf = 200e-6;  %��������
C = 3e8;        %�����ٶ�
K = B/T;        %��Ƶϵ��
fs =  2*B;      %ȡ��Ƶ��
ts = 1/fs;
PulseNum = 256;  %��ѹ����
TprfSampleNum = Tprf*fs;   %������ɢ��
PulseSampleNum = floor(T*fs);   %������ɢ�� 
dis1 = 10000;       %Ŀ�����
v1 = 10;            %Ŀ���ٶ�
snr1 = 0;           %�����
Fp=2*dis1/C;        %ʱ���ӳ�      
fd1=2*v1/C*fc;      %������Ƶ��     
%% �ز�����
tao1 = 2*dis1/C;               %ʱ���ӳ�
t_qt = ((0:TprfSampleNum-1))/fs;  %[0, 200e-6], 
n_delay = floor(tao1*fs);   %ʱ���ӳ�����Ϊ����������ʱ��

i = 1:PulseNum;
Duo= exp(-1i*2*pi*fd1*i*Tprf);  %������Ƶ��
Duo1 = repmat(Duo,Na,Nr);
Duo2 = Duo1(:,1:128);

%% �źż���
Amp_max=max(abs(data_r(1,:)));   %ѹ�����źŵ�������
SNR=-20;    %ѹ���������
sigma_noise=Amp_max*10^(-SNR/20);     %�����ң��źŹ���Amp_max^2;���������SNR=20log(Amp_max/��)
% ===========����==============
real_noise=randn(Na,Nr);  %ʵ������
imag_noise=randn(Na,Nr);  %�鲿����������Ϊ�ܹ��ʵ�һ��
noise=sigma_noise*(real_noise+1i*imag_noise)/2^0.5;    %���������ȵ�����
data_r=data_r+noise;   %�źż�����
figure('name','��������')
imagesc(abs(data_r));
figure('name','��������mesh')
mesh(abs(data_r)) 
%%����ȼ���
snr=MY_SNR(radar_image,data_r);
fprintf('�����ź�����ȣ�%f\n', snr )


data_r = data_r.* Duo2;   %��Ƶ
data_r = circshift(data_r,[0,n_delay]);  %�õ��ز��ź���ʱ�ӺͶ�����Ƶ��

figure('name','�ز�ͼ���ά')
imagesc(abs(data_r)) 
figure('name','�ز�ͼ����ά')
mesh(abs(data_r)) 





data_r_fd=fftshift(fft(data_r,[],1),1);
% figure('name','�ز��ź�')
% imagesc(abs(data_r_fd));

%%����ȼ���
snr=MY_SNR(radar_image,data_r_fd);
fprintf('�ز��ź�����ȣ�%f\n', snr )



data_pingfang=data_r_fd.*conj(data_r_fd);  %���ݵ�ƽ���������Ǹ�˹�ֲ���������ƽ����ָ���ֲ�
% figure('name','data_pingfang')
% mesh(data_pingfang)
log_data_pingfang=10*log10(data_pingfang);   %����dB
figure('name','����')
plot(log_data_pingfang(1,:));
xlabel('����/m');ylabel('����'); hold on;

%%����ȼ���
snr=MY_SNR(radar_image,log_data_pingfang);
fprintf('ƽ�����ź�����ȣ�%f\n', snr )


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
alpha=12;   %ϵ��  ����ϵ��  ����������޷ֱ�Ϊ8dB, 10dB �� 12dB ʱ�Ķ�ά���龯�����------������
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
figure('name','ԭʼ����mesh')
mesh(detect_result) 
%%����ȼ���
snr=MY_SNR(radar_image,detect_result);
fprintf('������ź�����ȣ�%f\n', snr )







