function [Framedata]=cfar_detector2_1(freqdate,numRange,numVelocity,numGuardCellRange,numTrainingCellRange,numGuardCellVelocity,numTrainingCellVelocity,powerThreshold,snrThreshold)
% 二维恒虚警，十字型检测法
% 雷达实际接收到的原始数据排成M*N矩阵，M是积累脉冲个数，N是距离单元个数。fft后，在距离-多普勒二维平面上，目标只占据时宽和频宽，杂波占据了整个平面。
% 二维CFAR可以增加有效的参考单元数，减小杂波参数估计值的起伏，常见的二维参考窗是矩形窗。
% 只利用和检测单元处在同一距离单元，及处在同一多普勒单元的这些单元作为参考单元，即十字型结构。
% 滑窗选用 6*6 大小，检测中间单元，左右及上下2个单元是保护单元，其他是参考单元。
% 相当于吧距离域当作前窗，频率域当作后窗，采用类似OSCFAR检测器。

% numRange 距离维度；numVelocity 速度维度；
% numGuardCellRange保护距离维度；numTrainingCellRange参考距离维度；
%numGuardCellVelocity保护速度维度；numTrainingCellVelocity 参考速度维度；
% powerThreshold 信号强度阈值；snrThreshold 信噪比阈值；
Framedata = struct('r',[],'v',[],'snr',[]);
SNR = zeros(numRange,numVelocity);
m = 0;
for ii=1:numRange
    for jj=1:numVelocity %%分九种情况
        freqdate1=0;%下
        freqdate2=0;%右
        freqdate3=0;%上
        freqdate4=0;%左
        if ii+numGuardCellRange+numTrainingCellRange<numRange
            for iii=ii+numGuardCellRange+1:ii+numGuardCellRange+numTrainingCellRange
                freqdate1=freqdate1+freqdate(iii,jj);
            end
        end
        if jj+numTrainingCellVelocity+numTrainingCellRange<numVelocity
            for jjj=jj+numTrainingCellVelocity+1:jj+numTrainingCellVelocity+numTrainingCellRange
                freqdate2=freqdate2+freqdate(ii,jjj);
            end
        end
        if ii-numGuardCellRange-numTrainingCellRange>0
            for iii=ii-numGuardCellRange-numTrainingCellRange:ii-numGuardCellRange-1
                freqdate3=freqdate3+freqdate(iii,jj);
            end
        end
        if jj-numTrainingCellVelocity-numTrainingCellRange>0
            for jjj=jj-numTrainingCellVelocity-numTrainingCellRange:jj-numTrainingCellVelocity-1
                freqdate4=freqdate4+freqdate(ii,jjj);
            end
        end
        if ii<numGuardCellRange+numTrainingCellRange+1 && ...
                jj<numGuardCellVelocity+numTrainingCellVelocity+1 %左上角
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2)*...
                (numTrainingCellRange+numTrainingCellVelocity); %下方、右方
        elseif ii<numGuardCellRange+numTrainingCellRange+1&&jj>...
                numGuardCellVelocity+numTrainingCellVelocity&&jj<...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity...
                +1 %上边缘
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2+freqdate4)...
                *(numTrainingCellRange+numTrainingCellVelocity*2);%左边、下边、右边
        elseif ii<numGuardCellRange+numTrainingCellRange+1&&jj>...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity %右上角
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate4)*...
                (numTrainingCellRange +numTrainingCellVelocity); %左边、下边
        elseif ii>numGuardCellRange+numTrainingCellRange&&ii<...
                numRange-numGuardCellRange-numTrainingCellRange+...
                1&&jj<numGuardCellVelocity+numTrainingCellVelocity+1 %左边缘
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2+freqdate3)...
                *(numTrainingCellRange*2+numTrainingCellVelocity); %上边、右边、下边
        elseif ii>numGuardCellRange+numTrainingCellRange&&ii<...
                numRange-numGuardCellRange-numTrainingCellRange+...
                1&&jj>numGuardCellVelocity+numTrainingCellVelocity&&jj<...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity+1 %内部
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2+freqdate3+freqdate4)*(numTrainingCellRange...
                +numTrainingCellVelocity)*2; %上边、左边、下边、右边
        elseif ii>numGuardCellRange+numTrainingCellRange&&ii<numRange-...
                numGuardCellRange-numTrainingCellRange+1&&jj>numVelocity...
                -numGuardCellVelocity-numTrainingCellVelocity % 右边缘
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate3+freqdate4)*...
                (numTrainingCellRange*2+numTrainingCellVelocity); %左边、上边、下边
        elseif ii>numRange-numGuardCellRange-numTrainingCellRange&&jj<...
                numGuardCellVelocity+numTrainingCellVelocity+1 %左下角
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate2+freqdate3)*...
                (numTrainingCellRange+numTrainingCellVelocity); %上边、右边
        elseif ii>numRange-numGuardCellRange-numTrainingCellRange&&jj>...
                numGuardCellVelocity+numTrainingCellVelocity&&jj<...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity...
                +1 %下边缘
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate2+freqdate3+freqdate4)*...
                (numTrainingCellRange+numTrainingCellVelocity*2); %左边、上边、右边
        else %右下角
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate3+freqdate4)*...
                (numTrainingCellRange+numTrainingCellVelocity); %左边、上边
        end
    end
end
for ii=1:numRange
    for jj=1:numVelocity
        if (freqdate(ii,jj)>powerThreshold) &&( SNR(ii,jj)>snrThreshold) %信号强度及信噪比均满足则视为目标
            m = m+1;
            Framedata(m).r = ii;
            Framedata(m).v = jj;
            Framedata(m).snr = SNR(ii,jj);
        end
    end
end
end
