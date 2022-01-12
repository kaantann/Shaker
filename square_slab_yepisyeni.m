%% KARE 2D
function square_slab_yepisyeni(dimension1,dimension2,level_there,floor_number_1,handles)
    global slabs
    m = [ 0 0 dimension1 0;
          0 0 0 dimension2;
          dimension1 0 dimension1 dimension2;
          0 dimension2 dimension1 dimension2];
 
    x=[m(:,1) m(:,3)]';
    y=[m(:,2) m(:,4)]';
    z=handles.floor_height * level_there * ones(size(x));
    slabs{floor_number_1} = plot3(handles.threeD_plot,x,y,z,'k','LineWidth',2);
    hold on