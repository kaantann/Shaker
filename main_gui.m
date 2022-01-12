function varargout = main_gui(varargin)
% MAIN_GUI MATLAB code for main_gui.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_gui

% Last Modified by GUIDE v2.5 29-Dec-2021 23:50:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_gui_OutputFcn, ...
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


% --- Executes just before main_gui is made visible.
function main_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_gui (see VARARGIN)

% Choose default command line output for main_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in settings_button.
function settings_button_Callback(hObject, eventdata, handles)
% hObject    handle to settings_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
setappdata(0,'update_button',handles.update_button);
settings_gui;
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in update_button.
function update_button_Callback(hObject, eventdata, handles)
% hObject    handle to update_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
cla(handles.topview_plot,'reset')
cla(handles.threeD_plot,'reset')
cla(handles.acceleration_plot_NS,'reset')

handles.dimension1 = getappdata(0,"dimension1");
handles.dimension2 = getappdata(0,"dimension2");

%3dplot update
Main_Son(handles);
creation_surfaces_threeD(handles);

%topview plot and tracker update
creation_surfaces_and_tracker_topview(handles);


%acceleration plots update
acceleration_plot_Son(handles);

%preparing movement data
preparing_for_movement(handles);

%start button enabling
handles.start_button.Enable = "on";
guidata(hObject, handles);
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

movementALL_son(handles)
guidata(hObject, handles);
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function threeD_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threeD_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate threeD_plot


% --- Executes during object creation, after setting all properties.
function topview_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to topview_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
%set(handles.figure4,'CurrentAxes',handles.topwiev_plot)
guidata(hObject, handles);
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate topview_plot


% --- Executes during object creation, after setting all properties.
function acceleration_plot_NS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acceleration_plot_NS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate acceleration_plot_NS


% --- Executes during object creation, after setting all properties.
function acceleration_plot_WE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acceleration_plot_WE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate acceleration_plot_WE
