function varargout = SmithTest(varargin)
% SMITHTEST MATLAB code for SmithTest.fig
%      SMITHTEST, by itself, creates a new SMITHTEST or raises the existing
%      singleton*.
%
%      H = SMITHTEST returns the handle to a new SMITHTEST or the handle to
%      the existing singleton*.
%
%      SMITHTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMITHTEST.M with the given input arguments.
%
%      SMITHTEST('Property','Value',...) creates a new SMITHTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SmithTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SmithTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SmithTest

% Last Modified by GUIDE v2.5 10-Jun-2018 16:18:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SmithTest_OpeningFcn, ...
                   'gui_OutputFcn',  @SmithTest_OutputFcn, ...
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


% --- Executes just before SmithTest is made visible.
function SmithTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SmithTest (see VARARGIN)

% Choose default command line output for SmithTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SmithTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SmithTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function hint2_Callback(hObject, eventdata, handles)
global in2_r in2_i in2_l
if ~isnan(in2_r) && ~isnan(in2_i) && ~isnan(in2_l)%判断输入是否是数值，是否int2_r和int2_i都在[0,1]上
    zl=in2_r+in2_i*i;%取出负载阻抗值
    gammal=(zl-1)/(zl+1);
    tmp=abs(gammal);%|zl|
    zin=(zl+i*tan(2*pi*in2_l))/(1+i*zl*tan(2*pi*in2_l));%计算输入阻抗
    r=real(zin);%输入阻抗的电阻
    im=imag(zin);%输入阻抗的电抗
    gammain=(zin-1)/(zin+1);%反射系数
    set(handles.result2_zin,'string',num2str(zin));%将结果输出到result2_zin的文本框
end


% --- Executes during object creation, after setting all properties.
function hint2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
