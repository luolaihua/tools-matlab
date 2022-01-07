function [Target_Num,Target_R,Target_C,U]=Func_2DCFAR(xx,xx_r,xx_c,Peak_Num,Peak_R,Peak_C,BoundaryL_L,BoundaryL_R,BoundaryR_L,BoundaryR_R,Pfa)
%Target_NumΪ��ά���龯���õ���Ŀ����Ŀ��Target_R,Target_C�ֱ�ΪĿ���ھ����е�λ��
%xx��xx_r,xx_cΪԭʼ��ά���ݣ�����������,�ֱ��ʾ����Ԫ�Ͷ�����Ƶ��
%Peak_Num,Peak_R,Peak_CΪ��ֵ������õķ����Ŀ������λ��
%PfaΪ�龯��
%BoundaryL_L...Ϊһ�׷�ı߽�

Target_Num=0;
Target_R=0;
Target_C=0;
TargetNuminPeak=0;
DetecBord=zeros(Peak_Num,4);%�洢ÿ����ֵ�ļ��߽�,1,2,3,4��Ϊ�������ұ߽�ֵ
DetecBord(:,1)=1;
DetecBord(:,2)=xx_r;
DetecWin=zeros(Peak_Num,4);%�洢ÿ����ֵ�ļ�ⴰ��1��2,3,4��Ϊ�������ұ߽�ֵ
num_PeakinFirstord=0;%����һ�׷�ķ�ֵ
num_NoEffectWin=0;%����߽�̫�����޷��γ���Ч��ⴰ�ķ�ֵ
Power_sum=0; 
Power_sum_size=0;
Power_minus=0;
Power_minus_size=7;
Power_noise=0;
Power_noise_Average=0;
%%���δ��������ҳ����������£���ʱ��
% WinUp=6;
% WinDown=6;
% WinLeft=10;
% WinRight=10;

PeakEffet_Num=0;
%%%%%%%%%����ֵ����
for i=1:Peak_Num
    %%%%%%%%%%%%%%%����һ�׷彫�������׻���Ϊ��������
    peak_row=Peak_R(i);
    peak_col=Peak_C(i);
    if peak_col<BoundaryL_L
        DetecBord(i,3)=1;
        DetecBord(i,4)=BoundaryL_L-1;
    elseif peak_col>BoundaryL_R&&peak_col<BoundaryR_L
            DetecBord(i,3)=BoundaryL_R+1;
            DetecBord(i,4)=BoundaryR_L-1;
    elseif peak_col>BoundaryR_R
            DetecBord(i,3)=BoundaryR_R+1;
            DetecBord(i,4)=xx_c;
    else
            num_PeakinFirstord=num_PeakinFirstord+1;
            continue;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%���ɶ�ά��ⴰ
    %��ֵ�㸽�����¸�һ������Ԫ�����Ҹ�����Ƶ�����������̫ǿ����������������
    %���ݷ�ֵ�㵽���߽�ľ��룬�ж��Ƿ��������μ�ⴰ�������γ���Ч�ļ�ⴰ
    %�޷��γ���Ч��ⴰ������
    if DetecBord(i,4) - peak_col < 2 || peak_col - DetecBord(i,3) < 2|| peak_row - DetecBord(i,1) < 1 || DetecBord(i,2) - peak_row < 1
       num_NoEffectWin=num_NoEffectWin+1;
       continue;     
    end           %���Ը÷�ֵ���м��
  
    %%����ֵ̫�����߽磬���ʵ���С��ⴰ�ı߳�
    WinUp=4;         %��ⴰȡ��ȡС���������ȫ��ͬ��
    WinDown=4;   
    WinLeft=10;
    WinRight=10;
    if peak_row-WinUp<DetecBord(i,1)
       WinUp=peak_row-DetecBord(i,1);
    end
    if peak_row+WinDown>DetecBord(i,2)
        WinDown=DetecBord(i,2)-peak_row;
    end
    if peak_col-WinLeft<DetecBord(i,3)
        WinLeft=peak_col-DetecBord(i,3);
    end
    if peak_col+WinRight>DetecBord(i,4)
        WinRight=DetecBord(i,4)-peak_col;
    end
   
    PeakEffet_Num=PeakEffet_Num+1;            %��Ч�ļ���
    PeakEffet(PeakEffet_Num)=i;               %ÿ�������Ӧ�ķ�ֵ�����
    PeakEffet_R(PeakEffet_Num)=peak_row;      %ÿ������������
    PeakEffet_C(PeakEffet_Num)=peak_col;      %ÿ������������
    
    %%%%%���Ƽ�ⴰ�ڵ�ƽ����������
    xu(PeakEffet_Num)=peak_row-WinUp;
    xd(PeakEffet_Num)=peak_row+WinDown;
    xl(PeakEffet_Num)=peak_col-WinLeft;
    xr(PeakEffet_Num)=peak_col+WinRight;
    
