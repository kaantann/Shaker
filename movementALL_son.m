function movementALL_son(handles)
    global slabs

    %obtain data (extracted to the main__gui for the sake of performance)
    point_top = getappdata(0,'point_top');
    point_bottom = getappdata(0,'point_bottom');
    handles.time_data_NS = getappdata(0,'time_data_NS');
    handles.time_data_WE = getappdata(0,'time_data_WE');
    handles.acc_data_NS = getappdata(0,'acc_data_NS');
    handles.acc_data_WE = getappdata(0,'acc_data_WE');
    handles.sensored_floors = getappdata(0,"sensored_floors");
    handles.displacement_data = getappdata(0,'displacement_data');
    handles.floor_height = getappdata(0,'floor_height');
    tracker_line = getappdata(0,'tracker_line');
    head = getappdata(0,'head');
    
    handles.surfaceS = getappdata(0,'surfaceS');
    handles.surfaceN = getappdata(0,'surfaceN');
    handles.surfaceW = getappdata(0,'surfaceW');
    handles.surfaceE = getappdata(0,'surfaceE');
    handles.ceiling = getappdata(0,'ceiling');
    
    handles.surfaceS_topview = getappdata(0,'surfaceS_topview');
    handles.surfaceN_topview = getappdata(0,'surfaceN_topview');
    handles.surfaceW_topview = getappdata(0,'surfaceW_topview');
    handles.surfaceE_topview = getappdata(0,'surfaceE_topview');
    handles.ceiling_topview = getappdata(0,'ceiling_topview');
    
    slabs_animation = getappdata(0,'slabs_animation');
    S_XData = getappdata(0,'S_XData');
    S_YData = getappdata(0,'S_YData');
    N_XData = getappdata(0,'N_XData');
    N_YData = getappdata(0,'N_YData');
    E_XData = getappdata(0,'E_XData');
    E_YData = getappdata(0,'E_YData');
    W_XData = getappdata(0,'W_XData');
    W_YData = getappdata(0,'W_YData');
    ceiling_XData = getappdata(0,'ceiling_XData');
    ceiling_YData = getappdata(0,'ceiling_YData');
    
    %some needed data without need of use getappdata
    number_sensored_floors = length(handles.sensored_floors);
    number_surface = number_sensored_floors-1;
    column_number_disp = size(handles.displacement_data,2);
    
%main for-loop

    for step= 1:column_number_disp
    pause(0.01);
        %1. ACC-TIME GRAPH MOVEMENT
        set(handles.figure1,'CurrentAxes',handles.acceleration_plot_NS)
        [point_top.XData, point_top.YData] = deal(handles.time_data_NS(step),handles.acc_data_NS(step)); 

        set(handles.figure1,'CurrentAxes',handles.acceleration_plot_WE)
        [point_bottom.XData, point_bottom.YData] = deal(handles.time_data_WE(step),handles.acc_data_WE(step)); 

        %2. 3DPLOT MOVEMENT
        set(handles.figure1,'CurrentAxes',handles.threeD_plot)

        for story = 1:number_sensored_floors
            [slabs{story}(1).XData , slabs{story}(1).YData , slabs{story}(2).XData , slabs{story}(2).YData , slabs{story}(3).XData , slabs{story}(3).YData , slabs{story}(4).XData , slabs{story}(4).YData] = deal(slabs_animation{1 + 8*(story-1),step},slabs_animation{2 + 8*(story-1),step}, slabs_animation{3 + 8*(story-1),step},slabs_animation{4 + 8*(story-1),step}, slabs_animation{5 + 8*(story-1),step},slabs_animation{6 + 8*(story-1),step},slabs_animation{7 + 8*(story-1),step},slabs_animation{8 + 8*(story-1),step});
        end

        for story_3d = 1:number_surface
            [handles.surfaceS{story_3d}.XData,handles.surfaceS{story_3d}.YData,handles.surfaceS{story_3d}.CData,handles.surfaceN{story_3d}.XData,handles.surfaceN{story_3d}.YData,handles.surfaceN{story_3d}.CData,handles.surfaceW{story_3d}.XData,handles.surfaceW{story_3d}.YData,handles.surfaceW{story_3d}.CData,handles.surfaceE{story_3d}.XData,handles.surfaceE{story_3d}.YData,handles.surfaceE{story_3d}.CData] = deal(S_XData{story_3d,step},S_YData{story_3d,step},S_YData{story_3d,step},N_XData{story_3d,step},N_YData{story_3d,step},N_YData{story_3d,step}-handles.dimension2,W_XData{story_3d,step},W_YData{story_3d,step},W_XData{story_3d,step}-handles.dimension1,E_XData{story_3d,step},E_YData{story_3d,step},E_XData{story_3d,step});
        end

        set(handles.figure1,'CurrentAxes',handles.topview_plot)
        for story_3d = 1:number_surface
            [handles.surfaceS_topview{story_3d}.XData,handles.surfaceS_topview{story_3d}.YData,handles.surfaceS_topview{story_3d}.CData,handles.surfaceN_topview{story_3d}.XData,handles.surfaceN_topview{story_3d}.YData,handles.surfaceN_topview{story_3d}.CData,handles.surfaceW_topview{story_3d}.XData,handles.surfaceW_topview{story_3d}.YData,handles.surfaceW_topview{story_3d}.CData,handles.surfaceE_topview{story_3d}.XData,handles.surfaceE_topview{story_3d}.YData,handles.surfaceE_topview{story_3d}.CData] = deal(S_XData{story_3d,step},S_YData{story_3d,step},S_YData{story_3d,step},N_XData{story_3d,step},N_YData{story_3d,step},N_YData{story_3d,step}-handles.dimension2,W_XData{story_3d,step},W_YData{story_3d,step},W_XData{story_3d,step}-handles.dimension1,E_XData{story_3d,step},E_YData{story_3d,step},E_XData{story_3d,step});
        end
        [handles.ceiling.XData,handles.ceiling.YData,handles.ceiling_topview.XData, handles.ceiling_topview.YData] = deal(ceiling_XData{step},ceiling_YData{step},ceiling_XData{step},ceiling_YData{step});


        %TRACKER AND HEAD MOVEMENT
        centroid_end = [mean([slabs{end}(1).XData(1),slabs{end}(2).XData(2),slabs{end}(3).XData(1),slabs{end}(4).XData(2)]);
                            mean([slabs{end}(1).YData(1),slabs{end}(2).YData(2),slabs{end}(3).YData(1),slabs{end}(4).YData(2)])];
        delete(head);
        addpoints(tracker_line,centroid_end(1),centroid_end(2),slabs{end}(1).ZData(1));
        head = scatter3(centroid_end(1),centroid_end(2),slabs{end}(1).ZData(1),'filled','MarkerFaceColor','y','MarkerEdgeColor','y');
        drawnow limitrate
    
    
    end
end
%ALGORİTMA NASIL OLMALI
%1. acc-time graphlerindeki noktaların hareketi
%2. 3dplot'un hareketi
%3. topview hareketi ve tracer hareketi.





