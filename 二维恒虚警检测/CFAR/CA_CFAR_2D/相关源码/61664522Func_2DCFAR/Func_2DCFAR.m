function [Target_Num,Target_R,Target_C,U]=Func_2DCFAR(xx,xx_r,xx_c,Peak_Num,Peak_R,Peak_C,BoundaryL_L,BoundaryL_R,BoundaryR_L,BoundaryR_R,Pfa)
%Target_Num为二维恒虚警检测得到的目标数目，Target_R,Target_C分别为目标在矩阵中的位置
%xx，xx_r,xx_c为原始三维数据，及其行列数,分别表示距离元和多谱勒频率
%Peak_Num,Peak_R,Peak_C为峰值检测所得的峰的数目，及其位置
%Pfa为虚警率
%BoundaryL_L...为一阶峰的边界

Target_Num=0;
Target_R=0;
Target_C=0;
TargetNuminPeak=0;
DetecBord=zeros(Peak_Num,4);%存储每个峰值的检测边界,1,2,3,4列为上下左右边界值
DetecBord(:,1)=1;
DetecBord(:,2)=xx_r;
DetecWin=zeros(Peak_Num,4);%存储每个峰值的检测窗，1，2,3,4列为上下左右边界值
num_PeakinFirstord=0;%落入一阶峰的峰值
num_NoEffectWin=0;%距离边界太近而无法形成有效检测窗的峰值
Power_sum=0; 
Power_sum_size=0;
Power_minus=0;
Power_minus_size=7;
Power_noise=0;
Power_noise_Average=0;
%%矩形窗上向左右长度设置如下（暂时）
% WinUp=6;
% WinDown=6;
% WinLeft=10;
% WinRight=10;

PeakEffet_Num=0;
%%%%%%%%%将峰值分区
for i=1:Peak_Num
    %%%%%%%%%%%%%%%根据一阶峰将多普勒谱划分为三个区域
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
    %%%%%%%%%%%%%%%%%%%%%%%%生成二维检测窗
    %峰值点附近上下各一个距离元，左右各两个频点由于相关性太强，不参与噪声估计
    %根据峰值点到检测边界的距离，判断是否调整其矩形检测窗长度以形成有效的检测窗
    %无法形成有效检测窗的条件
    if DetecBord(i,4) - peak_col < 2 || peak_col - DetecBord(i,3) < 2|| peak_row - DetecBord(i,1) < 1 || DetecBord(i,2) - peak_row < 1
       num_NoEffectWin=num_NoEffectWin+1;
       continue;     
    end           %不对该峰值进行检测
  
    %%若峰值太靠近边界，则适当减小检测窗的边长
    WinUp=4;         %检测窗取大取小，检测结果完全不同！
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
   
    PeakEffet_Num=PeakEffet_Num+1;            %有效的检测点
    PeakEffet(PeakEffet_Num)=i;               %每个检测点对应的峰值的序号
    PeakEffet_R(PeakEffet_Num)=peak_row;      %每个检测点所在行
    PeakEffet_C(PeakEffet_Num)=peak_col;      %每个检测点所在列
    
    %%%%%估计检测窗内的平均噪声功率
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
    xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num))=xx(xu(PeakEffet_Num):xd(PeakEffet_Num),xl(PeakEffet_Num):xr(PeakEffet_Num))-Power_min;%避免功率叠加时，正负抵消
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
    
    %%%%设置虚警率
%     Pfa=1.2e-2;   %取2e-2时检出4个目标，取1.3e-2时检出1个目标，小于1.2e-2时检不出目标
%     K=sqrt(-4*log(Pfa)/pi);   
     K=(Pfa.^(-1/Power_sum_size(PeakEffet_Num))-1)*Power_sum_size(PeakEffet_Num);
     U0(PeakEffet_Num)=K*Power_noise_Average(PeakEffet_Num);  %%%%%%由于噪声估计值都是负值，是否需要把所有谱值先变成正值，再做判断？
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