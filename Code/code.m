gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Matlab_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Matlab_OutputFcn, ...
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


% --- Executes just before GUI_Matlab is made visible.
function GUI_Matlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Matlab (see VARARGIN)

% Choose default command line output for GUI_Matlab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Matlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Matlab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function PoinKorelasi_Callback(hObject, eventdata, handles)
% hObject    handle to PoinKorelasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PoinKorelasi as text
%        str2double(get(hObject,'String')) returns contents of PoinKorelasi as a double

% --- Executes during object creation, after setting all properties.
function PoinKorelasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PoinKorelasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Hasil_Callback(hObject, eventdata, handles)
% hObject    handle to Hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hasil as text
%        str2double(get(hObject,'String')) returns contents of Hasil as a double

% --- Executes during object creation, after setting all properties.
function Hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function InputAudioName_Callback(hObject, eventdata, handles)
% hObject    handle to InputAudioName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputAudioName as text
%        str2double(get(hObject,'String')) returns contents of InputAudioName as a double

name = get(handles.InputAudioName,'String');
handles.name = name;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function InputAudioName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputAudioName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonStart.
function PushbuttonStart_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
name = handles.name;

voice=audioread(name);
x=voice;
x=x';
x=x(1,:);
x=x';

% Menampilkan grafik audio original
lx = length(x);
tx=-((lx-1)/2):1:((lx-1)/2);
handles.tx = tx;
handles.x = x;
guidata(hObject,handles);
axes(handles.Axis1);
plot(tx,x);

y1=audioread('lampON.mp3');
y1=y1';
y1=y1(1,:);
y1=y1';
z1=xcorr(x,y1);
m1=max(z1);
l1=length(z1);
t1=-((l1-1)/2):1:((l1-1)/2);
t1=t1';

y2=audioread('lampOFF.mp3');
y2=y2';
y2=y2(1,:);
y2=y2';
z2=xcorr(x,y2);
m2=max(z2);
l2=length(z2);
t2=-((l2-1)/2):1:((l2-1)/2);
t2=t2';


y3=audioread('tvON.mp3');
y3=y3';
y3=y3(1,:);
y3=y3';
z3=xcorr(x,y3);
m3=max(z3);
l3=length(z3);
t3=-((l3-1)/2):1:((l3-1)/2);
t3=t3';
%subplot(3,2,3);


y4=audioread('tvOFF.mp3');
y4=y4';
y4=y4(1,:);
y4=y4';
z4=xcorr(x,y4);
m4=max(z4);
l4=length(z4);
t4=-((l4-1)/2):1:((l4-1)/2);
t4=t4';
%subplot(3,2,4);


y5=audioread('acON.mp3');
y5=y5';
y5=y5(1,:);
y5=y5';
z5=xcorr(x,y5);
m5=max(z5);
l5=length(z5);
t5=-((l5-1)/2):1:((l5-1)/2);
t5=t5';
%subplot(3,2,5);


y6=audioread('acOFF.mp3');
y6=y6';
y6=y6(1,:);
y6=y6';
z6=xcorr(x,y6);
m6=max(z6);
l6=length(z6);
t6=-((l6-1)/2):1:((l6-1)/2);
t6=t6';
%subplot(3,2,5);


m7=300;
a=[m1 m2 m3 m4 m5 m6 m7];
m=max(a);
h=audioread('allow.wav');

t = 0;
z = 0;


% Proses korelasi
if m<=m1
    soundsc(audioread('lampON.mp3'),50000)
    soundsc(h,50000)
    handles.t1 = t1;
    handles.z1 = z1;
    y = y1;
    handles.y = y;
    handles.m = m1;
    hasilAudio = 'ADA';
    handles.hasilAudio = hasilAudio;
    guidata(hObject,handles);
    axes(handles.axes2);
    plot(t1,z1);
elseif m<=m2
    soundsc(audioread('lampOFF.mp3'),50000)
    soundsc(h,50000)
    handles.t2 = t2;
    handles.z2 = z2;
    y = y2;
    handles.y = y;
    handles.m = m2;
    hasilAudio = 'ADA';
    handles.hasilAudio = hasilAudio;
    guidata(hObject,handles);
    axes(handles.axes2);
    plot(t2,z2);
elseif m<=m3
    soundsc(audioread('tvON.mp3'),50000)
    soundsc(h,50000)
    handles.t3 = t3;
    handles.z3 = z3;
    y = y3;
    handles.y = y;
    handles.m = m3;
    hasilAudio = 'ADA';
    handles.hasilAudio = hasilAudio;
    guidata(hObject,handles);
    axes(handles.axes2);
    plot(t3,z3);
elseif m<=m4
    soundsc(audioread('tvOFF.mp3'),50000)
    soundsc(h,50000)
    handles.t4 = t4;
    handles.z4 = z4;
    y = y4;
    handles.y = y;
    handles.m = m4;
    hasilAudio = 'ADA';
    handles.hasilAudio = hasilAudio;
    guidata(hObject,handles);
    axes(handles.axes2);
    plot(t4,z4);
elseif m<=m5
    soundsc(audioread('acON.mp3'),50000)
    soundsc(h,50000)
    handles.t5 = t5;
    handles.z5 = z5;
    y = y5;
    handles.y = y;
    handles.m = m5;
    hasilAudio = 'ADA';
    handles.hasilAudio = hasilAudio;
    guidata(hObject,handles);
    axes(handles.axes2);
    plot(t5,z5);
elseif m<=m6
    soundsc(audioread('acOFF.mp3'),50000)
    soundsc(h,50000)
    handles.t6 = t6;
    handles.z6 = z6;
    y = y6;
    handles.y = y;
    handles.m = m6;
    hasilAudio = 'ADA';
    handles.hasilAudio = hasilAudio;
    guidata(hObject,handles);
    axes(handles.axes2);
    plot(t6,z6);
else
   denied = audioread('denied.wav');
   soundsc(denied,50000)
   handles.m = max(a);
   hasilAudio = 'TIDAK ADA';
   handles.hasilAudio = hasilAudio;
   guidata(hObject,handles);
end

% Menampilkan data poin korelasi
set(handles.PoinKorelasi,'String',num2str(handles.m));
% Menampilkan string ada atauu tidak pada output hasil
set(handles.Hasil,'String',handles.hasilAudio);
% Menampilkan grafik audio setelah dilakukan korelasi
guidata(hObject,handles);
axes(handles.axes3);
plot(handles.y);

% --- Executes on button press in PushbuttonReset.
function PushbuttonReset_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Menghapus data nilai korelasi
set(handles.PoinKorelasi,'String', "");
% Menghapus data nama audio
set(handles.InputAudioName,'String', "");
% Menghapus grafik audio original
guidata(hObject,handles);
axes(handles.Axis1);
plot(0);
% Menghapus grafik audio setelah korelasi
guidata(hObject,handles);
axes(handles.axes2);
plot(0);
% Menghapus grafik audio yang ada di database
axes(handles.axes3);
plot(0);
% Menghapus string pada output hasil
set(handles.Hasil,'String',"");
% Mereset audio
handles.name = "";
guidata(hObject,handles);

% --- Executes on button press in PushbuttonPlay.
function PushbuttonPlay_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonPlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
name = handles.name;
% Membaca audio dari input user
soundsc(audioread(handles.name),50000);
