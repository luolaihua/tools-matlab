function varargout = smithyyq(varargin)
% SMITHYYQ MATLAB code for smithyyq.fig
%      SMITHYYQ, by itself, creates a new SMITHYYQ or raises the existing
%      singleton*.
%
%      H = SMITHYYQ returns the handle to a new SMITHYYQ or the handle to
%      the existing singleton*.
%
%      SMITHYYQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMITHYYQ.M with the given input arguments.
%
%      SMITHYYQ('Property','Value',...) creates a new SMITHYYQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before smithyyq_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to smithyyq_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help smithyyq

% Last Modified by GUIDE v2.5 19-May-2013 12:13:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @smithyyq_OpeningFcn, ...
                   'gui_OutputFcn',  @smithyyq_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before smithyyq is made visible.
function smithyyq_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to smithyyq (see VARARGIN)

% Choose default command line output for smithyyq
axes = handles.SmithChart;
smith_chart(0);
%smith_chart(0);%open with a z type smithchart
set(handles.SmithChart,'Color','white');
set(handles.SmithChart,'XColor',get(handles.figure1,'color'));
set(handles.SmithChart,'YColor',get(handles.figure1,'color'));
% Choose default command line output for smith1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes smithyyq wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = smithyyq_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_Real_Callback(hObject, eventdata, handles)
% hObject    handle to Z_Real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z_Real as text
%        str2double(get(hObject,'String')) returns contents of Z_Real as a double


% --- Executes during object creation, after setting all properties.
function Z_Real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z_Real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_Imag_Callback(hObject, eventdata, handles)
% hObject    handle to Z_Imag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z_Imag as text
%        str2double(get(hObject,'String')) returns contents of Z_Imag as a double


% --- Executes during object creation, after setting all properties.
function Z_Imag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z_Imag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Real_Callback(hObject, eventdata, handles)
% hObject    handle to Y_Real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y_Real as text
%        str2double(get(hObject,'String')) returns contents of Y_Real as a double


% --- Executes during object creation, after setting all properties.
function Y_Real_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y_Real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Imag_Callback(hObject, eventdata, handles)
% hObject    handle to Y_Imag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y_Imag as text
%        str2double(get(hObject,'String')) returns contents of Y_Imag as a double


% --- Executes during object creation, after setting all properties.
function Y_Imag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y_Imag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Rl=str2double(get(hObject,'String'));
if isnan(handles.Rl)
    errordlg('You must enter a number','Bad Input','modal')
end
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.Xl=str2double(get(hObject,'string'));
if isnan(handles.Xl)
    errordlg('You must enter a number','Bad Input','modal')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
handles.Zc=str2double(get(hObject,'string'));
if isnan(handles.Zc)
    errordlg('You must enter a number','Bad Input','modal')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculatepl.
function Calculatepl_Callback(hObject, eventdata, handles)
% hObject    handle to Calculatepl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.flex=sqrt( ((handles.Rl-handles.Zc)*(handles.Rl-handles.Zc)+handles.Xl*handles.Xl)/((handles.Rl+handles.Zc)*(handles.Rl+handles.Zc)+handles.Xl*handles.Xl) );
%set(handles.edit9,'String',handles.flex);
handles.ZlR=handles.Rl/handles.Zc;
handles.ZlX=handles.Xl/handles.Zc;
% Z_Re=handles.Rl/handles.Zc;
% Z_Im=handles.Xl/handles.Zc;
%Y_Re=handles.YlR;
%Y_Im=handles.YlX;
set(handles.Z_Real,'String',handles.ZlR);
set(handles.Z_Imag,'String',handles.ZlX);
Z_Re = str2num(get(handles.Z_Real, 'String'));
Z_Im = str2num(get(handles.Z_Imag, 'String'));
Z1=complex(Z_Re,Z_Im);
Y1=1/Z1;
Y1_Re=real(Y1);
Y1_Imag=imag(Y1);
set(handles.Y_Real,'String',Y1_Re);
set(handles.Y_Imag,'String',Y1_Imag);
Is_Y=0;
[AbsL, Ph] = ConvertZ2AbsL_Ph(Z_Re, Z_Im);
set(handles.edit9,'String',AbsL);
set(handles.edit10,'String',Ph);
P=abs((1+AbsL)/(1-AbsL));
K=1/P;
set(handles.edit8,'String',P);
set(handles.edit11,'String',K);
DrawZL(handles, Z_Re, Z_Im, AbsL, Ph, Is_Y) 
%Z = complex(handles.ZlR,handles.ZlX);

