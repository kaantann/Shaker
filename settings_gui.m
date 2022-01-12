function varargout = settings_gui(varargin)
% SETTINGS_GUI MATLAB code for settings_gui.fig
%      SETTINGS_GUI, by itself, creates a new SETTINGS_GUI or raises the existing
%      singleton*.
%
%      H = SETTINGS_GUI returns the handle to a new SETTINGS_GUI or the handle to
%      the existing singleton*.
%
%      SETTINGS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SETTINGS_GUI.M with the given input arguments.
%
%      SETTINGS_GUI('Property','Value',...) creates a new SETTINGS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before settings_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to settings_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help settings_gui

% Last Modified by GUIDE v2.5 25-Dec-2021 00:20:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @settings_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @settings_gui_OutputFcn, ...
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


% --- Executes just before settings_gui is made visible.
function settings_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to settings_gui (see VARARGIN)

% Choose default command line output for settings_gui
handles.output = hObject;
handles.sensored_floors_process = "0";
handles.update_button = getappdata(0,'update_button');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes settings_gui wait for user response (see UIRESUME)
% uiwait(handles.settings_gui);


% --- Outputs from this function are returned to the command line.
function varargout = settings_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function dimension1_Callback(hObject, eventdata, handles)
% hObject    handle to dimension1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.dimension1 = str2double(get(hObject,'String'));
    guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of dimension1 as text
%        str2double(get(hObject,'String')) returns contents of dimension1 as a double


% --- Executes during object creation, after setting all properties.
function dimension1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimension1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dimension2_Callback(hObject, eventdata, handles)
% hObject    handle to dimension2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.dimension2 = str2double(get(hObject,'String'));
    guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of dimension2 as text
%        str2double(get(hObject,'String')) returns contents of dimension2 as a double


% --- Executes during object creation, after setting all properties.
function dimension2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimension2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function total_floors_Callback(hObject, eventdata, handles)
% hObject    handle to total_floors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    handles.total_floors = str2double(get(hObject,'String'));
    guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of total_floors as text
%        str2double(get(hObject,'String')) returns contents of total_floors as a double


% --- Executes during object creation, after setting all properties.
function total_floors_CreateFcn(hObject, eventdata, handles)
% hObject    handle to total_floors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton_add.
function pushbutton_add_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.sensored_floors_process(end+1) = ",";
    handles.sensored_floors_process(end+1) = handles.sensoredfloor.String;
    handles.sensored_floors_process = strjoin(handles.sensored_floors_process);
    set(handles.sensored_floors, 'String', handles.sensored_floors_process);
    guidata(hObject, handles);



function sensored_floors_Callback(hObject, eventdata, handles)
% hObject    handle to sensored_floors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%denemedeneme = [str2double(get(hObject,'String'))];

% Update handles structure
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of sensored_floors as text
%        str2double(get(hObject,'String')) returns contents of sensored_floors as a double


% --- Executes during object creation, after setting all properties.
function sensored_floors_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensored_floors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in apply_button.
function apply_button_Callback(hObject, eventdata, handles)
% hObject    handle to apply_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
    
    
    setappdata(0,'dimension1',handles.dimension1);
    setappdata(0,'dimension2',handles.dimension2);
    setappdata(0,'total_floors',handles.total_floors);
    setappdata(0,'floor_height',handles.floor_height);
    
    newStr = erase(handles.sensored_floors.String, " ");
    handles.sensored_floors = unique(sort(str2double(split(newStr,","))));
    setappdata(0,'sensored_floors',handles.sensored_floors);
    
    handles.displacement_data = xlsread(handles.fullname_disp);
    handles.displacement_data = reshape(handles.displacement_data,3*length(handles.sensored_floors),[]);
    setappdata(0,'displacement_data',handles.displacement_data);
    
    handles.acc_data_NS = xlsread(handles.fullname_accNS);
    setappdata(0,'acc_data_NS',handles.acc_data_NS);
    
    handles.acc_data_WE = xlsread(handles.fullname_accWE);
    setappdata(0,'acc_data_WE',handles.acc_data_WE);
    
    setappdata(0,'time_increment',handles.time_increment);
    
    handles.update_button.Enable = "on";
    
    delete(handles.settings_gui);
    %setappdata(0,'evalue',e);
    
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = get(handles.slider1,'Value');
data1 = num2str(data);
set(handles.sensoredfloor,'String',data1);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton_OK.
function pushbutton_OK_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.text7.Enable = "on";
    handles.slider1.Enable = "on";
    handles.sensoredfloor.Enable = "on";
    handles.pushbutton_add.Enable = "on";
    handles.text9.Enable = "on";
    handles.sensored_floors.Enable = "on";
    handles.apply_button.Enable = "on";
    handles.slider1.Max = handles.total_floors;
    handles.slider1.SliderStep = [1/handles.total_floors 3/handles.total_floors];
    
    guidata(hObject, handles);



function sensoredfloor_Callback(hObject, eventdata, handles)
% hObject    handle to sensoredfloor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensoredfloor as text
%        str2double(get(hObject,'String')) returns contents of sensoredfloor as a double
       handles.sensoredfloor = str2double(get(hObject,'String'));
       guidata(hObject, handles);



function floor_height_Callback(hObject, eventdata, handles)
% hObject    handle to floor_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.floor_height = str2double(get(hObject,'String'));
    guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of floor_height as text
%        str2double(get(hObject,'String')) returns contents of floor_height as a double


% --- Executes during object creation, after setting all properties.
function floor_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to floor_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_browse_disp.
function pushbutton_browse_disp_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_browse_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
   [filename, filepath] = uigetfile({'*.*';'*.xls';'*.xlsx';'*.xlsm';'*.txt'}, 'Search For the Displacement File');
   handles.fullname_disp = [filepath filename];
   set(handles.path_disp,'String',handles.fullname_disp);
   guidata(hObject, handles);
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_browse_accNS.
function pushbutton_browse_accNS_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_browse_accNS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
   [filename, filepath] = uigetfile({'*.*';'*.xls';'*.xlsx';'*.xlsm';'*.txt'}, 'Search For the Acceleration File in N-S direction');
   handles.fullname_accNS = [filepath filename];
   set(handles.path_accNS,'String',handles.fullname_accNS);
   guidata(hObject, handles);
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_browse_accWE.
function pushbutton_browse_accWE_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_browse_accWE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
   [filename, filepath] = uigetfile({'*.*';'*.xls';'*.xlsx';'*.xlsm';'*.txt'}, 'Search For the Acceleration File in W-E direction');
   handles.fullname_accWE = [filepath filename];
   set(handles.path_accWE,'String',handles.fullname_accWE);
   guidata(hObject, handles);
% handles    structure with handles and user data (see GUIDATA)



function time_increment_Callback(hObject, eventdata, handles)
% hObject    handle to time_increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.time_increment = str2double(get(hObject,'String'));
    guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of time_increment as text
%        str2double(get(hObject,'String')) returns contents of time_increment as a double


% --- Executes during object creation, after setting all properties.
function time_increment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
