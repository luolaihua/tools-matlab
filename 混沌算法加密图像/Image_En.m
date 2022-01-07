function varargout = Image_En(varargin)
% IMAGE_EN MATLAB code for Image_En.fig
%      IMAGE_EN, by itself, creates a new IMAGE_EN or raises the existing
%      singleton*.
%
%      H = IMAGE_EN returns the handle to a new IMAGE_EN or the handle to
%      the existing singleton*.
%
%      IMAGE_EN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_EN.M with the given input arguments.
%
%      IMAGE_EN('Property','Value',...) creates a new IMAGE_EN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_En_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_En_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_En

% Last Modified by GUIDE v2.5 05-Jun-2018 20:29:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_En_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_En_OutputFcn, ...
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


% --- Executes just before Image_En is made visible.
function Image_En_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_En (see VARARGIN)

% Choose default command line output for Image_En
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_En wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_En_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.jpg';'*.jpeg';'*.bmp';'*.gif';'tif'},'打开图片');
if filename~=0
I=imread(strcat(pathname,filename));
end 
image=I;
t0=cputime;

%figure(1);subplot(211);imhist(image);title('原图的灰度直方图')

figure(2);subplot(131);imshow(image)
title('原图')


[M,N]   = size(image);
Rm      = randsample(M,M)';%转成行向量
Rn      = randsample(N,N)';


save key1.mat Rm Rn;


Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];


%打乱行顺序
image (Mchange(1,:),:) = image (Mchange(2,:),:);

figure(2);subplot(132); imshow(image);title('行加密后图像')

%打乱列顺序
image (:,Nchange(1,:)) = image (:,Nchange(2,:));


figure(2);subplot(133);imshow(image);title('加密后图像')
%figure(1);subplot(212);imhist(image);title('加密后图像的灰度直方图')

imwrite(image,'James1.bmp');
time=cputime-t0;
textString=num2str(time);
set(handles.text3,'String',textString)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.bmp';'*.jpg';'*.gif';'tif'},'打开需要解密的图片');
if filename~=0
I1=imread(strcat(pathname,filename));
end 
image1=I1;

t1=cputime;
[M,N]   = size(image1);

[filename1,pathname1]=uigetfile({'*.mat'},'打开秘钥');
if filename1~=0
load(strcat(pathname1,filename1));
end 

%image = imnoise(image, 'salt & pepper', 0.1);

%figure(1);subplot(211);imhist(image);title('加密的灰度直方图')

figure(2);subplot(131);imshow(image1)
title('加密图')

Mchange = [1:1:M;Rm];
Nchange = [1:1:N;Rn];
image1 (:,Nchange(2,:)) = image1 (:,Nchange(1,:));
figure(2);subplot(132); imshow(image1);title('行解密后图像')

image1 (Mchange(2,:),:) = image1 (Mchange(1,:),:);
figure(2);subplot(133);imshow(image1);title('解密后图像')
%figure(1);subplot(212);imhist(image);title('解密后图像的灰度直方图')
imwrite(image1,'James1_DE.jpg');

time=cputime-t1;
textString=num2str(time);
set(handles.text3,'String',textString)
