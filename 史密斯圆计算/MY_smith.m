function varargout = MY_smith(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MY_smith_OpeningFcn, ...
                   'gui_OutputFcn',  @MY_smith_OutputFcn, ...
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
% --- Executes just before MY_smith is made visible.
function MY_smith_OpeningFcn(hObject, eventdata, handles, varargin)

axes = handles.SmithChart;
smith_chart(0);

set(handles.SmithChart,'Color','white');
set(handles.SmithChart,'XColor',get(handles.figure1,'color'));
set(handles.SmithChart,'YColor',get(handles.figure1,'color'));
% Choose default command line output for smith1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
 

% --- Outputs from this function are returned to the command line.
function varargout = MY_smith_OutputFcn(hObject, eventdata, handles) 
 
varargout{1} = handles.output;



function edit8_Callback(hObject, eventdata, handles)
 
function edit8_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
 
function edit9_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%==================================================================
function Z_Real_Callback(hObject, eventdata, handles)
function Z_Real_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_Imag_Callback(hObject, eventdata, handles)
global in2_i
in2_i=str2double(get(handles.Z_Imag,'string'));
 
function Z_Imag_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit1_Callback(hObject, eventdata, handles)
handles.Rl=str2double(get(hObject,'String'));
%  isnan(handles.Rl)�ж����ݲ�������
if isnan(handles.Rl)
    errordlg('You must enter a number','Bad Input','modal')
end
guidata(hObject, handles);

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)
handles.Xl=str2double(get(hObject,'string'));
if isnan(handles.Xl)
    errordlg('You must enter a number','Bad Input','modal')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit3_Callback(hObject, eventdata, handles)
handles.Zc=str2double(get(hObject,'string'));
if isnan(handles.Zc)
    errordlg('You must enter a number','Bad Input','modal')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function length_Callback(hObject, eventdata, handles)
global in2_l
in2_l=str2double(get(handles.length,'string'));

function length_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zin_Callback(hObject, eventdata, handles)
function zin_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SmithChart_CreateFcn(hObject, eventdata, handles)
%=============================================================================
%==========================================================================
%==============================================================================
%==============================================================================
%==============================================================================
%=============================================================================
%==========================================================================
%==============================================================================
%==============================================================================
%==============================================================================









%������









%������ť����


%==============================================================================
%==============================================================================
%============================================================================
%���㰴ť�ص�����

% --- Executes on button press in Calculatepl.
function Calculatepl_Callback(hObject, eventdata, handles)
global in2_l;
%��һ��
handles.ZlR=handles.Rl/handles.Zc;
handles.ZlX=handles.Xl/handles.Zc;


%��ʾ
set(handles.Z_Real,'String',handles.ZlR);
set(handles.Z_Imag,'String',handles.ZlX);


%Z1Ϊ��һ���迹
Z_Re = str2num(get(handles.Z_Real, 'String'));
Z_Im = str2num(get(handles.Z_Imag, 'String'));
Z1=complex(Z_Re,Z_Im);


%***************************************************************************
    zl=Z1;
   gammal=(zl-1)/(zl+1);
    tmp=abs(gammal);%|zl|
    zin=(zl+i*tan(2*pi*in2_l))/(1+i*zl*tan(2*pi*in2_l));%���������迹
    r=real(zin);%�����迹�ĵ���
    im=imag(zin);%�����迹�ĵ翹
    gammain=(zin-1)/(zin+1);%����ϵ��
    set(handles.zin,'string',num2str(zin));%����������result2_zin���ı���
%****************************************************************************


Is_Y=0;

%AbsLΪ����ϵ����ֵ, PhΪ��λ
[AbsL, Ph] = ConvertZ2AbsL_Ph(Z_Re, Z_Im);
set(handles.edit9,'String',AbsL);


%pΪפ���ȣ�kΪ�в�ϵ��
P=abs((1+AbsL)/(1-AbsL));
%K=1/P;
set(handles.edit8,'String',P);
DrawZL(handles, Z_Re, Z_Im, AbsL, Ph, Is_Y) 



%�����ť
% --- Executes on button press in clearall.
function clearall_Callback(hObject, eventdata, handles)
% hObject    handle to clearall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
smith_chart(0);
set(handles.Z_Real,'String','');
set(handles.Z_Imag,'String','');
set(handles.edit1,'String','');
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit8,'String','');
set(handles.edit9,'String','');
set(handles.length,'String','');
set(handles.zin,'String','');
clear all;
%==============================================================================
%==============================================================================
%==============================================================================
















%��ͼ����


%==============================================================================
%==============================================================================
%=========================================================================
%����ʷ��˹Բͼ��ʾ�ĺ���
function smith_chart(option)
% Usage: smith(option)
%
% Purpose: creates Smith chart display
%Ŀ�ģ�����ʷ��˹Բͼ��ʾ
% Parameters:
%������
%   
%   option = 0 <-- �����迹Բͼ
%   option = 1 <-- ��������ԭͼ
%   option = 2 <-- �����迹Բͼ�͵���ԭͼ
%   option = 0 <-- Z-Smith Chart is created (black color, solid line)
%   option = 1 <-- Y-Smith Chart is created (black color, solid line)
%   option = 2 <-- ZY-Smith Chart is created (black color,
%                  Z-Chart- solid line, Y-Chart - dashed line)