function smith_chart(option)
% Usage: smith(option)
%
% Purpose: creates Smith chart display
%
% Parameters:
%   option = 0 <-- Z-Smith Chart is created (black color, solid line)
%   option = 1 <-- Y-Smith Chart is created (black color, solid line)
%   option = 2 <-- ZY-Smith Chart is created (black color,
%                  Z-Chart- solid line, Y-Chart - dashed line)

% define X and R circles
X=[0.2 0.5 1 2 5];
R=[0.2 0.5 1 2 5];

% we want to plot smooth cirlces with 101 points
alpha=2*pi*(0:0.01:1);

% if no arguments are not specified we assume Z-chart
if nargin<1
   option=0;
end;

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
function [Z_Re, Z_Im] = ConvertAbsL_Ph2Z(AbsL, Ph)
Refl_Coef_Re = AbsL * cos(Ph);
Refl_Coef_Im = AbsL * sin(Ph); 
Refl_Coef = complex(Refl_Coef_Re, Refl_Coef_Im);
Z = (1 + Refl_Coef) / (1 - Refl_Coef);
Z_Re = real(Z);
Z_Im = imag(Z);
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
function Draw_Ratio(handles,AbsL, Ph, Is_Y)
theta = 0:pi/500:2*pi;
x_zIN = AbsL*cos(theta);
y_zIN = AbsL*sin(theta);
if(Is_Y)
    x_zIN= -x_zIN;
    y_zIN = -y_zIN;
end
plot(x_zIN,y_zIN,...
    'LineWidth',2,'MarkerSize',20);
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
plot(x_g, y_g,'r', ...
    'LineWidth',2,'MarkerSize',20);
function Draw_Imag_Part(handles,Z_Im, AbsL, Ph, Is_Y)
label = 'z_{in}';
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
plot(x, y,'g', AbsL*cos(Ph),AbsL*sin(Ph),'k.',...
    'LineWidth',2,'MarkerSize',20);
text(AbsL*cos(Ph),AbsL*sin(Ph),label,...
    'FontSize',12,'FontUnits','normalized');


% --- Executes on button press in clearall.
function clearall_Callback(hObject, eventdata, handles)
% hObject    handle to clearall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
smith_chart(0);

set(handles.Z_Real,'String','');
set(handles.Z_Imag,'String','');
set(handles.Y_Real,'String','');
set(handles.Y_Imag,'String','');
set(handles.edit1,'String','');
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.length1,'String','');
set(handles.length2,'String','');
set(handles.distance1,'String','');
set(handles.distance2,'String','');
set(handles.Double_1Length1,'String','');
set(handles.Double_2Length1,'String','');
set(handles.Double_D1,'String','');
set(handles.Double_D2,'String','');
set(handles.edit8,'String','');
set(handles.edit9,'String','');
set(handles.edit10,'String','');
set(handles.edit11,'String','');
set(handles.Double_1Length2,'String','');
set(handles.Double_2Length2,'String','');
clear all;





function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [Y_Re, Y_Im] = ConvertZ2Y(Z_Re, Z_Im)
%ConvertY2Z can also use this one
if (complex(Z_Re, Z_Im) == 0)
    errordlg('Load impedance should not be zero.','input', 'model');
end
Y = 1/complex(Z_Re, Z_Im);
Y_Re = real(Y);
Y_Im = imag(Y);
% --- Executes on button press in single.
function single_Callback(hObject, eventdata, handles)
% hObject    handle to single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ZlR=handles.Rl/handles.Zc;
handles.ZlX=handles.Xl/handles.Zc;
set(handles.Z_Real,'String',handles.ZlR);
set(handles.Z_Imag,'String',handles.ZlX);

Z_Re = str2num(get(handles.Z_Real, 'String'));
Z_Im = str2num(get(handles.Z_Imag, 'String'));

Z = complex(Z_Re,Z_Im);
[Y_Re, Y_Im] = ConvertZ2Y(Z_Re, Z_Im);
[AbsL, Ph] =  ConvertZ2AbsL_Ph(Z_Re, Z_Im);
set(handles.Y_Real,'String',Y_Re);
set(handles.Y_Imag,'String',Y_Im);
[AbsL, Ph] = ConvertZ2AbsL_Ph(Z_Re, Z_Im);
set(handles.edit9,'String',AbsL);
set(handles.edit10,'String',Ph);
P=abs((1+AbsL)/(1-AbsL));
K=1/P;
if Y_Im == 0
    L1=atan(sqrt(Y_Re)/(1-Y_Re))/2/pi;
    L2=-atan(sqrt(Y_Re)/(1-Y_Re))/2/pi;
else
    L1=atan(sqrt(P)/(1-P))/2/pi;
    L2=atan(-sqrt(P)/(1-P))/2/pi;
end;
if L1<0
    L1=L1+0.5;
end;
if L2<0
    L2=L2+0.5;
