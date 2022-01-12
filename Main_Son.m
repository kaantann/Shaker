
function Main_Son(handles)
set(handles.figure1,'CurrentAxes',handles.threeD_plot);
handles.dimension1 = getappdata(0,"dimension1");
handles.dimension2 = getappdata(0,"dimension2");
handles.total_floors = getappdata(0,"total_floors");
handles.floor_height = getappdata(0,"floor_height");


handles.sensored_floors = getappdata(0,"sensored_floors"); 
%number_surface = length(sensored_floors)-1;

global slabs
slabs = cell(1,length(handles.sensored_floors)); %preallocation

length_sensored_floors = length(handles.sensored_floors);
for floor_number = 1:length_sensored_floors
    square_slab_yepisyeni(handles.dimension1,handles.dimension2,handles.sensored_floors(floor_number),floor_number,handles); % creating slabs
end
axis([handles.dimension1/2-20 handles.dimension1/2+20 handles.dimension2/2-20 handles.dimension2/2+20])
hold on

view([-17 15]) %arranging the position of observer to generate a nice view

colormap jet
colorbar('southoutside') %positioning of the colorbar
caxis([-3 3]) %limits of the colorbar
lighting gouraud

set(gca,'Visible','off');
fig1 = gcf;
fig1.MenuBar = 'none';
fig1.ToolBar = 'none'; %at the end, this will be changed to 'none'


%rotate(slabs{1},[0;0;1],19,[dimension1/2,dimension2/2,3]) %rotating function


%surfaces_Yeni; %creating surfaces
%sine_movement; %sine movement of the building