%XΪ�翹Բ
%RΪ����Բ
% define X and R circles
X=[0.2 0.5 1 2 5];
R=[0.2 0.5 1 2 5];

%�����⻬��Բ
% we want to plot smooth cirlces with 101 points
alpha=2*pi*(0:0.01:1);


%Ĭ�ϻ����迹Բͼ
% if no arguments are not specified we assume Z-chart
if nargin<1
   option=0;
end;

%������ȦȦ
% draw a white circle
chart_color=[0.0 0.0 0.0];
patch(cos(alpha),sin(alpha),'-','edgecolor',chart_color,'facecolor',get(gca,'color'),'HitTest','off');
hold on;
plot([-1 1],[0 0],'color',chart_color,'HitTest','off');



for rr=R
   xc=rr/(1+rr); % x position of the center
   rd=1/(1+rr);  % radius of the circle
   
   % plot circles
   if (option==0 | option==2)
      plot(xc+rd*cos(alpha),rd*sin(alpha),'-','color',chart_color,'HitTest','off');
   end;
   if option==1
      plot(-xc-rd*cos(alpha),rd*sin(alpha),'-','color',chart_color,'HitTest','off');
   end;
   if option==2
      plot(-xc-rd*cos(alpha),rd*sin(alpha),'-','color',chart_color,'HitTest','off');
   end;
end;
   
for xx=X
   xc=1;    % x position of the center
   yc=1/xx; % y position of the center
   rd=1/xx; % radius of the circle
   alpha_xx= 2*atan(xx)*(0:0.01:1);
   if (option==0 | option==2)
      plot(xc-rd*sin(alpha_xx),yc-rd*cos(alpha_xx),'-','color',chart_color,'HitTest','off');
      plot(xc-rd*sin(alpha_xx),-yc+rd*cos(alpha_xx),'-','color',chart_color,'HitTest','off');
   end;
   if (option==1)
      plot(-xc+rd*sin(alpha_xx),yc-rd*cos(alpha_xx),'-','color',chart_color,'HitTest','off');
      plot(-xc+rd*sin(alpha_xx),-yc+rd*cos(alpha_xx),'-','color',chart_color,'HitTest','off');
   end;
   if (option==2)
      plot(-xc+rd*sin(alpha_xx),yc-rd*cos(alpha_xx),':','color',chart_color,'HitTest','off');
      plot(-xc+rd*sin(alpha_xx),-yc+rd*cos(alpha_xx),':','color',chart_color,'HitTest','off');
   end;
end

%annotate smith chart
Z_text_color=[0.5 0 0];
Y_text_color=[0 0 0.5];
if option == 0
   for rr=R
      xc=rr/(1+rr); % x position of the center
      rd=1/(1+rr);    % radius of the circle
      text(xc-rd,0,num2str(rr,'%.1f'), ...
         'horizontalalignment','left','VerticalAlignment','bottom',...
         'color',Z_text_color,'Rotation',90,'HitTest','off');
   end;   
   for xx=X
      alpha_xx= 2*atan(1/xx);
      text(1.1*cos(alpha_xx),1.1*sin(alpha_xx),num2str(xx,'+%.1f'), ...
         'horizontalalignment','center','VerticalAlignment','middle',...
         'color',Z_text_color,'HitTest','off');
      text(1.1*cos(alpha_xx),-1.1*sin(alpha_xx),num2str(xx,'-%.1f'), ...
         'horizontalalignment','center','VerticalAlignment','middle',...
         'color',Z_text_color,'HitTest','off');
   end;  
   text(-1.1,0,'0.0', ...
      'horizontalalignment','center','VerticalAlignment','middle',...
      'color',Z_text_color,'HitTest','off');
   text(1.1,0,'\infty', ...
      'horizontalalignment','center','VerticalAlignment','middle',...
      'color',Z_text_color,'HitTest','off');
end;

if option == 1
   for rr=R
      xc=-rr/(1+rr); % x position of the center
      rd=-1/(1+rr);    % radius of the circle
      text(xc-rd,0,num2str(rr,'%.1f'), ...
         'horizontalalignment','right','VerticalAlignment','top',...
         'color',Y_text_color,'Rotation',90,'HitTest','off');
   end;   
   for xx=X
      alpha_xx= 2*atan(1/xx);
      text(-1.1*cos(alpha_xx),-1.1*sin(alpha_xx),num2str(xx,'+%.1f'), ...
         'horizontalalignment','center','VerticalAlignment','middle',...
         'color',Y_text_color,'HitTest','off');
      text(-1.1*cos(alpha_xx),+1.1*sin(alpha_xx),num2str(xx,'-%.1f'), ...
         'horizontalalignment','center','VerticalAlignment','middle',...
         'color',Y_text_color,'HitTest','off');
   end;  
   text(1.1,0,'0.0', ...
      'horizontalalignment','center','VerticalAlignment','middle',...
      'color',Y_text_color,'HitTest','off');
   text(-1.1,0,'\infty', ...
      'horizontalalignment','center','VerticalAlignment','middle',...
      'color',Y_text_color,'HitTest','off');
