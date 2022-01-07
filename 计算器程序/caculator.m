function varargout = caculator(varargin)
% CACULATOR MATLAB code for caculator.fig
%      CACULATOR, by itself, creates a new CACULATOR or raises the existing
%      singleton*.
%
%      H = CACULATOR returns the handle to a new CACULATOR or the handle to
%      the existing singleton*.
%
%      CACULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CACULATOR.M with the given input arguments.
%
%      CACULATOR('Property','Value',...) creates a new CACULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before caculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to caculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help caculator

% Last Modified by GUIDE v2.5 05-Jun-2018 19:21:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @caculator_OpeningFcn, ...
                   'gui_OutputFcn',  @caculator_OutputFcn, ...
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


% --- Executes just before caculator is made visible.
function caculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to caculator (see VARARGIN)

% Choose default command line output for caculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes caculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = caculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_8.
function pushbutton_8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'8');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('8.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_6.
function pushbutton_6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'6');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('6.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_7.
function pushbutton_7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'7');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('7.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_1.
function pushbutton_1_Callback(~, eventdata, handles)
% hObject    handle to pushbutton_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'1');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('1.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_2.
function pushbutton_2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'2');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('2.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_4.
function pushbutton_4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'4');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('4.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_5.
function pushbutton_5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'5');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('5.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbuttonadd.
function pushbuttonadd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonadd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'+');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('add.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_3.
function pushbutton_3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'3');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('3.wav');
sound(y,Fs);
end

% --- Executes on button press in pushbutton_mult.
function pushbutton_mult_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_mult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'*');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('mult.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_sub.
function pushbutton_sub_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'-');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('sub.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_equal.
function pushbutton_equal_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
ans =  eval(textString);
set(handles.text1,'String',ans)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('equal.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_tuige.
function pushbutton_tuige_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_tuige (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
set(handles.text1,'String','')
ss = char(textString);
n = length(textString);
textString =ss(1:n-1);
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('tuige.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_0.
function pushbutton_0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'0');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('0.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_9.
function pushbutton_9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'9');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('9.wav');
sound(y,Fs);
end


% --- Executes on button press in pushbutton_div.
function pushbutton_div_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'/');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('div.wav');
sound(y,Fs);
end

% --- Executes on button press in pushbutton_clear.
function pushbutton_clear_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'String',' ')
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('clear.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_dian.
function pushbutton_dian_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_dian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'.');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('dian.wav');
sound(y,Fs);
end

% --- Executes on button press in pushbutton_pingfang.
function pushbutton_pingfang_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pingfang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString = get(handles.text1,'String');
textString = strcat(textString,'^');
set(handles.text1,'String',textString)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('mi.wav');
sound(y,Fs);
end
% --- Executes on button press in pushbutton_close.
function pushbutton_close_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= get(handles.C,'Value');
if a==2
[y Fs] = audioread('close1.wav');
sound(y,Fs);
end
close(gcf)


% --- Executes on selection change in C.
function C_Callback(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns C contents as cell array
%        contents{get(hObject,'Value')} returns selected item from C


% --- Executes during object creation, after setting all properties.
function C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
