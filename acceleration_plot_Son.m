function acceleration_plot_Son(handles)
    
    
    %obtaining data from root
    handles.acc_data_NS = getappdata(0,'acc_data_NS');
    handles.acc_data_WE = getappdata(0,'acc_data_WE');

    %time data
    handles.time_increment = getappdata(0,'time_increment');
    last_time_NS = length(handles.acc_data_NS) * handles.time_increment;
    last_time_WE = length(handles.acc_data_WE) * handles.time_increment;
    
    %time_data_NS = 0:handles.time_increment:last_time_NS;
    %time_data_WE = 0:handles.time_increment:last_time_WE;
    
    time_data_NS = linspace(0,last_time_NS,length(handles.acc_data_NS));
    time_data_WE = linspace(0,last_time_WE,length(handles.acc_data_WE));
    
    %categorizing the data for plotting
    x_NS = time_data_NS; y_NS = handles.acc_data_NS;
    x_WE = time_data_WE; y_WE = handles.acc_data_WE;
    
    
    %selecting correct axes
    set(handles.figure1,'CurrentAxes',handles.acceleration_plot_NS)
    %NS_plot
    plot(x_NS,y_NS);
    hold on
    handles.point_top = scatter(x_NS(1),y_NS(1),'filled','MarkerFaceColor','r','MarkerEdgeColor','r');
    %plot(x_NS(1),y_NS(1),'o','MarkerFaceColor','red');
   
    
   
    %selecting correct axes
    set(handles.figure1,'CurrentAxes',handles.acceleration_plot_WE)
    %WE_plot
    plot(x_WE,y_WE);
    hold on
    handles.point_bottom = scatter(x_WE(1),y_WE(1),'filled','MarkerFaceColor','r','MarkerEdgeColor','r');
    %plot(x_WE(1),y_WE(1),'o','MarkerFaceColor','red');
    
    hold(handles.acceleration_plot_WE,'off');
    
    set(handles.acceleration_plot_WE,'XGrid','On','XMinorGrid','On')
    set(handles.acceleration_plot_NS,'YGrid','On','YMinorGrid','On')
    
    setappdata(0,'point_top',handles.point_top);
    setappdata(0,'point_bottom',handles.point_bottom);
    setappdata(0,'time_data_NS',time_data_NS);
    setappdata(0,'time_data_WE',time_data_WE);
    
    
    
    
    