end;

hold off;
axis image;

%��ZL�ĺ���
function DrawZL(handles, Z_Re, Z_Im, AbsL, Ph, Is_Y)
cla 
smith_chart(0);
refresh;
hold on;
Draw_Ratio(handles,AbsL, Ph, Is_Y);
pause(0.3);
Draw_Real_Part(handles, Z_Re, AbsL, Ph, Is_Y);    
pause(0.3);
Draw_Imag_Part(handles, Z_Im, AbsL, Ph, Is_Y);
pause(0.2);

%������ѹ����ϵ����Բ-----��ɫ
function Draw_Ratio(handles,AbsL, Ph, Is_Y)
theta = 0:pi/500:2*pi;
x_zIN = AbsL*cos(theta);
y_zIN = AbsL*sin(theta);
if(Is_Y)
    x_zIN= -x_zIN;
    y_zIN = -y_zIN;
end
plot(x_zIN,y_zIN,'b',...
    'LineWidth',3,'MarkerSize',20);

%��������Բ-----��ɫ
function Draw_Real_Part(handles,Z_Re, AbsL,Ph,Is_Y)
theta = 0:pi/500:2*pi;
if(Is_Y)
[Z_Re, Z_Im] = ConvertAbsL_Ph2Z(AbsL, Ph);
Y_Re = real(1 / complex(Z_Re, Z_Im));
Z_Re = Y_Re;
end
C_X = Z_Re/(1 + Z_Re);
r = 1 / (1 + Z_Re);
x_g = r*cos(theta)+C_X;
y_g = r*sin(theta);
plot(x_g, y_g,'g', ...
    'LineWidth',3,'MarkerSize',20);

%�����翹Բ-----��ɫ + ����Z_in---��ɫ
function Draw_Imag_Part(handles,Z_Im, AbsL, Ph, Is_Y)
label = 'Z_{in}';
theta = 0:pi/500:2*pi;
if(Is_Y)
[Z_Re, Z_Im] = ConvertAbsL_Ph2Z(AbsL, Ph);
Y_Im = imag(1 / complex(Z_Re, Z_Im));
Z_Im = Y_Im;
label='Y_{in}';
AbsL = -AbsL;
end
C_X = 1;
C_Y = 1 / Z_Im;
r = 1 / (abs(Z_Im));
x_g = r*cos(theta)+C_X;
y_g = r*sin(theta)+C_Y;
index = find((x_g.^2 + y_g.^2) <= 1);
x = x_g(index);
y = y_g(index); 
plot(x, y,'m', AbsL*cos(Ph),AbsL*sin(Ph),'r.',...
    'LineWidth',3,'MarkerSize',30);
text(AbsL*cos(Ph),AbsL*sin(Ph),label,...
    'FontSize',20,'FontUnits','normalized','Color','r','HorizontalAlignment','right');
%=========================================================================

















%�迹���㲿��

%====================================================================
%====================================================================
%====================================================================
%�����һ���迹�����AbsLΪ����ϵ����ֵ, PhΪ��λ
%ConvertZ2AbsL_Ph(Z_Re, Z_Im)����ϵ����ֵ����λ�ĺ���
function [AbsL, Ph] =  ConvertZ2AbsL_Ph(Z_Re, Z_Im)
Z = complex(Z_Re, Z_Im);
Refl_Coef = (Z - 1) / (Z + 1);
Refl_Coef_Re = real(Refl_Coef);
Refl_Coef_Im = imag(Refl_Coef);
AbsL = sqrt(Refl_Coef_Re^2 + Refl_Coef_Im^2);
Ph_temp = atan(Refl_Coef_Im/Refl_Coef_Re);
%Phase value between -0.5pi to 1.5pi
if (Refl_Coef_Re < 0)
    Ph = Ph_temp + pi;
else
    Ph = Ph_temp;
end

%����AbsLΪ����ϵ����ֵ,PhΪ��λ��  �����һ���迹ʵ�����鲿
function [Z_Re, Z_Im] = ConvertAbsL_Ph2Z(AbsL, Ph)
Refl_Coef_Re = AbsL * cos(Ph);
Refl_Coef_Im = AbsL * sin(Ph); 
Refl_Coef = complex(Refl_Coef_Re, Refl_Coef_Im);
Z = (1 + Refl_Coef) / (1 - Refl_Coef);
Z_Re = real(Z);
Z_Im = imag(Z);


%�迹ת���ɵ��ɺ���
function [Y_Re, Y_Im] = ConvertZ2Y(Z_Re, Z_Im)
%ConvertY2Z can also use this one
if (complex(Z_Re, Z_Im) == 0)
    errordlg('Load impedance should not be zero.','input', 'model');
end
Y = 1/complex(Z_Re, Z_Im);
Y_Re = real(Y);
Y_Im = imag(Y);

%=======================================================================
%==============================================================================
%==============================================================================


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)