end;
if Y_Im == 0
    theta1=acos((Y_Re-1)/(Y_Re+1));
    theta2=2*pi-theta1;
    D1=getdistance(theta1);
    D2=getdistance(theta2);
else
    theta1=acos((K-1)/(K+1));
    theta2=2*pi-theta1;
    lmin=Ph/pi/2*0.5;
    D1=getdistance(theta2)+lmin;
    D2=getdistance(theta1)+lmin;
    if D1>0.5
        D1=D1-0.5;
    end;
    if D2>0.5
        D2=D2-0.5;
    end;
end;

set(handles.length1, 'string', num2str(L1));
set(handles.length2, 'string', num2str(L2));
set(handles.distance1, 'string', num2str(D1));
set(handles.distance2, 'string', num2str(D2));
cla;
b1=2*sqrt(AbsL^2-AbsL^4)/(1-AbsL^2);
b2=-b1;
smith_chart(0);%draw Y type smithchart
hold on;
X3=[0,cos(Ph)];
Y3=[0,sin(Ph)];
plot(X3,Y3,'k','LineWidth',2);
plot(-X3,-Y3,'k','LineWidth',2);
Display_Marker_And_Text(AbsL, Ph, 'Zin');
Display_Marker_And_Text(AbsL, Ph+pi, 'Yin');
Draw_Circle(0, 0, AbsL,'b');
pause(0.1);
Draw_Circle(0.5, 0, 0.5, 'r');
[AbsL1, Ph1] =  ConvertZ2AbsL_Ph(1, b1);
[AbsL2, Ph2] =  ConvertZ2AbsL_Ph(1, b2);
X1=[0,cos(Ph1)];
Y1= [0,sin(Ph1)];
Y2=[0,sin(Ph2)];
plot(X1,Y1,'g','LineWidth',3);
plot(X1,Y2,'g','LineWidth',3);
Display_Marker_And_Text(AbsL1, Ph1, 'Matched1');
Display_Marker_And_Text(AbsL2, Ph2, 'Matched2');


function Draw_Circle(cx, cy, radius,color)
for i=0:360;
theta = i*pi/180;
x = [radius*cos(theta)+cx;radius*cos(theta+pi/180)+cx];
y = [radius*sin(theta)+cy;radius*sin(theta+pi/180)+cy];
if(rem(i,15)==0)
    pause(0.001);
end;
if(theta~=2*pi)
plot(x,y,color,'LineWidth',2);
end;
end;
function Display_Marker_And_Text(AbsL, Ph, label)
hold on;
plot(AbsL*cos(Ph),AbsL*sin(Ph),'k.', 'MarkerSize',20);
text(AbsL*cos(Ph),AbsL*sin(Ph),label,...
    'FontSize',12,'FontUnits','normalized');

function Dist = Dist_From_Load(Z_Load, Z_In)
if(Z_In==Inf)
    Dist=0.25;
else
Dist = real(atan((Z_In - Z_Load) / j / (1 - Z_In*Z_Load)) / 2 / pi);
end
if (Dist < 0)
    Dist = Dist + 0.5;
end
function distan = getdistance(theta)
distan=theta/4/pi;
  
function Z_In = Input_Impedance(Z_Load, Normalised_L)
Z_In = (Z_Load + j*tan(2 * pi * Normalised_L))/(1 + j*Z_Load * tan(2 * pi * Normalised_L));
function [xr,yr] = Rotate_Point(x, y, theta)
xr = x*cos(theta) + y*sin(theta);
yr = x*sin(theta) - y*cos(theta);
function Draw_Arch(cx, cy, radius, theta1, theta2, color)
N=fix( abs(theta2-theta1)/pi*180 );
for i=0:N;
theta = theta1+i*(theta2-theta1)/N;
x = [radius*cos(theta)+cx;radius*cos(theta+(theta2-theta1)/N)+cx];
y = [radius*sin(theta)+cy;radius*sin(theta+(theta2-theta1)/N)+cy];
if(rem(i,15)==0)
    pause(0.001);
end;%insert a delayed effect
if(theta~=theta2)
    plot(x,y,color,'LineWidth',2);
end;
end;
% --- Executes on button press in double.
function theta=arctan(x,y)
if (y>=0)
    theta=atan2(y,x);
else 
    theta=atan2(y,x)+2*pi;
end;
if (theta < 0)
    theta = theta + 2*pi;
