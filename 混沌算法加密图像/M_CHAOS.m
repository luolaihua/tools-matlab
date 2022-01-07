function varargout = M_CHAOS(varargin)
% M_CHAOS MATLAB code for M_CHAOS.fig
%      M_CHAOS, by itself, creates a new M_CHAOS or raises the existing
%      singleton*.
%
%      H = M_CHAOS returns the handle to a new M_CHAOS or the handle to
%      the existing singleton*.
%
%      M_CHAOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M_CHAOS.M with the given input arguments.
%
%      M_CHAOS('Property','Value',...) creates a new M_CHAOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M_CHAOS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M_CHAOS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M_CHAOS

% Last Modified by GUIDE v2.5 15-Jun-2018 10:20:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M_CHAOS_OpeningFcn, ...
                   'gui_OutputFcn',  @M_CHAOS_OutputFcn, ...
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


% --- Executes just before M_CHAOS is made visible.
function M_CHAOS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M_CHAOS (see VARARGIN)

% Choose default command line output for M_CHAOS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M_CHAOS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M_CHAOS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile({'*.jpg';'*.jpeg';'*.bmp';'*.gif';'tif'},'打开图片');
if filename~=0
I=imread(strcat(pathname,filename));
end 
%寻找后缀名前面的标志‘.’
i = find('.'==filename);
%去除文件后缀，提取单纯的文件名
handles.filename0 = filename(1:i-1);
handles.Image0=I;
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile({'*.bmp';'*.jpg';'*.gif';'tif'},'打开需要解密的图片');
if filename~=0
I1=imread(strcat(pathname,filename));
end 
%寻找后缀名前面的标志‘.’
i = find('.'==filename);
%去除文件后缀，提取单纯的文件名
handles.filename1 = filename(1:i-1);
handles.EN_Image0=I1;
guidata(hObject,handles);


function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton3_Callback(hObject, eventdata, handles)
str = get(handles.edit1, 'String');
m(1)=str2num(str);
Image0 = handles.Image0; 
s = size(Image0);  
N = s(1) * s(2) * s(3); 
disp('加密中...'); 
u=4;
for i = 1:N-1  
    m(i+1) = u * m(i) - u * m(i)^2;
    m;
end 
m = mod(m * 1000, 256);  
m = uint8(m);  
n = 1;  
for i = 1:s(3)  
    for j = 1:s(2)  
        for k = 1:s(1)  
            Image1(k, j, i) = bitxor(m(n), Image0(k ,j, i));  
            n = n + 1;  
        end  
    end  
end  
disp('加密成功!'); 
figure(1);subplot(121);imshow(Image0);title('原图');subplot(122);imshow(Image1);title('加密后的图片');
filename0=handles.filename0;
b='_En.bmp';
imwrite(Image1, strcat(filename0,b));  



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.edit1, 'String');
m1(1)=str2num(str);
EN_Image0 = handles.EN_Image0; 
s1 = size(EN_Image0);  
N1 = s1(1) * s1(2) * s1(3);  
 
disp('解密中...');  

for i1 = 1:N1-1  
    %构造混沌序列
    m1(i1+1) = 4 * m1(i1) - 4 * m1(i1)^2;  
end  
m1 = mod(m1 * 1000, 256);  
m1 = uint8(m1);  
n1 = 1;  
for i1 = 1:s1(3)  
    for j1 = 1:s1(2)  
        for k1 = 1:s1(1)  
            DE_Image1(k1, j1, i1) = bitxor(m1(n1), EN_Image0(k1, j1, i1));  
            n1 = n1 + 1;  
        end  
    end  
end  
disp('解密成功!'); 

filename1=handles.filename1;
b='_De.jpg';
imwrite(DE_Image1, strcat(filename1,b));  
figure(3);subplot(121);imshow(EN_Image0);title('待解密图片');subplot(122);imshow(DE_Image1);title('解密后的图片');