%     XU(PeakEffet_Num)=peak_row-WinUp;
%     disp(XU(PeakEffet_Num));
%     XD(PeakEffet_Num)=peak_row+WinDown;
%     XL(PeakEffet_Num)=peak_col-WinLeft;
%     XR(PeakEffet_Num)=peak_col+WinRight;
    Power_min=min(min(xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num))));
    xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num))=xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num))-Power_min;%���⹦�ʵ���ʱ����������
    Power_sum(PeakEffet_Num)=sum(sum(xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num))));
    [m,n]=size(xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num)));
    Power_sum_size(PeakEffet_Num)=m*n;
    Power_minus(PeakEffet_Num)=sum(xx(peak_row,peak_col-2:peak_col+2))+xx(peak_row-1,peak_col)+xx(peak_row+1,peak_col);
    Power_minus_size=7;
    Noise_Num=Power_sum_size(PeakEffet_Num)-Power_minus_size;
    Power_noise(PeakEffet_Num)=Power_sum(PeakEffet_Num)-Power_minus(PeakEffet_Num);
    Power_noise_Average(PeakEffet_Num)=Power_noise(PeakEffet_Num)/(Power_sum_size(PeakEffet_Num)-Power_minus_size);
    
%     Power_sum(PeakEffet_Num)=sum(sum(xx(XU(PeakEffet_Num):XD(PeakEffet_Num),XL(PeakEffet_Num):XR(PeakEffet_Num))));
%     Power_sum_size(PeakEffet_Num)=(WinUp+WinDown+1)*(WinRight+WinLeft+1);
%     disp(Power_sum_size(PeakEffet_Num));
%     Power_minus(PeakEffet_Num)=sum(xx(peak_row,peak_col-2:peak_col+2))+xx(peak_row-1,peak_col)+xx(peak_row+1,peak_col);
%     Power_minus_size=7;
%     Power_noise(PeakEffet_Num)=Power_sum(PeakEffet_Num)-Power_minus(PeakEffet_Num);
%     Power_noise_Average(PeakEffet_Num)=Power_noise(PeakEffet_Num)/(Power_sum_size(PeakEffet_Num)-Power_minus_size);
    
    %%%%�����龯��
%     Pfa=1.2e-2;   %ȡ2e-2ʱ���4��Ŀ�꣬ȡ1.3e-2ʱ���1��Ŀ�꣬С��1.2e-2ʱ�첻��Ŀ��
%     K=sqrt(-4*log(Pfa)/pi);   
     K=(Pfa.^(-1/Power_sum_size(PeakEffet_Num))-1)*Power_sum_size(PeakEffet_Num);
     U0(PeakEffet_Num)=K*Power_noise_Average(PeakEffet_Num);  %%%%%%������������ֵ���Ǹ�ֵ���Ƿ���Ҫ��������ֵ�ȱ����ֵ�������жϣ�
     piontfordetec=xx(peak_row,peak_col);
     if piontfordetec>U0(PeakEffet_Num)
         Target_Num=Target_Num+1;
         Target_R(Target_Num)=peak_row;
         Target_C(Target_Num)=peak_col;
         U0(PeakEffet_Num)
     end
    
%     K=sqrt(-4*log(Pfa)/pi);
%     K=(Pfa.^(-1/(Power_sum_size(PeakEffet_Num)-Power_minus_size))-1)*(Power_sum_size(PeakEffet_Num)-Power_minus_size);
%     U0(PeakEffet_Num)=K*Power_noise_Average(PeakEffet_Num);
%     if xx(peak_row,peak_col)>U0(PeakEffet_Num)
%         Target_Num=Target_Num+1;
%         TargetNuminPeak(Target_Num)=i;
%         Target_R(Target_Num)=Peak_R(i);
%         Target_C(Target_Num)=Peak_C(i);
%     end
end
% PointForDetec=piontfordetec;
U=U0;
% Peak_U0_Sub=xx(PeakEffet_R(:),PeakEffet_C(:))-U0(:);