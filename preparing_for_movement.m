function preparing_for_movement(handles)
global slabs

    %retrieving data
    handles.dimesion1 = getappdata(0,"dimension1");
    handles.dimesion2 = getappdata(0,"dimension2");
    handles.sensored_floors = getappdata(0,"sensored_floors");
    handles.displacement_data = getappdata(0,'displacement_data');
    
    number_sensored_floors = length(handles.sensored_floors);
    number_surface = number_sensored_floors-1;
    column_number_disp = size(handles.displacement_data,2);

%preallocation
slabs_animation = cell(8*number_sensored_floors,column_number_disp); %her 2 satır, 1 line için X ve Y değerleri; kolonlar ivme değerleri
slabs_animation(:,:) = mat2cell(zeros(8*number_sensored_floors,2*column_number_disp),ones(8*number_sensored_floors,1),2*ones(1,column_number_disp));

i=1;
for story = 1:number_sensored_floors
    
    k1 = slabs{story}(1).XData(1) + handles.displacement_data(1+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k2 = slabs{story}(1).XData(2) + handles.displacement_data(1+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k3 = slabs{story}(1).YData(1) + handles.displacement_data(2+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);
    k4 = slabs{story}(1).YData(2) + handles.displacement_data(2+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);

    a = [k1 k2];
    b = [k3 k4];

    k5 = slabs{story}(2).XData(1) + handles.displacement_data(1+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k6 = slabs{story}(2).XData(2) + handles.displacement_data(1+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k7 = slabs{story}(2).YData(1) + handles.displacement_data(2+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);
    k8 = slabs{story}(2).YData(2) + handles.displacement_data(2+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);

    c = [k5 k6];
    d = [k7 k8];

    k9 =  slabs{story}(3).XData(1) + handles.displacement_data(1+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k10 = slabs{story}(3).XData(2) + handles.displacement_data(1+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k11 = slabs{story}(3).YData(1) + handles.displacement_data(2+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);
    k12 = slabs{story}(3).YData(2) + handles.displacement_data(2+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);

    e = [k9 k10];
    f = [k11 k12];

    k13 = slabs{story}(4).XData(1) + handles.displacement_data(1+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k14 = slabs{story}(4).XData(2) + handles.displacement_data(1+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension2/2);
    k15 = slabs{story}(4).YData(1) + handles.displacement_data(2+3*(i-1),1) - sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);
    k16 = slabs{story}(4).YData(2) + handles.displacement_data(2+3*(i-1),1) + sind(handles.displacement_data(3+3*(i-1),1)) * (handles.dimension1/2);

    g = [k13 k14];
    h = [k15 k16];

    slabs_animation{1 + 8*(i-1),1} =  a; %1-X
    slabs_animation{2 + 8*(i-1),1} =  b; %1-Y
    slabs_animation{3 + 8*(i-1),1} =  c; %2-X
    slabs_animation{4 + 8*(i-1),1} =  d; %2-Y
    slabs_animation{5 + 8*(i-1),1} =  e; %3-X
    slabs_animation{6 + 8*(i-1),1} =  f; %3-Y
    slabs_animation{7 + 8*(i-1),1} =  g; %4-X
    slabs_animation{8 + 8*(i-1),1} =  h; %4-Y

    i=i+1;
    
end

% slabs_animation(:,2:end) = mat2cell(zeros(8*number_sensored_floors,2*column_number_disp),ones(8*number_sensored_floors,1),2*ones(1,column_number_disp));

S_XData = cell(number_surface,column_number_disp); %satırlar katlar arası surface, kolonlar ivme değerleri
S_YData = cell(number_surface,column_number_disp);

S_XData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));
S_YData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));

N_XData = cell(number_surface,column_number_disp);
N_YData = cell(number_surface,column_number_disp);

N_XData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));
N_YData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));

E_XData = cell(number_surface,column_number_disp);
E_YData = cell(number_surface,column_number_disp);

E_XData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));
E_YData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));

W_XData = cell(number_surface,column_number_disp);
W_YData = cell(number_surface,column_number_disp);

W_XData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));
W_YData(:,:) = mat2cell(zeros(2*number_surface,2*column_number_disp),2*ones(number_surface,1),2*ones(1,column_number_disp));

ceiling_XData = cell(1,column_number_disp);
ceiling_YData = cell(1,column_number_disp);

ceiling_XData(:,:) = mat2cell(zeros(1,2*column_number_disp),ones(1,1),2*ones(1,column_number_disp));
ceiling_YData(:,:) = mat2cell(zeros(1,2*column_number_disp),ones(1,1),2*ones(1,column_number_disp));

