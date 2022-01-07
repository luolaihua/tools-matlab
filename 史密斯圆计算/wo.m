%--------------------------------------------------------------------------
% 1.必须首先单击坐标轴上方的“阻抗圆图/导纳圆图”切换按钮，选择要显示的圆图类别。（因为计算时会用到这个变量，如果没有这个值程序运行会出错）
% 2.在相应模块输入或选择数据或选择，再点击相应模块的按钮。要求可编辑文本框中输入的数据是数字即可，另外由于归一化的操作比较简单，所以本程序不含归一化操作步骤，默认输入的阻抗值都是归一化后的。
% 3.输入结果说明：程序中的有关长度（如输入端距负载的距离d,支节长度l不是绝对的而是以λ为单位，即真正的结果是显示的计算结果×λ。
% 4.由于本程序设计的不完善，特别是对鼠标点击的响应、程序的控制还不够健壮，所以在使用过程中如果不按照以下说明使用则会出错。
% （1）在一个计算进行过程中不能点击坐标轴上的“阻抗圆图/导纳圆图”切换按钮，否则虽然计算结果是正确的但是动态演示的绘图已经出错。同样在一个计算进行过程中不能更改输入数据，否则，不仅动态演示的绘图会出错，计算结果也会出错。
% （2）在一个计算过程进行过程中不能关闭此图形窗口，否则会报错。
%--------------------------------------------------------------------------
function varargout = wo(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wo_OpeningFcn, ...
                   'gui_OutputFcn',  @wo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function wo_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
global choose %用于标记选择显示的是阻抗圆图和导纳圆图的全局变量
guidata(hObject, handles);

function choose_Callback(hObject, eventdata, handles)
global choose
if get(hObject,'value')
    choose=-1;
    set(handles.choose,'string','导纳圆图');
else
    choose=1;
    set(handles.choose,'string','阻抗圆图');
end
%%-------------------------------------------------------------------画圆
function circle_plot(x,y,r,color,width,style)
global choose
if nargin < 6
    style = '-';
    if nargin < 5
        width = 1;
    end
end
t=0:0.01:2*pi;
x0=choose*(x+r*cos(t));
y0=choose*(y+r*sin(t));
switch(color)
    case 'm'
        h=plot(x0,y0,'color','m','linewidth',width,'linestyle',style);
    case 'y'
        h=plot(x0,y0,'color','y','linewidth',width,'linestyle',style);
    case 'b'
        h=plot(x0,y0,'color','b','linewidth',width,'linestyle',style);
    case 'k'
        h=plot(x0,y0,'color','k','linewidth',width,'linestyle',style);
    case 'c'
        h=plot(x0,y0,'color','c','linewidth',width,'linestyle',style);
    case 'g'
        h=plot(x0,y0,'color','g','linewidth',width,'linestyle',style);
    case 'r'
        h=plot(x0,y0,'color','r','linewidth',width,'linestyle',style);
end
%%-------------------------------------------------------------------画直线
function line_plot(x1,y1,x2,y2,color)
global choose 
x=choose*[x1 x2];
y=choose*[y1 y2];
switch(color)
    case 'm'
        plot(x,y,'color','m');
    case 'y'
        plot(x,y,'color','y');
    case 'b'
        plot(x,y,'color','b');
    case 'k'
        plot(x,y,'color','k');
    case 'c'
        plot(x,y,'color','c');
    case 'g'
        plot(x,y,'color','g');
end
%%-------------------------------------------------------------------画弧线
function arc_plot(x,y,r,fy0,fy1)
global choose
t=fy0:0.01:fy1;
x0=choose.*(x+r*cos(t));
y0=choose.*(y+r*sin(t));
plot(x0,y0,'color','g','linewidth',3);
%%---------------------------------------------------------------------标注
function text_tag(x,y,string)
global choose 
x=choose*x;
y=choose*y;
text(x,y,string);

function varargout = wo_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function in1_r_Callback(hObject, eventdata, handles)
global in1_r
in1_r=str2double(get(handles.in1_r,'string'));

function in1_r_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in1_i_Callback(hObject, eventdata, handles)
global in1_i
in1_i=str2double(get(handles.in1_i,'string'));

function in1_i_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in3_r_Callback(hObject, eventdata, handles)
global in3_r
in3_r=str2double(get(handles.in3_r,'string'));

function in3_r_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in3_i_Callback(hObject, eventdata, handles)
global in3_i
in3_i=str2double(get(handles.in3_i,'string'));

function in3_i_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in2_r_Callback(hObject, eventdata, handles)
global in2_r
in2_r=str2double(get(handles.in2_r,'string'));

function in2_r_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in2_i_Callback(hObject, eventdata, handles)
global in2_i
in2_i=str2double(get(handles.in2_i,'string'));

function in2_i_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in2_l_Callback(hObject, eventdata, handles)
global in2_l
in2_l=str2double(get(handles.in2_l,'string'));

function in2_l_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in4_r_Callback(hObject, eventdata, handles)
global in4_r
in4_r=str2double(get(handles.in4_r,'string'));

function in4_r_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in4_i_Callback(hObject, eventdata, handles)
global in4_i
in4_i=str2double(get(handles.in4_i,'string'));

function in4_i_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in4_d2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in4_d1_Callback(hObject, eventdata, handles)
global in4_d1
in4_d1=str2double(get(handles.in4_d1,'string'));

function in4_d1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function area_CreateFcn(hObject, eventdata, handles)
circle_plot(0,0,1,'k',1,'--');
axis equal;

function in4_d2_Callback(hObject, eventdata, handles)
global in4_d2
switch get(handles.in4_d2,'value')
    case 1
        in4_d2=1/8;
    case 2
        in4_d2=1/4;
    case 3
        in4_d2=3/8;
end
function in4_d2_ButtonDownFcn(hObject, eventdata, handles)

function result1_zhu_CreateFcn(hObject, eventdata, handles)

function result1_mo_CreateFcn(hObject, eventdata, handles)

%%-----------------------------------------------计算驻波比、反射系数模和幅角
function hint1_Callback(hObject, eventdata, handles)
global in1_r in1_i 
%if ~isnan(in1_r) && ~isnan(in1_i)%判断输入是否是数值，是否int1_r和int1_i都在[0,1]上
    zl=in1_r+i*in1_i;
    gammal=(zl-1)/(zl+1);%计算反射系数
    tmp=abs(gammal);%计算反射系数模值
    zhu=(1+tmp)/(1-tmp);%计算驻波比
    tmp3=angle(gammal);%计算反射系数幅角
    cla%绘图
    hold on;
    set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
    set(gcf,'currentaxes',handles.area);
    circle_plot(0,0,1,'k',1,'--');%单位圆
    pause(2);
    circle_plot(in1_r/(1+in1_r),0,1/(1+in1_r),'m',1);%画zl处的电阻圆
    pause(1);
    circle_plot(1,1/(in1_i),1/(in1_i),'y',1);%画zl处的电抗圆
    pause(2);
    circle_plot(0,0,tmp,'b',2);%画gamma圆  
    pause(1);
    line_plot(0,0,real(gammal),imag(gammal),'k');%画直线（0,0）——zl
    text_tag(1.1*real(gammal),1.1*imag(gammal),'zl');%添加文本'zl'
    pause(2);
    circle_plot(zhu/(1+zhu),0,1/(1+zhu),'m',1);%画阻抗为驻波比的圆  
    text_tag(1.2*(zhu-1)/(1+zhu),0,'r=ρ');%添加文本'r=ρ'
    set(handles.result1_zhu,'string',num2str(zhu));%将结果输出到result1_zhu的文本框
    set(handles.result1_mo,'string',num2str(tmp));%将结果输出到result1_mo的文本框
    set(handles.result1_fu,'string',num2str(tmp3));%将结果输出到result1_fu的文本框

%%---------------------------------------------------------计算传输线输入阻抗
function hint2_Callback(hObject, eventdata, handles)
global in2_r in2_i in2_l
%if ~isnan(in2_r) && ~isnan(in2_i) && ~isnan(in2_l)%判断输入是否是数值，是否int2_r和int2_i都在[0,1]上
    zl=in2_r+in2_i*i;%取出负载阻抗值
   gammal=(zl-1)/(zl+1);
    tmp=abs(gammal);%|zl|
    zin=(zl+i*tan(2*pi*in2_l))/(1+i*zl*tan(2*pi*in2_l));%计算输入阻抗
    r=real(zin);%输入阻抗的电阻
    im=imag(zin);%输入阻抗的电抗
    gammain=(zin-1)/(zin+1);%反射系数
    cla%绘图
    hold on;
    set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
    set(gcf,'currentaxes',handles.area);
    circle_plot(0,0,1,'k',1,'--');%单位圆
    pause(2);
    circle_plot(in2_r/(1+in2_r),0,1/(1+in2_r),'m',1);%画负载处的电导圆
    pause(1);
    circle_plot(1,1/(in2_i),1/in2_i,'y',1);%画负载处的电抗圆
    pause(2);
    circle_plot(0,0,tmp,'b',2);%画gamma圆
    pause(1);
    line_plot(0,0,real(gammal),imag(gammal),'k');%画直线（0,0）——zl
    text_tag(1.1*real(gammal),1.1*imag(gammal),'zl');%标注’zl'
    pause(2);
    fyl=angle(gammal);
    fyin=angle(gammain);
    if fyin>fyl
        fyin=fyin-2*pi;
    end
    arc_plot(0,0,tmp,fyin,fyl);%画gamma圆上从源到负载
    pause(1);
    line_plot(0,0,real(gammain),imag(gammain),'k');%画直线（0,0）——zin
    text_tag(1.1*real(gammain),1.1*imag(gammain),'zin');%标注‘zin'
    pause(2);
    circle_plot(r/(1+r),0,1/(1+r),'m',1);%画输入阻抗处的电导圆
    pause(1);
    circle_plot(1,1/im,1/im,'y',1);%画输入阻抗处的电抗圆
    set(handles.result2_zin,'string',num2str(zin));%将结果输出到result2_zin的文本框







% --- Executes during object creation, after setting all properties.
function hint2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function hint3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





















%%----------------------------------------------------------------单支节匹配
function hint3_Callback(hObject, eventdata, handles)
% hObject    handle to hint3 (see GCBO)
global in3_r in3_i
%if ~isnan(in3_r) && ~isnan(in3_i) %判断输入是否是数值，是否int3_r和int3_i都在[0,1]上
    zl=in3_r+i*in3_i;
    yl=1/zl;
    g=real(yl);
    b=imag(yl);
    gammazl=(zl-1)/(zl+1);%计算反射系数
    gammayl=-gammazl;
    tmp=abs(gammayl);%计算反射系数模值
    zhu=(1+tmp)/(1-tmp);%计算驻波比
    d01=atan(1/sqrt(zhu))/(2*pi);%从输入导纳为tmp1(驻波比的负载到支节处的距离
    l1=atan(sqrt(zhu)/(1-zhu))/(2*pi);
    d02=atan(-1/sqrt(zhu))/(2*pi);
    l2=atan(sqrt(zhu)/(zhu-1))/(2*pi);
    lmin=atan(b/(zhu*g-1))/(2*pi);%计算负载到输入导纳为tmp1(驻波比）的距离
    d1=d01+lmin;
     if d1<0
         d1=d1+0.5;
     end
    d2=d02+lmin;
     if d2<0
         d2=d2+0.5;
     end
     if d1<d2
         d=d1;l=l1;b_=(1-zhu)/sqrt(zhu);
     else
         d=d2;l=l2;b_=(zhu-1)/sqrt(zhu);
     end    
    cla%绘图
    hold on;
    set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
    set(gcf,'currentaxes',handles.area);
    circle_plot(0,0,1,'k',1,'--');%单位圆
    circle_plot(0.5,0,0.5,'k',1,'--');%匹配圆
    pause(2);
    circle_plot(in3_r/(1+in3_r),0,1/(1+in3_r),'m');%负载处电阻圆
    pause(1);
    circle_plot(1,1/in3_i,1/in3_i,'y');%负载处电抗圆
    pause(2);
    circle_plot(0,0,tmp,'b',2);%gamma圆
    pause(1);
    line_plot(real(gammazl),imag(gammazl),real(gammayl),imag(gammayl),'c');%直线从zl--yl
    pause(1);
    text_tag(1.2*real(gammayl),1.2*imag(gammayl),'yl');%标注'yl'
    pause(2);
    fyl=angle(gammayl);
    fyin=fyl-d*4*pi;
    arc_plot(0,0,tmp,fyin,fyl);%圆弧从yl到与匹配圆交点
    pause(1);
    text_tag(1.2*tmp*cos(fyin),1.2*tmp*sin(fyin),'yin_');%标注'yin_'
    pause(2);
    circle_plot(1,1/b_,1/b_,'y');%y_处的电抗圆
    pause(2);
    circle_plot(1,1/-b_,1/-b_,'y');%支节在输入处的的电抗圆
    pause(2);
    fyin=-l*4*pi;
    arc_plot(0,0,1,fyin,0);%圆弧，支节在单位圆上从短路点到输入处
    pause(1);
    text_tag(0.9*cos(fyin),0.9*sin(fyin),'支节b');%标注'支节b'
    set(handles.result3_d,'string',num2str(d));
    set(handles.result3_l,'string',num2str(l));

%%----------------------------------------------------------------双支节匹配
function hint4_Callback(hObject, eventdata, handles)
global in4_r in4_i in4_d1 in4_d2
%if ~isnan(in4_r) && ~isnan(in4_i) && ~isnan(in4_d1)%判断输入是否是数值，是否int2_r和int2_i都在[0,1]上
    tmp_d2=tan(2*pi*in4_d2)%将d2转化成tan值
    zl=in4_r+in4_i*i;%负载阻抗
    yl=1/zl;%负载导纳
    y1_=(yl+i*tan(2*pi*in4_d1))/(1+i*yl*tan(2*pi*in4_d1));%y1_导纳值
    gammay1_=(y1_-1)/(y1_+1);%y1_反射系数
    gammazl=(zl-1)/(zl+1);%zl反射系数
    gammayl=-gammazl;%yl反射系数
    g1_=real(y1_);
    b1_=imag(y1_);
    if (g1_>=0) && (g1_<=(1+tmp_d2^2)/tmp_d2^2)%如果能够匹配
        tmp=sqrt(g1_*(1+tmp_d2^2)-g1_^2*tmp_d2^2);
        b1=-b1_+(1+tmp)/tmp_d2;%b1的第一种情况
        if b1<0
            b1=b1+0.5;
        end
        y1=y1_+i*b1;%y1
        gammay1=(y1-1)/(y1+1);%y1反射系数
        cla%绘图
        hold on;
        set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
        set(gcf,'currentaxes',handles.area);
        circle_plot(0,0,1,'k',1,'--');
        circle_plot(0.5,0,0.5,'k',1,'--');
        switch(in4_d2)
            case 1/8
                circle_plot(0,0.5,0.5,'r',1,'--');
            case 1/4
                circle_plot(-0.5,0,0.5,'r',1,'--');
            case 3/8
                circle_plot(0,-0.5,0.5,'r',1,'--');
        end
        pause(2);
        circle_plot(in4_r/(1+in4_r),0,1/(1+in4_r),'m');%负载处电导圆
        pause(1);
        circle_plot(1,1/in4_i,1/in4_i,'y');%负载处电纳圆
        pause(2);
        circle_plot(0,0,abs(gammayl),'b',2);%gamma圆
        pause(1);
        line_plot(real(gammazl),imag(gammazl),real(gammayl),imag(gammayl),'c');%直线从zl--yl
        text_tag(1.1*real(gammayl),1.1*imag(gammayl),'yl');%标注'yl'
        pause(2);
        fyl=angle(gammayl)
        fyin=angle(gammay1_)
        if fyl<fyin
            fyin=fyin-2*pi;
        end
        arc_plot(0,0,abs(gammayl),fyin,fyl);%圆弧从yl到y1_
        pause(1);
        text_tag(1.1*real(gammay1_),1.1*imag(gammay1_),'y1_');%标注'y1_'
        pause(2);
        circle_plot(g1_/(1+g1_),0,1/(1+g1_),'m');%第一个支节处y1_电导圆
        pause(3);
        fyl=angle(gammay1_-g1_/(1+g1_));
        fyin=angle(gammay1-g1_/(1+g1_));
        if fyl<fyin
            fyin=fyin-2*pi;
        end
        arc_plot(g1_/(1+g1_),0,1/(1+g1_),fyin,fyl);%圆弧，从y1_到y1
        pause(1);
        text_tag(1.1*real(gammay1),1.1*imag(gammay1),'y1');%标注'y1'
        pause(3);
        circle_plot(0,0,abs(gammay1),'b',2);%y1（y2_)gamma圆
        pause(3);
        fyl=angle(gammay1);
        fyin=fyl-in4_d2*4*pi;
        arc_plot(0,0,abs(gammay1),fyin,fyl);%圆弧，从y1到y2_
        y2_=(y1+i*tan(2*pi*in4_d2))/(1+i*y1*tan(2*pi*in4_d2));%y2_导纳值
        gammay2_=(y2_-1)/(y2_+1);
        b2=-imag(y2_);
        pause(1);
        text_tag(1.1*real(gammay2_),1.1*imag(gammay2_),'y2_');%标注'y2_'
        pause(2);
        circle_plot(1,-1/b2,1/b2,'y');%y2_处电纳圆
        pause(2)
        circle_plot(1,1/b2,1/b2,'y');%第二个支节输入处电纳圆
        l1=atan(-1/b1)/(2*pi);
        if l1<0
            l1=l1+0.5;
        end
        l2=atan(-1/b2)/(2*pi);
        if l2<0
            l2=l2+0.5;
        end
        fyin=-l2*4*pi;
        pause(2);
        arc_plot(0,0,1,fyin,0);%圆弧，从y1到y2_
        pause(1);
        text_tag(0.9*cos(fyin),0.9*sin(fyin),'支节b2');%标注'支节b2'      
        set(handles.result4_l1,'string',num2str(l1));
        set(handles.result4_l2,'string',num2str(l2));      
    else
        set(handles.result4_l1,'string','匹配盲区');
        set(handles.result4_l2,'string','匹配盲区');
    end
