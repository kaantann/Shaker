function creation_surfaces_threeD(handles)
%choosing correct axis
set(handles.figure1,'CurrentAxes',handles.threeD_plot);

%obtaining necessary values from root
handles.dimension1 = getappdata(0,"dimension1");
handles.dimension2 = getappdata(0,"dimension2");
handles.sensored_floors = getappdata(0,"sensored_floors"); 
handles.floor_height = getappdata(0,"floor_height");
number_surface = length(handles.sensored_floors)-1;

%preallocation
handles.surfaceS = cell(number_surface,1);
handles.surfaceN = cell(number_surface,1);
handles.surfaceW = cell(number_surface,1);
handles.surfaceE = cell(number_surface,1);

%calling slabs
global slabs

for story = 1:number_surface
    
    %creating data matrices
    S.XData = [slabs{story}(1).XData(1)  slabs{story}(3).XData(1) ; slabs{story+1}(1).XData(1)  slabs{story+1}(3).XData(1)]; 
    S.YData = [slabs{story}(1).YData(1)  slabs{story}(3).YData(1) ; slabs{story+1}(1).YData(1)  slabs{story+1}(3).YData(1)]; 

    N.XData = [slabs{story}(2).XData(2)  slabs{story}(4).XData(2) ; slabs{story+1}(2).XData(2)  slabs{story+1}(4).XData(2)]; 
    N.YData = [slabs{story}(2).YData(2)  slabs{story}(4).YData(2) ; slabs{story+1}(2).YData(2)  slabs{story+1}(4).YData(2)]; 

    E.XData = [slabs{story}(1).XData(1)  slabs{story}(2).XData(2) ; slabs{story+1}(1).XData(1)  slabs{story+1}(2).XData(2)]; 
    E.YData = [slabs{story}(1).YData(1)  slabs{story}(2).YData(2) ; slabs{story+1}(1).YData(1)  slabs{story+1}(2).YData(2)]; 

    W.XData = [slabs{story}(3).XData(1)  slabs{story}(4).XData(2) ; slabs{story+1}(3).XData(1)  slabs{story+1}(4).XData(2)]; 
    W.YData = [slabs{story}(3).YData(1)  slabs{story}(4).YData(2) ; slabs{story+1}(3).YData(1)  slabs{story+1}(4).YData(2)]; 

    %defining height
    z = [handles.sensored_floors(story) handles.sensored_floors(story) ; handles.sensored_floors(story+1) handles.sensored_floors(story+1)] .* handles.floor_height;

    %creating surfaces
    hold(handles.threeD_plot,'on')
    handles.surfaceS{story} = surf(handles.threeD_plot,S.XData,S.YData,z,S.YData,'FaceColor','interp','EdgeColor','none'); 
    handles.surfaceN{story} = surf(handles.threeD_plot,N.XData,N.YData,z,N.YData,'FaceColor','interp','EdgeColor','none'); 
    handles.surfaceW{story} = surf(handles.threeD_plot,W.XData,W.YData,z,W.YData,'FaceColor','interp','EdgeColor','none'); 
    handles.surfaceE{story} = surf(handles.threeD_plot,E.XData,E.YData,z,E.YData,'FaceColor','interp','EdgeColor','none'); 

    %editing color data
    handles.surfaceN{story}.CData = handles.surfaceN{story}.CData - handles.dimension2; 
    handles.surfaceE{story}.CData = E.XData;                                            
    handles.surfaceW{story}.CData = W.XData - handles.dimension1;                       
end

%arrangement of ceiling surface
top_area.XData = [slabs{end}(1).XData(1)  slabs{end}(2).XData(2) ; slabs{end}(3).XData(1)  slabs{end}(4).XData(2)];
top_area.YData = [slabs{end}(1).YData(1)  slabs{end}(2).YData(2) ; slabs{end}(3).YData(1)  slabs{end}(4).YData(2)];
top_area.ZData = [slabs{end}(1).ZData(1)  slabs{end}(2).ZData(2) ; slabs{end}(3).ZData(1)  slabs{end}(4).ZData(2)];
top_area.CData =  -10 * ones(size(top_area.XData));

%creating top_area surface(ceiling)
%handles.ceiling = cell(1,1);
handles.ceiling = surf(handles.threeD_plot,top_area.XData,top_area.YData,top_area.ZData,top_area.CData,'FaceColor','interp','EdgeColor','none');

%saving surfaces into root
setappdata(0,'surfaceS',handles.surfaceS);
setappdata(0,'surfaceN',handles.surfaceN);
setappdata(0,'surfaceW',handles.surfaceW);
setappdata(0,'surfaceE',handles.surfaceE);
setappdata(0,'ceiling',handles.ceiling);