% slab line noktalarının her ivme(step) değeri için son pozisyonları ayarlama 
for step = 2:column_number_disp
    for story = 1:number_sensored_floors
        slabs_animation{1 + 8*(story-1),step}(1) = slabs_animation{1 + 8*(story-1),step-1}(1) + handles.displacement_data(1 + 3*(story-1) ,step) + (sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2));
        slabs_animation{1 + 8*(story-1),step}(2) = slabs_animation{1 + 8*(story-1),step-1}(2) + handles.displacement_data(1 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{2 + 8*(story-1),step}(1) = slabs_animation{2 + 8*(story-1),step-1}(1) + handles.displacement_data(2 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);
        slabs_animation{2 + 8*(story-1),step}(2) = slabs_animation{2 + 8*(story-1),step-1}(2) + handles.displacement_data(2 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);

        slabs_animation{3 + 8*(story-1),step}(1) = slabs_animation{3 + 8*(story-1),step-1}(1) + handles.displacement_data(1 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{3 + 8*(story-1),step}(2) = slabs_animation{3 + 8*(story-1),step-1}(2) + handles.displacement_data(1 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{4 + 8*(story-1),step}(1) = slabs_animation{4 + 8*(story-1),step-1}(1) + handles.displacement_data(2 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);
        slabs_animation{4 + 8*(story-1),step}(2) = slabs_animation{4 + 8*(story-1),step-1}(2) + handles.displacement_data(2 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);

        slabs_animation{5 + 8*(story-1),step}(1) = slabs_animation{5 + 8*(story-1),step-1}(1) + handles.displacement_data(1 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{5 + 8*(story-1),step}(2) = slabs_animation{5 + 8*(story-1),step-1}(2) + handles.displacement_data(1 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{6 + 8*(story-1),step}(1) = slabs_animation{6 + 8*(story-1),step-1}(1) + handles.displacement_data(2 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);
        slabs_animation{6 + 8*(story-1),step}(2) = slabs_animation{6 + 8*(story-1),step-1}(2) + handles.displacement_data(2 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);

        slabs_animation{7 + 8*(story-1),step}(1) = slabs_animation{7 + 8*(story-1),step-1}(1) + handles.displacement_data(1 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{7 + 8*(story-1),step}(2) = slabs_animation{7 + 8*(story-1),step-1}(2) + handles.displacement_data(1 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension2/2);
        slabs_animation{8 + 8*(story-1),step}(1) = slabs_animation{8 + 8*(story-1),step-1}(1) + handles.displacement_data(2 + 3*(story-1) ,step) - sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);
        slabs_animation{8 + 8*(story-1),step}(2) = slabs_animation{8 + 8*(story-1),step-1}(2) + handles.displacement_data(2 + 3*(story-1) ,step) + sind(handles.displacement_data(3 + 3*(story-1) ,step)) * (handles.dimension1/2);
    end
end

%surface location datasının her ivme için oluşturulması
for step = 1:column_number_disp
    for story_3d = 1:number_surface
        S_XData{story_3d,step} = [slabs_animation{1+8*(story_3d-1),step}(1)  slabs_animation{5+8*(story_3d-1),step}(1) ; slabs_animation{1+8*(story_3d),step}(1)  slabs_animation{5+8*(story_3d),step}(1)]; 
        S_YData{story_3d,step} = [slabs_animation{2+8*(story_3d-1),step}(1)  slabs_animation{6+8*(story_3d-1),step}(1) ; slabs_animation{2+8*(story_3d),step}(1)  slabs_animation{6+8*(story_3d),step}(1)]; 

        N_XData{story_3d,step} = [slabs_animation{3+8*(story_3d-1),step}(2)  slabs_animation{7+8*(story_3d-1),step}(2) ; slabs_animation{3+8*(story_3d),step}(2)  slabs_animation{7+8*(story_3d),step}(2)]; 
        N_YData{story_3d,step} = [slabs_animation{4+8*(story_3d-1),step}(2)  slabs_animation{8+8*(story_3d-1),step}(2) ; slabs_animation{4+8*(story_3d),step}(2)  slabs_animation{8+8*(story_3d),step}(2)]; 

        E_XData{story_3d,step} = [slabs_animation{1+8*(story_3d-1),step}(1)  slabs_animation{3+8*(story_3d-1),step}(2) ; slabs_animation{1+8*(story_3d),step}(1)  slabs_animation{3+8*(story_3d),step}(2)]; 
        E_YData{story_3d,step} = [slabs_animation{2+8*(story_3d-1),step}(1)  slabs_animation{4+8*(story_3d-1),step}(2) ; slabs_animation{2+8*(story_3d),step}(1)  slabs_animation{4+8*(story_3d),step}(2)]; 

        W_XData{story_3d,step} = [slabs_animation{5+8*(story_3d-1),step}(1)  slabs_animation{7+8*(story_3d-1),step}(2) ; slabs_animation{5+8*(story_3d),step}(1)  slabs_animation{7+8*(story_3d),step}(2)]; 
        W_YData{story_3d,step} = [slabs_animation{6+8*(story_3d-1),step}(1)  slabs_animation{8+8*(story_3d-1),step}(2) ; slabs_animation{6+8*(story_3d),step}(1)  slabs_animation{8+8*(story_3d),step}(2)]; 
    end
    ceiling_XData{step} = [slabs_animation{end-7,step}(1)  slabs_animation{end-5,step}(2); slabs_animation{end-3,step}(1) slabs_animation{end-1,step}(2)];
    ceiling_YData{step} = [slabs_animation{end-6,step}(1)  slabs_animation{end-4,step}(2); slabs_animation{end-2,step}(1) slabs_animation{end,step}(2)];
end

setappdata(0,'slabs_animation',slabs_animation);
setappdata(0,'S_XData',S_XData);
setappdata(0,'S_YData',S_YData);
setappdata(0,'N_XData',N_XData);
setappdata(0,'N_YData',N_YData);
setappdata(0,'E_XData',E_XData);
setappdata(0,'E_YData',E_YData);
setappdata(0,'W_XData',W_XData);
setappdata(0,'W_YData',W_YData);
setappdata(0,'ceiling_XData',ceiling_XData);
setappdata(0,'ceiling_YData',ceiling_YData);
end