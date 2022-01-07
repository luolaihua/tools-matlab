% function clock2
% clf;shg;
h=figure('menubar','none',...
    'color','white',...
    'position',[200 200 320 360],...
    'name','CLOCK');
e1=uicontrol('parent',h,...                %����һ��edit�ؼ������ڴ洢����   
    'style','edit',...                              %�ÿؼ�������Ϊedit�����Ա༭������
    'fontsize',12,...                             %�����СΪ12
    'position',[110 20 120 30]);         %λ��,�������110������ױ�20�����Ϊ120���߶�Ϊ30
b1=uicontrol('parent',h,...                %����һ��text�ؼ�����ʾ�̶ȡ�12��
    'style','text',...
    'string','12',...
    'fontsize',12,...
    'position',[156 275 20 20]);
b2=uicontrol('parent',h,...                %����һ��text�ؼ�����ʾ�̶ȡ�9��
    'style','text',...
    'string','9',...
    'fontsize',12,...
    'position',[60 175 20 20]);
b3=uicontrol('parent',h,...                %����һ��text�ؼ�����ʾ�̶ȡ�6�� 
    'style','text',...
    'string','6',...
    'fontsize',12,...
    'position',[156 75 20 20]);
b4=uicontrol('parent',h,...                %����һ��text�ؼ�����ʾ�̶ȡ�3��
    'style','text',...
    'string','3',...
    'fontsize',12,...
    'position',[260 175 20 20]);
s1=[0:pi/1000:2*pi];
hl=plot(cos(s1),sin(s1),'b-');             %���Ʊ��̵���Բ
time=datestr(now);                           %�õ���ǰʱ��
set(e1,'string',time(1:11));                %��ǰʱ���1��11λ�����ڣ�������ֵ��el
sita1=pi/2-str2num(time(19:20))*pi/30;                          %����ת���ĽǶ�
sita2=pi/2-str2num(time(16:17))*pi/30+sita1/60;            %����ת���ĽǶ�
sita3=pi/2-str2num(time(13:14))*pi/6+sita2/12;              %ʱ��ת���ĽǶ�
w1=-pi/30;                                                     %��������ÿ��ת���ĽǶȣ�������һ����Բ��Ҫ30s
w2=-pi/1800;                                                 %���÷���ÿ��ת���ĽǶ�
w3=-pi/108000;                                             %����ʱ��ÿ��ת���ĽǶ�
pausetime=1;
axis off;axis equal
hold on
plot(0,0,'or');
%���ÿ̶�
for n=pi*2:-pi/30:pi/30                                   %���Ʊ��̣����Ʒ��ӵĿ̶�
    a1=0.95*cos(n):0.05*cos(n)/2:cos(n);b1=0.95*sin(n):0.05*sin(n)/2:sin(n);
    plot(a1,b1,'r-');
end
for n=pi*2:-pi/6:pi/30                                    %���Ʊ��̣�����Сʱ�Ŀ̶�
    a1=0.9*cos(n):0.1*cos(n)/2:cos(n);b1=0.9*sin(n):0.1*sin(n)/2:sin(n);
    plot(a1,b1,'r-');
end
%ʱ��ָ��
while 1
    x1=0:0.75*cos(sita1)/2:0.75*cos(sita1);y1=0:0.75*sin(sita1)/2:0.75*sin(sita1);    %���������λ�û��Ʒ���
    x2=0:0.6*cos(sita2)/2:0.6*cos(sita2);y2=0:0.6*sin(sita2)/2:0.6*sin(sita2);            %���ݷ����λ�û��Ʒ���  
    x3=0:0.45*cos(sita3)/2:0.45*cos(sita3);y3=0:0.45*sin(sita3)/2:0.45*sin(sita3);    %����ʱ���λ�û��Ʒ���
    hp1=plot(x1,y1,'b-');
    hp2=plot(x2,y2,'b-','linewidth',2);
    hp3=plot(x3,y3,'g-','linewidth',2);
    sita1=sita1+w1*pausetime;           %����һ���Ժ�����ĽǶ�λ��
    sita2=sita2+w2*pausetime;           %����һ���Ժ����ĽǶ�λ��
    sita3=sita3+w3*pausetime;           %����һ���Ժ�ʱ��ĽǶ�λ��
    pause(pausetime);
    delete(hp1);
    delete(hp2);
    delete(hp3);
end
hold off
