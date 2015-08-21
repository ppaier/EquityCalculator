function varargout = EquityCalcs(varargin)
% EQUITYCALCS MATLAB code for EquityCalcs.fig
%      EQUITYCALCS, by itself, creates a new EQUITYCALCS or raises the existing
%      singleton*.
%
%      H = EQUITYCALCS returns the handle to a new EQUITYCALCS or the handle to
%      the existing singleton*.
%
%      EQUITYCALCS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EQUITYCALCS.M with the given input arguments.
%
%      EQUITYCALCS('Property','Value',...) creates a new EQUITYCALCS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EquityCalcs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EquityCalcs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EquityCalcs

% Last Modified by GUIDE v2.5 14-Oct-2012 21:24:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @EquityCalcs_OpeningFcn, ...
    'gui_OutputFcn',  @EquityCalcs_OutputFcn, ...
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


% --- Executes just before EquityCalcs is made visible.
function EquityCalcs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EquityCalcs (see VARARGIN)

% Choose default command line output for EquityCalcs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.PMHeroPos,'Value',1);
set(handles.PMHeroPos,'String',{'UTG','MP','CO','BU','SB'});
set(handles.PMVillPos,'Value',1);
set(handles.PMVillPos,'String',{'MP','CO','BU','SB','BB'});
setappdata(handles.PMHeroPos,'CurDir',1);
setappdata(handles.PMVillPos,'CurDir',-1);
SelectProgram( handles );
CalculateValues( handles );
% UIWAIT makes EquityCalcs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EquityCalcs_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in PMProgram.
function PMProgram_Callback(hObject, eventdata, handles)
% hObject    handle to PMProgram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PMProgram contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PMProgram

SelectProgram( handles );
CalculateValues( handles );




% --- Executes during object creation, after setting all properties.
function PMProgram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PMProgram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PMHeroPos.
function PMHeroPos_Callback(hObject, eventdata, handles)
% hObject    handle to PMHeroPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PMHeroPos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PMHeroPos

UpdatePositions( hObject, handles.PMVillPos);
CalculateValues( handles );



% --- Executes during object creation, after setting all properties.
function PMHeroPos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PMHeroPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PMVillPos.
function PMVillPos_Callback(hObject, eventdata, handles)
% hObject    handle to PMVillPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PMVillPos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PMVillPos

UpdatePositions( hObject, handles.PMHeroPos);
CalculateValues( handles );


% --- Executes during object creation, after setting all properties.
function PMVillPos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PMVillPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDStackSize_Callback(hObject, eventdata, handles)
% hObject    handle to EDStackSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDStackSize as text
%        str2double(get(hObject,'String')) returns contents of EDStackSize as a double
CheckIntegrity( handles);
CalculateValues( handles );


% --- Executes during object creation, after setting all properties.
function EDStackSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDStackSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDVillFold_Callback(hObject, eventdata, handles)
% hObject    handle to EDVillFold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDVillFold as text
%        str2double(get(hObject,'String')) returns contents of EDVillFold as a double

CheckIntegrity(handles);
CalculateValues( handles );


% --- Executes during object creation, after setting all properties.
function EDVillFold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDVillFold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDHeroEqu_Callback(hObject, eventdata, handles)
% hObject    handle to EDHeroEqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDHeroEqu as text
%        str2double(get(hObject,'String')) returns contents of EDHeroEqu as a double

CheckIntegrity(handles);
CalculateValues( handles );


% --- Executes during object creation, after setting all properties.
function EDHeroEqu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDHeroEqu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDOpenTo_Callback(hObject, eventdata, handles)
% hObject    handle to EDOpenTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDOpenTo as text
%        str2double(get(hObject,'String')) returns contents of EDOpenTo as a double

CheckIntegrity(handles);
CalculateValues( handles );


% --- Executes during object creation, after setting all properties.
function EDOpenTo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDOpenTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ED3BetTo_Callback(hObject, eventdata, handles)
% hObject    handle to ED3BetTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ED3BetTo as text
%        str2double(get(hObject,'String')) returns contents of ED3BetTo as a double

CheckIntegrity(handles);
CalculateValues( handles );

% --- Executes during object creation, after setting all properties.
function ED3BetTo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ED3BetTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ED4BetTo_Callback(hObject, eventdata, handles)
% hObject    handle to ED4BetTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ED4BetTo as text
%        str2double(get(hObject,'String')) returns contents of ED4BetTo as a double

CheckIntegrity( handles);
CalculateValues( handles );

% --- Executes during object creation, after setting all properties.
function ED4BetTo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ED4BetTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ED5BetTo_Callback(hObject, eventdata, handles)
% hObject    handle to ED5BetTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ED5BetTo as text
%        str2double(get(hObject,'String')) returns contents of ED5BetTo as a double
CheckIntegrity( handles);
CalculateValues( handles );

% --- Executes during object creation, after setting all properties.
function ED5BetTo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ED5BetTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDEv_Callback(hObject, eventdata, handles)
% hObject    handle to EDEv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDEv as text
%        str2double(get(hObject,'String')) returns contents of EDEv as a double
CalculateValues( handles );


% --- Executes during object creation, after setting all properties.
function EDEv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDEv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CBAllin4Bet.
function CBAllin4Bet_Callback(hObject, eventdata, handles)
% hObject    handle to CBAllin4Bet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBAllin4Bet

val = get(hObject,'Value');
if val
    set(handles.EDStackSize,'Enable','on');
    set(handles.EDHeroEqu,'Enable','on');
else
    set(handles.EDStackSize,'Enable','off');
    set(handles.EDHeroEqu,'Enable','off');
end
CalculateValues( handles );

% --- Executes on button press in CBAllin3Bet.
function CBAllin3Bet_Callback(hObject, eventdata, handles)
% hObject    handle to CBAllin3Bet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBAllin3Bet
val = get(hObject,'Value');
if val
    set(handles.EDStackSize,'Enable','on');
    set(handles.EDHeroEqu,'Enable','on');
else
    set(handles.EDStackSize,'Enable','off');
    set(handles.EDHeroEqu,'Enable','off');
end
CalculateValues( handles );

% --- Executes on button press in CBAllin5Bet.
function CBAllin5Bet_Callback(hObject, eventdata, handles)
% hObject    handle to CBAllin5Bet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBAllin5Bet
val = get(hObject,'Value');
if val
    set(handles.EDStackSize,'Enable','on');
    set(handles.EDHeroEqu,'Enable','on');
else
    set(handles.EDStackSize,'Enable','off');
    set(handles.EDHeroEqu,'Enable','off');
end
CalculateValues( handles );

% --- Executes on button press in PBCalc.
function PBCalc_Callback(hObject, eventdata, handles)
% hObject    handle to PBCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

CalculateValues( handles );




function EDBlinds_Callback(hObject, eventdata, handles)
% hObject    handle to EDBlinds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDBlinds as text
%        str2double(get(hObject,'String')) returns contents of EDBlinds as a double


% --- Executes during object creation, after setting all properties.
function EDBlinds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDBlinds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CBBlinds.
function CBBlinds_Callback(hObject, eventdata, handles)
% hObject    handle to CBBlinds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBBlinds
