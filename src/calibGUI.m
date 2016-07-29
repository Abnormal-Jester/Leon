cell_list = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%

if exist('calibGUIWindow', 'var'),
   close (calibGUIWindow);
end

fig_number = 1;

title_figure = 'Camera Calibration Toolbox - Custom Version 1.01';

clear fc cc kc KK
kc = zeros(5,1);
clearwin;

% 1 Enter the manual information
% 2 Automatically detect the checkerboards
% 3 Manually detect the missing checkerboards
% 4 Automatically use the data to generate save files and the ini file

cell_list{1,1} = {'Select image sets','manual.obtainData;'};
cell_list{1,2} = {'Enter Constants','setCalibConstants;'};
cell_list{1,3} = {'Extract Corners','stereoCalibPreprocess;'};

% - Check errors
% - Save current progress
% - Clear
% - Exit

cell_list{2,1} = {'Run stereo calibration','stereoCalib;'};
cell_list{2,2} = {'Clear','clearvars -except calibGUIWindow;'};
cell_list{2,3} = {'Exit','disp(''Bye. To run again, type calib.''); close(calibGUIWindow); clearvars calibGUIWindow;'}; % {'Exit','calib_gui;'};


show_window(cell_list,fig_number,title_figure,130,18,0,'clean',12);
clearvars fig_number title_figure kc cell_list;

assignin('base', 'calibGUIWindow', gcf)

%-------- End editable region -------------%
%-------- End editable region -------------%