end
function double_Callback(hObject, eventdata, handles)
% hObject    handle to double (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ZlR=handles.Rl/handles.Zc;
handles.ZlX=handles.Xl/handles.Zc;
set(handles.Z_Real,'String',handles.ZlR);
set(handles.Z_Imag,'String',handles.ZlX);
d1=str2num(get(handles.Double_D1,'string'));
d2=str2num(get(handles.Double_D2,'string'));
a=str2num(get(handles.Z_Real,'string'));
b=str2num(get(handles.Z_Imag,'string'));
Z_Load=complex(a,b);
[AbsL, Ph] = ConvertZ2AbsL_Ph(a, b);
Z1=Input_Impedance(Z_Load,d1);
Y1=1/Input_Impedance(Z_Load,d1);
g=real(Y1);
b=imag(Y1);
%¼ì²âÊÇ·ñÔÚÃ¤Çø
if( g/(g+1) > 2/(3-cos(d2*4*pi)) )
{
        errordlg('Blind Area!!!');
}
else
    
cla;
axes = handles.SmithChart;
smith_chart(0);
hold on;
text(-AbsL*cos(Ph),-AbsL*sin(Ph),'Yin',...
    'FontSize',12,'FontUnits','normalized');
plot(-AbsL*cos(Ph),-AbsL*sin(Ph),'k.',...
   'MarkerSize',20);
Draw_Circle(0.5, 0, 0.5, 'g');
pause(1);
[xr, yr] = Rotate_Point(0.5, 0, d2*4*pi);
Draw_Circle(xr, yr, 0.5, 'b');
pause(1);

Draw_Arch(0, 0, AbsL,Ph+pi, Ph+pi - d1*4*pi, 'k');%draw d1
pause(1);

Draw_Real_Part(handles,g, AbsL,Ph,0)
pause(1);
%special case
if(d2 == 0.25)
    x1 = (g^2 - 1)/(1 + 3*g)/(1+g);
    x2 = x1;
    y1 = sqrt(-x1 - x1^2);
    y2 = -y1;
else
syms x y g_ d2_;
[x,y]=solve('(x-g_/(1+g_))^2+y^2 = 1/(1+g_)^2' , '(x-1/2*cos(d2_*4*pi))^2+(y-1/2*sin(d2_*4*pi))^2=1/4');
x(1)=subs(x(1),g_,g);
x(1)=subs(x(1),d2_,d2);
x(2)=subs(x(2),g_,g);
x(2)=subs(x(2),d2_,d2);
y(1)=subs(y(1),g_,g);
y(1)=subs(y(1),d2_,d2);
y(2)=subs(y(2),g_,g);
y(2)=subs(y(2),d2_,d2);
x1=eval(x(1));
x2=eval(x(2));
y1=eval(y(1));
y2=eval(y(2));
end

b1=2*y1/((1-x1)^2+y1^2);  
b2=2*y2/((1-x2)^2+y2^2);
delta_b1=double(b1-b);
delta_b2=double(b2-b);%x1, x2 


stub1_length1=Dist_From_Load(0,1/(delta_b1*j));
stub1_length2=Dist_From_Load(0,1/(delta_b2*j));

set(handles.Double_1Length1,'string',num2str(stub1_length1));
set(handles.Double_1Length2,'string',num2str(stub1_length2));

theta1=arctan(x1,y1);
theta3=theta1-d2*4*pi;
x3=sqrt(x1^2+y1^2)*cos(theta3);
y3=sqrt(x1^2+y1^2)*sin(theta3);
b3=2*y3/((1-x3)^2+y3^2);
delta_b=-b3;
stub2_length1=Dist_From_Load(0,1/(delta_b*j));
set(handles.Double_2Length1,'string',num2str(stub2_length1));
Draw_Arch(0, 0, sqrt(x3^2 +y3^2),arctan(x3, y3) + d2*4*pi, arctan(x3, y3),  'm'); 
pause(1);

theta2=arctan(x2,y2);
theta4=theta2-d2*4*pi;
x4=sqrt(x2^2+y2^2)*cos(theta4);
y4=sqrt(x2^2+y2^2)*sin(theta4);
b4=2*y4/((1-x4)^2+y4^2);
delta_b=-b4;
stub2_length2=Dist_From_Load(0,1/(delta_b*j));
set(handles.Double_2Length2,'string',num2str(stub2_length2));

Draw_Arch(0, 0, sqrt(x4^2 +y4^2), arctan(x4, y4) + d2*4*pi,arctan(x4, y4),  'm');
end;
%set(handles.Status,'string','ready');


function Double_D1_Callback(hObject, eventdata, handles)
% hObject    handle to Double_D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Double_D1 as text
%        str2double(get(hObject,'String')) returns contents of Double_D1 as a double


% --- Executes during object creation, after setting all properties.
function Double_D1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Double_D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Double_D2_Callback(hObject, eventdata, handles)
% hObject    handle to Double_D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Double_D2 as text
%        str2double(get(hObject,'String')) returns contents of Double_D2 as a double


% --- Executes during object creation, after setting all properties.
function Double_D2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Double_D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
