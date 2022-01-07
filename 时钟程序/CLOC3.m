% function clock2
% clf;shg;
h=figure('menubar','none',...
    'color','white',...
    'position',[200 200 320 360],...
    'name','CLOCK');
e1=uicontrol('parent',h,...                %定义一个edit控件，用于存储日期   
    'style','edit',...                              %该控件的类型为edit，可以编辑其内容
    'fontsize',12,...                             %字体大小为12
    'position',[110 20 120 30]);         %位置,距离左边110，距离底边20，宽度为120，高度为30
b1=uicontrol('parent',h,...                %定义一个text控件，显示刻度“12”
    'style','text',...
    'string','12',...
    'fontsize',12,...
    'position',[156 275 20 20]);
b2=uicontrol('parent',h,...                %定义一个text控件，显示刻度“9”
    'style','text',...
    'string','9',...
    'fontsize',12,...
    'position',[60 175 20 20]);
b3=uicontrol('parent',h,...                %定义一个text控件，显示刻度“6” 
    'style','text',...
    'string','6',...
    'fontsize',12,...
    'position',[156 75 20 20]);
b4=uicontrol('parent',h,...                %定义一个text控件，显示刻度“3”
    'style','text',...
    'string','3',...
    'fontsize',12,...
    'position',[260 175 20 20]);
s1=[0:pi/1000:2*pi];
hl=plot(cos(s1),sin(s1),'b-');             %绘制表盘的外圆
time=datestr(now);                           %得到当前时间
set(e1,'string',time(1:11));                %当前时间的1：11位是日期，把日期值给el
sita1=pi/2-str2num(time(19:20))*pi/30;                          %秒针转过的角度
sita2=pi/2-str2num(time(16:17))*pi/30+sita1/60;            %分针转过的角度
sita3=pi/2-str2num(time(13:14))*pi/6+sita2/12;              %时针转过的角度
w1=-pi/30;                                                     %设置秒针每秒转过的角度，分针走一个半圆需要30s
w2=-pi/1800;                                                 %设置分针每秒转过的角度
w3=-pi/108000;                                             %设置时针每秒转过的角度
pausetime=1;
axis off;axis equal
hold on
plot(0,0,'or');
%设置刻度
for n=pi*2:-pi/30:pi/30                                   %绘制表盘，绘制分钟的刻度
    a1=0.95*cos(n):0.05*cos(n)/2:cos(n);b1=0.95*sin(n):0.05*sin(n)/2:sin(n);
    plot(a1,b1,'r-');
end
for n=pi*2:-pi/6:pi/30                                    %绘制表盘，绘制小时的刻度
    a1=0.9*cos(n):0.1*cos(n)/2:cos(n);b1=0.9*sin(n):0.1*sin(n)/2:sin(n);
    plot(a1,b1,'r-');
end
%时钟指针
while 1
    x1=0:0.75*cos(sita1)/2:0.75*cos(sita1);y1=0:0.75*sin(sita1)/2:0.75*sin(sita1);    %根据秒针的位置绘制分针
    x2=0:0.6*cos(sita2)/2:0.6*cos(sita2);y2=0:0.6*sin(sita2)/2:0.6*sin(sita2);            %根据分针的位置绘制分针  
    x3=0:0.45*cos(sita3)/2:0.45*cos(sita3);y3=0:0.45*sin(sita3)/2:0.45*sin(sita3);    %根据时针的位置绘制分针
    hp1=plot(x1,y1,'b-');
    hp2=plot(x2,y2,'b-','linewidth',2);
    hp3=plot(x3,y3,'g-','linewidth',2);
    sita1=sita1+w1*pausetime;           %计算一秒以后秒针的角度位置
    sita2=sita2+w2*pausetime;           %计算一秒以后分针的角度位置
    sita3=sita3+w3*pausetime;           %计算一秒以后时针的角度位置
    pause(pausetime);
    delete(hp1);
    delete(hp2);
    delete(hp3);
end
hold off
