%--------------------------------------------------------------------------
% 1.�������ȵ����������Ϸ��ġ��迹Բͼ/����Բͼ���л���ť��ѡ��Ҫ��ʾ��Բͼ��𡣣���Ϊ����ʱ���õ�������������û�����ֵ�������л����
% 2.����Ӧģ�������ѡ�����ݻ�ѡ���ٵ����Ӧģ��İ�ť��Ҫ��ɱ༭�ı�������������������ּ��ɣ��������ڹ�һ���Ĳ����Ƚϼ򵥣����Ա����򲻺���һ���������裬Ĭ��������迹ֵ���ǹ�һ����ġ�
% 3.������˵���������е��йس��ȣ�������˾ฺ�صľ���d,֧�ڳ���l���Ǿ��ԵĶ����Ԧ�Ϊ��λ���������Ľ������ʾ�ļ��������ˡ�
% 4.���ڱ�������ƵĲ����ƣ��ر��Ƕ����������Ӧ������Ŀ��ƻ�������׳��������ʹ�ù������������������˵��ʹ��������
% ��1����һ��������й����в��ܵ���������ϵġ��迹Բͼ/����Բͼ���л���ť��������Ȼ����������ȷ�ĵ��Ƕ�̬��ʾ�Ļ�ͼ�Ѿ�����ͬ����һ��������й����в��ܸ����������ݣ����򣬲�����̬��ʾ�Ļ�ͼ�����������Ҳ�����
% ��2����һ��������̽��й����в��ܹرմ�ͼ�δ��ڣ�����ᱨ��
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
global choose %���ڱ��ѡ����ʾ�����迹Բͼ�͵���Բͼ��ȫ�ֱ���
guidata(hObject, handles);

function choose_Callback(hObject, eventdata, handles)
global choose
if get(hObject,'value')
    choose=-1;
    set(handles.choose,'string','����Բͼ');
else
    choose=1;
    set(handles.choose,'string','�迹Բͼ');
end
%%-------------------------------------------------------------------��Բ
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
%%-------------------------------------------------------------------��ֱ��
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
%%-------------------------------------------------------------------������
function arc_plot(x,y,r,fy0,fy1)
global choose
t=fy0:0.01:fy1;
x0=choose.*(x+r*cos(t));
y0=choose.*(y+r*sin(t));
plot(x0,y0,'color','g','linewidth',3);
%%---------------------------------------------------------------------��ע
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

%%-----------------------------------------------����פ���ȡ�����ϵ��ģ�ͷ���
function hint1_Callback(hObject, eventdata, handles)
global in1_r in1_i 
%if ~isnan(in1_r) && ~isnan(in1_i)%�ж������Ƿ�����ֵ���Ƿ�int1_r��int1_i����[0,1]��
    zl=in1_r+i*in1_i;
    gammal=(zl-1)/(zl+1);%���㷴��ϵ��
    tmp=abs(gammal);%���㷴��ϵ��ģֵ
    zhu=(1+tmp)/(1-tmp);%����פ����
    tmp3=angle(gammal);%���㷴��ϵ������
    cla%��ͼ
    hold on;
    set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
    set(gcf,'currentaxes',handles.area);
    circle_plot(0,0,1,'k',1,'--');%��λԲ
    pause(2);
    circle_plot(in1_r/(1+in1_r),0,1/(1+in1_r),'m',1);%��zl���ĵ���Բ
    pause(1);
    circle_plot(1,1/(in1_i),1/(in1_i),'y',1);%��zl���ĵ翹Բ
    pause(2);
    circle_plot(0,0,tmp,'b',2);%��gammaԲ  
    pause(1);
    line_plot(0,0,real(gammal),imag(gammal),'k');%��ֱ�ߣ�0,0������zl
    text_tag(1.1*real(gammal),1.1*imag(gammal),'zl');%����ı�'zl'
    pause(2);
    circle_plot(zhu/(1+zhu),0,1/(1+zhu),'m',1);%���迹Ϊפ���ȵ�Բ  
    text_tag(1.2*(zhu-1)/(1+zhu),0,'r=��');%����ı�'r=��'
    set(handles.result1_zhu,'string',num2str(zhu));%����������result1_zhu���ı���
    set(handles.result1_mo,'string',num2str(tmp));%����������result1_mo���ı���
    set(handles.result1_fu,'string',num2str(tmp3));%����������result1_fu���ı���

%%---------------------------------------------------------���㴫���������迹
function hint2_Callback(hObject, eventdata, handles)
global in2_r in2_i in2_l
%if ~isnan(in2_r) && ~isnan(in2_i) && ~isnan(in2_l)%�ж������Ƿ�����ֵ���Ƿ�int2_r��int2_i����[0,1]��
    zl=in2_r+in2_i*i;%ȡ�������迹ֵ
   gammal=(zl-1)/(zl+1);
    tmp=abs(gammal);%|zl|
    zin=(zl+i*tan(2*pi*in2_l))/(1+i*zl*tan(2*pi*in2_l));%���������迹
    r=real(zin);%�����迹�ĵ���
    im=imag(zin);%�����迹�ĵ翹
    gammain=(zin-1)/(zin+1);%����ϵ��
    cla%��ͼ
    hold on;
    set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
    set(gcf,'currentaxes',handles.area);
    circle_plot(0,0,1,'k',1,'--');%��λԲ
    pause(2);
    circle_plot(in2_r/(1+in2_r),0,1/(1+in2_r),'m',1);%�����ش��ĵ絼Բ
    pause(1);
    circle_plot(1,1/(in2_i),1/in2_i,'y',1);%�����ش��ĵ翹Բ
    pause(2);
    circle_plot(0,0,tmp,'b',2);%��gammaԲ
    pause(1);
    line_plot(0,0,real(gammal),imag(gammal),'k');%��ֱ�ߣ�0,0������zl
    text_tag(1.1*real(gammal),1.1*imag(gammal),'zl');%��ע��zl'
    pause(2);
    fyl=angle(gammal);
    fyin=angle(gammain);
    if fyin>fyl
        fyin=fyin-2*pi;
    end
    arc_plot(0,0,tmp,fyin,fyl);%��gammaԲ�ϴ�Դ������
    pause(1);
    line_plot(0,0,real(gammain),imag(gammain),'k');%��ֱ�ߣ�0,0������zin
    text_tag(1.1*real(gammain),1.1*imag(gammain),'zin');%��ע��zin'
    pause(2);
    circle_plot(r/(1+r),0,1/(1+r),'m',1);%�������迹���ĵ絼Բ
    pause(1);
    circle_plot(1,1/im,1/im,'y',1);%�������迹���ĵ翹Բ
    set(handles.result2_zin,'string',num2str(zin));%����������result2_zin���ı���







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





















%%----------------------------------------------------------------��֧��ƥ��
function hint3_Callback(hObject, eventdata, handles)
% hObject    handle to hint3 (see GCBO)
global in3_r in3_i
%if ~isnan(in3_r) && ~isnan(in3_i) %�ж������Ƿ�����ֵ���Ƿ�int3_r��int3_i����[0,1]��
    zl=in3_r+i*in3_i;
    yl=1/zl;
    g=real(yl);
    b=imag(yl);
    gammazl=(zl-1)/(zl+1);%���㷴��ϵ��
    gammayl=-gammazl;
    tmp=abs(gammayl);%���㷴��ϵ��ģֵ
    zhu=(1+tmp)/(1-tmp);%����פ����
    d01=atan(1/sqrt(zhu))/(2*pi);%�����뵼��Ϊtmp1(פ���ȵĸ��ص�֧�ڴ��ľ���
    l1=atan(sqrt(zhu)/(1-zhu))/(2*pi);
    d02=atan(-1/sqrt(zhu))/(2*pi);
    l2=atan(sqrt(zhu)/(zhu-1))/(2*pi);
    lmin=atan(b/(zhu*g-1))/(2*pi);%���㸺�ص����뵼��Ϊtmp1(פ���ȣ��ľ���
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
    cla%��ͼ
    hold on;
    set(handles.area,'xlim',[-1 1],'ylim',[-1 1]);
    set(gcf,'currentaxes',handles.area);
    circle_plot(0,0,1,'k',1,'--');%��λԲ
    circle_plot(0.5,0,0.5,'k',1,'--');%ƥ��Բ
    pause(2);
    circle_plot(in3_r/(1+in3_r),0,1/(1+in3_r),'m');%���ش�����Բ
    pause(1);
    circle_plot(1,1/in3_i,1/in3_i,'y');%���ش��翹Բ
    pause(2);
    circle_plot(0,0,tmp,'b',2);%gammaԲ
    pause(1);
    line_plot(real(gammazl),imag(gammazl),real(gammayl),imag(gammayl),'c');%ֱ�ߴ�zl--yl
    pause(1);
    text_tag(1.2*real(gammayl),1.2*imag(gammayl),'yl');%��ע'yl'
    pause(2);
    fyl=angle(gammayl);
    fyin=fyl-d*4*pi;
    arc_plot(0,0,tmp,fyin,fyl);%Բ����yl����ƥ��Բ����
    pause(1);
    text_tag(1.2*tmp*cos(fyin),1.2*tmp*sin(fyin),'yin_');%��ע'yin_'
    pause(2);
    circle_plot(1,1/b_,1/b_,'y');%y_���ĵ翹Բ
    pause(2);
    circle_plot(1,1/-b_,1/-b_,'y');%֧�������봦�ĵĵ翹Բ
    pause(2);
    fyin=-l*4*pi;
    arc_plot(0,0,1,fyin,0);%Բ����֧���ڵ�λԲ�ϴӶ�·�㵽���봦
    pause(1);
    text_tag(0.9*cos(fyin),0.9*sin(fyin),'֧��b');%��ע'֧��b'
    set(handles.result3_d,'string',num2str(d));
    set(handles.result3_l,'string',num2str(l));

%%----------------------------------------------------------------˫֧��ƥ��
function hint4_Callback(hObject, eventdata, handles)
global in4_r in4_i in4_d1 in4_d2
%if ~isnan(in4_r) && ~isnan(in4_i) && ~isnan(in4_d1)%�ж������Ƿ�����ֵ���Ƿ�int2_r��int2_i����[0,1]��
    tmp_d2=tan(2*pi*in4_d2)%��d2ת����tanֵ
    zl=in4_r+in4_i*i;%�����迹
    yl=1/zl;%���ص���
    y1_=(yl+i*tan(2*pi*in4_d1))/(1+i*yl*tan(2*pi*in4_d1));%y1_����ֵ
    gammay1_=(y1_-1)/(y1_+1);%y1_����ϵ��
    gammazl=(zl-1)/(zl+1);%zl����ϵ��
    gammayl=-gammazl;%yl����ϵ��
    g1_=real(y1_);
    b1_=imag(y1_);
    if (g1_>=0) && (g1_<=(1+tmp_d2^2)/tmp_d2^2)%����ܹ�ƥ��
        tmp=sqrt(g1_*(1+tmp_d2^2)-g1_^2*tmp_d2^2);
        b1=-b1_+(1+tmp)/tmp_d2;%b1�ĵ�һ�����
        if b1<0
            b1=b1+0.5;
        end
        y1=y1_+i*b1;%y1
        gammay1=(y1-1)/(y1+1);%y1����ϵ��
        cla%��ͼ
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
        circle_plot(in4_r/(1+in4_r),0,1/(1+in4_r),'m');%���ش��絼Բ
        pause(1);
        circle_plot(1,1/in4_i,1/in4_i,'y');%���ش�����Բ
        pause(2);
        circle_plot(0,0,abs(gammayl),'b',2);%gammaԲ
        pause(1);
        line_plot(real(gammazl),imag(gammazl),real(gammayl),imag(gammayl),'c');%ֱ�ߴ�zl--yl
        text_tag(1.1*real(gammayl),1.1*imag(gammayl),'yl');%��ע'yl'
        pause(2);
        fyl=angle(gammayl)
        fyin=angle(gammay1_)
        if fyl<fyin
            fyin=fyin-2*pi;
        end
        arc_plot(0,0,abs(gammayl),fyin,fyl);%Բ����yl��y1_
        pause(1);
        text_tag(1.1*real(gammay1_),1.1*imag(gammay1_),'y1_');%��ע'y1_'
        pause(2);
        circle_plot(g1_/(1+g1_),0,1/(1+g1_),'m');%��һ��֧�ڴ�y1_�絼Բ
        pause(3);
        fyl=angle(gammay1_-g1_/(1+g1_));
        fyin=angle(gammay1-g1_/(1+g1_));
        if fyl<fyin
            fyin=fyin-2*pi;
        end
        arc_plot(g1_/(1+g1_),0,1/(1+g1_),fyin,fyl);%Բ������y1_��y1
        pause(1);
        text_tag(1.1*real(gammay1),1.1*imag(gammay1),'y1');%��ע'y1'
        pause(3);
        circle_plot(0,0,abs(gammay1),'b',2);%y1��y2_)gammaԲ
        pause(3);
        fyl=angle(gammay1);
        fyin=fyl-in4_d2*4*pi;
        arc_plot(0,0,abs(gammay1),fyin,fyl);%Բ������y1��y2_
        y2_=(y1+i*tan(2*pi*in4_d2))/(1+i*y1*tan(2*pi*in4_d2));%y2_����ֵ
        gammay2_=(y2_-1)/(y2_+1);
        b2=-imag(y2_);
        pause(1);
        text_tag(1.1*real(gammay2_),1.1*imag(gammay2_),'y2_');%��ע'y2_'
        pause(2);
        circle_plot(1,-1/b2,1/b2,'y');%y2_������Բ
        pause(2)
        circle_plot(1,1/b2,1/b2,'y');%�ڶ���֧�����봦����Բ
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
        arc_plot(0,0,1,fyin,0);%Բ������y1��y2_
        pause(1);
        text_tag(0.9*cos(fyin),0.9*sin(fyin),'֧��b2');%��ע'֧��b2'      
        set(handles.result4_l1,'string',num2str(l1));
        set(handles.result4_l2,'string',num2str(l2));      
    else
        set(handles.result4_l1,'string','ƥ��ä��');
        set(handles.result4_l2,'string','ƥ��ä��');
    end
