function creation_surfaces_and_tracker_topview(handles)
global slabs
%choosing correct axis
set(handles.figure1,'CurrentAxes',handles.topview_plot);
colormap jet
caxis([-3 3]);

%obtaining necessary values from root
handles.dimension1 = getappdata(0,"dimension1");
handles.dimension2 = getappdata(0,"dimension2");
handles.sensored_floors = getappdata(0,"sensored_floors"); 
handles.floor_height = getappdata(0,"floor_height");
number_surface = length(handles.sensored_floors)-1;

%preallocation
handles.surfaceS_topview = cell(number_surface,1);
handles.surfaceN_topview = cell(number_surface,1);
handles.surfaceW_topview = cell(number_surface,1);
handles.surfaceE_topview = cell(number_surface,1);

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
    hold(handles.topview_plot,'on')
    handles.surfaceS_topview{story} = surf(handles.topview_plot,S.XData,S.YData,z,S.YData,'FaceColor','interp','EdgeColor','none'); 
    handles.surfaceN_topview{story} = surf(handles.topview_plot,N.XData,N.YData,z,N.YData,'FaceColor','interp','EdgeColor','none'); 
    handles.surfaceW_topview{story} = surf(handles.topview_plot,W.XData,W.YData,z,W.YData,'FaceColor','interp','EdgeColor','none'); 
    handles.surfaceE_topview{story} = surf(handles.topview_plot,E.XData,E.YData,z,E.YData,'FaceColor','interp','EdgeColor','none'); 

    %editing color data
    handles.surfaceN_topview{story}.CData = handles.surfaceN_topview{story}.CData - handles.dimension2; 
    handles.surfaceE_topview{story}.CData = E.XData;                                            
    handles.surfaceW_topview{story}.CData = W.XData - handles.dimension1;                       
end

%arrangement of ceiling surface
top_area.XData = [slabs{end}(1).XData(1)  slabs{end}(2).XData(2) ; slabs{end}(3).XData(1)  slabs{end}(4).XData(2)];
top_area.YData = [slabs{end}(1).YData(1)  slabs{end}(2).YData(2) ; slabs{end}(3).YData(1)  slabs{end}(4).YData(2)];
top_area.ZData = [slabs{end}(1).ZData(1)  slabs{end}(2).ZData(2) ; slabs{end}(3).ZData(1)  slabs{end}(4).ZData(2)];
top_area.CData =  -10 * ones(size(top_area.XData));

%creating top_area surface(ceiling)
%handles.ceiling_topview = cell(1,1);
handles.ceiling_topview = surf(handles.topview_plot,top_area.XData,top_area.YData,top_area.ZData,top_area.CData,'FaceColor','interp','EdgeColor','none');

%saving surfaces into root
setappdata(0,'surfaceS_topview',handles.surfaceS_topview);
setappdata(0,'surfaceN_topview',handles.surfaceN_topview);
setappdata(0,'surfaceW_topview',handles.surfaceW_topview);
setappdata(0,'surfaceE_topview',handles.surfaceE_topview);
setappdata(0,'ceiling_topview',handles.ceiling_topview);




%arrangement of view
axis([handles.dimension1/2-20 handles.dimension1/2+20 handles.dimension2/2-20 handles.dimension2/2+20])
set(handles.topview_plot,'XTick',-50:5:50)
set(handles.topview_plot,'YTick',-50:5:50)
view([0,90])

%tracer and tracker_line defined
%set(handles.figure1,'CurrentAxes',handles.topview_plot)
hold on
centroid = [mean([slabs{end}(1).XData(1),slabs{end}(2).XData(2),slabs{end}(3).XData(1),slabs{end}(4).XData(2)]);
          mean([slabs{end}(1).YData(1),slabs{end}(2).YData(2),slabs{end}(3).YData(1),slabs{end}(4).YData(2)])];
      
head = scatter3(centroid(1),centroid(2),slabs{end}(1).ZData(1),'filled','MarkerFaceColor','y','MarkerEdgeColor','y');
tracker_line = animatedline(centroid(1),centroid(2),slabs{end}(1).ZData(1),'Color','r');

set(handles.topview_plot,'XGrid','On','XMinorGrid','On')
set(handles.topview_plot,'YGrid','On','YMinorGrid','On')

%saving surfaces into root
setappdata(0,'surfaceS_topview',handles.surfaceS_topview);
setappdata(0,'surfaceN_topview',handles.surfaceN_topview);
setappdata(0,'surfaceW_topview',handles.surfaceW_topview);
setappdata(0,'surfaceE_topview',handles.surfaceE_topview);
setappdata(0,'ceiling_topview',handles.ceiling_topview);
setappdata(0,'tracker_line',tracker_line);
setappdata(0,'head',head);