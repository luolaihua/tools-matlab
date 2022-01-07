function [Framedata]=cfar_detector2_1(freqdate,numRange,numVelocity,numGuardCellRange,numTrainingCellRange,numGuardCellVelocity,numTrainingCellVelocity,powerThreshold,snrThreshold)
% ��ά���龯��ʮ���ͼ�ⷨ
% �״�ʵ�ʽ��յ���ԭʼ�����ų�M*N����M�ǻ������������N�Ǿ��뵥Ԫ������fft���ھ���-�����ն�άƽ���ϣ�Ŀ��ֻռ��ʱ���Ƶ���Ӳ�ռ��������ƽ�档
% ��άCFAR����������Ч�Ĳο���Ԫ������С�Ӳ���������ֵ������������Ķ�ά�ο����Ǿ��δ���
% ֻ���úͼ�ⵥԪ����ͬһ���뵥Ԫ��������ͬһ�����յ�Ԫ����Щ��Ԫ��Ϊ�ο���Ԫ����ʮ���ͽṹ��
% ����ѡ�� 6*6 ��С������м䵥Ԫ�����Ҽ�����2����Ԫ�Ǳ�����Ԫ�������ǲο���Ԫ��
% �൱�ڰɾ�������ǰ����Ƶ�������󴰣���������OSCFAR�������

% numRange ����ά�ȣ�numVelocity �ٶ�ά�ȣ�
% numGuardCellRange��������ά�ȣ�numTrainingCellRange�ο�����ά�ȣ�
%numGuardCellVelocity�����ٶ�ά�ȣ�numTrainingCellVelocity �ο��ٶ�ά�ȣ�
% powerThreshold �ź�ǿ����ֵ��snrThreshold �������ֵ��
Framedata = struct('r',[],'v',[],'snr',[]);
SNR = zeros(numRange,numVelocity);
m = 0;
for ii=1:numRange
    for jj=1:numVelocity %%�־������
        freqdate1=0;%��
        freqdate2=0;%��
        freqdate3=0;%��
        freqdate4=0;%��
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
                jj<numGuardCellVelocity+numTrainingCellVelocity+1 %���Ͻ�
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2)*...
                (numTrainingCellRange+numTrainingCellVelocity); %�·����ҷ�
        elseif ii<numGuardCellRange+numTrainingCellRange+1&&jj>...
                numGuardCellVelocity+numTrainingCellVelocity&&jj<...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity...
                +1 %�ϱ�Ե
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2+freqdate4)...
                *(numTrainingCellRange+numTrainingCellVelocity*2);%��ߡ��±ߡ��ұ�
        elseif ii<numGuardCellRange+numTrainingCellRange+1&&jj>...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity %���Ͻ�
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate4)*...
                (numTrainingCellRange +numTrainingCellVelocity); %��ߡ��±�
        elseif ii>numGuardCellRange+numTrainingCellRange&&ii<...
                numRange-numGuardCellRange-numTrainingCellRange+...
                1&&jj<numGuardCellVelocity+numTrainingCellVelocity+1 %���Ե
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2+freqdate3)...
                *(numTrainingCellRange*2+numTrainingCellVelocity); %�ϱߡ��ұߡ��±�
        elseif ii>numGuardCellRange+numTrainingCellRange&&ii<...
                numRange-numGuardCellRange-numTrainingCellRange+...
                1&&jj>numGuardCellVelocity+numTrainingCellVelocity&&jj<...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity+1 %�ڲ�
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate2+freqdate3+freqdate4)*(numTrainingCellRange...
                +numTrainingCellVelocity)*2; %�ϱߡ���ߡ��±ߡ��ұ�
        elseif ii>numGuardCellRange+numTrainingCellRange&&ii<numRange-...
                numGuardCellRange-numTrainingCellRange+1&&jj>numVelocity...
                -numGuardCellVelocity-numTrainingCellVelocity % �ұ�Ե
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate1+freqdate3+freqdate4)*...
                (numTrainingCellRange*2+numTrainingCellVelocity); %��ߡ��ϱߡ��±�
        elseif ii>numRange-numGuardCellRange-numTrainingCellRange&&jj<...
                numGuardCellVelocity+numTrainingCellVelocity+1 %���½�
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate2+freqdate3)*...
                (numTrainingCellRange+numTrainingCellVelocity); %�ϱߡ��ұ�
        elseif ii>numRange-numGuardCellRange-numTrainingCellRange&&jj>...
                numGuardCellVelocity+numTrainingCellVelocity&&jj<...
                numVelocity-numGuardCellVelocity-numTrainingCellVelocity...
                +1 %�±�Ե
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate2+freqdate3+freqdate4)*...
                (numTrainingCellRange+numTrainingCellVelocity*2); %��ߡ��ϱߡ��ұ�
        else %���½�
            SNR(ii,jj)= freqdate(ii,jj)/(freqdate3+freqdate4)*...
                (numTrainingCellRange+numTrainingCellVelocity); %��ߡ��ϱ�
        end
    end
end
for ii=1:numRange
    for jj=1:numVelocity
        if (freqdate(ii,jj)>powerThreshold) &&( SNR(ii,jj)>snrThreshold) %�ź�ǿ�ȼ�����Ⱦ���������ΪĿ��
            m = m+1;
            Framedata(m).r = ii;
            Framedata(m).v = jj;
            Framedata(m).snr = SNR(ii,jj);
        end
    end
end
end
