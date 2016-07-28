cell_list = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%


fig_number = 1;

title_figure = 'Camera Calibration Toolbox - Custom Version 1.01';

clear fc cc kc KK
kc = zeros(5,1);
clearwin;
dont_ask=1;

cell_list{1,1} = {'Select image sets','imageSetExtraction;'};
cell_list{1,2} = {'Enter Constants','setConstants;'};
cell_list{1,3} = {'Extract Corners','extractProcess;'};

cell_list{2,1} = {'Run stereo calibration','calibStereo;'};
cell_list{2,2} = {'Clear','clear;'};

cell_list{2,3} = {'Exit',['disp(''Bye. To run again, type calib.''); close(' num2str(fig_number) '); clearvars my_window;']}; %{'Exit','calib_gui;'};




show_window(cell_list,fig_number,title_figure,130,18,0,'clean',12);

%-------- End editable region -------------%
%-------- End editable region -------------%
