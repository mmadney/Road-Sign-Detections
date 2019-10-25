function varargout = sign_detect(varargin)
% SIGN_DETECT MATLAB code for sign_detect.fig
%      SIGN_DETECT, by itself, creates a new SIGN_DETECT or raises the existing
%      singleton*.
%
%      H = SIGN_DETECT returns the handle to a new SIGN_DETECT or the handle to
%      the existing singleton*.
%
%      SIGN_DETECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGN_DETECT.M with the given input arguments.
%
%      SIGN_DETECT('Property','Value',...) creates a new SIGN_DETECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sign_detect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sign_detect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sign_detect

% Last Modified by GUIDE v2.5 16-Dec-2017 13:41:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sign_detect_OpeningFcn, ...
                   'gui_OutputFcn',  @sign_detect_OutputFcn, ...
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


% --- Executes just before sign_detect is made visible.
function sign_detect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sign_detect (see VARARGIN)

% Choose default command line output for sign_detect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sign_detect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sign_detect_OutputFcn(hObject, eventdata, handles) 
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
[FileName,PathName,FilterIndex] = uigetfile({'*.*;*.jpg;*.tif;*.png;*.gif','All Image Files';'*.*','All Files' });
handles.Image=imread(FileName);
handles.passing=imread('pass1.JPG');
handles.left=imread('left.PNG');
handles.parking=imread('park.PNG');
handles.entry=imread('entry.JPG');
% Set current drawing axes to "axes1"
axes(handles.axes1);
% Display the image
imshow(handles.Image);
% Save the handles structure.
guidata(hObject, handles);
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be                             ++++++++defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.Result , type] = Detect_shape(handles.Image,handles.entry,handles.left,handles.passing,handles.parking);
% Save the handles structure.
guidata(hObject, handles);
set(handles.si,'string',type);
axes(handles.axes2);
% Display the image
imshow(handles.Result);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
