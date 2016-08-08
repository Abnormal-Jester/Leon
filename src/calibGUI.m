cellList = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%

if exist('calibGUIWindow', 'var'),
    close (calibGUIWindow);
end

figureNumber = 1;

figureTitle = 'Camera Calibration Toolbox - Custom Version 1.01';

clear fc cc kc KK
kc = zeros(5,1);
clearwin;

% 1 Enter the manual information
% 2 Automatically detect the checkerboards
% 3 Manually detect the missing checkerboards
% 4 Automatically use the data to generate save files and the ini file

cellList{1,1} = {'Enter Constants',...
    'run=''manual.obtain_data;'';command_and_reopen;'};
cellList{1,2} = {'Enter Camera Id',...
    'run=''manual.check_and_input_camera_id;'';command_and_reopen;'};
cellList{1,3} = {'Enter Square Size',...
    'run=''manual.check_and_input_square_size;'';command_and_reopen;'};
cellList{1,4} = {'Select Image Directories',...
    'manual.obtain_valid_directories;'};
cellList{1,5} = {'Enter Missing Constants',...
    'run=''manual.obtain_missing_data;'';command_and_reopen;'};

cellList{2,1} = {'Extract Checkerboards','checkerboard.detect_all_checkerboard;'};

cellList{3,1} = {'Run stereo calibration','stereoCalib;'};

% - Check errors
% - Save current progress
% - Clear
% - Exit

cellList{4,1} = {'Save',';'};
cellList{4,2} = {'Clear','clearvars -except calibGUIWindow;'};
cellList{4,3} = {'Exit','disp(''Bye. To run again, type calib.''); close(calibGUIWindow); clearvars calibGUIWindow;'}; % {'Exit','calib_gui;'};

% - Change settings


show_window(cellList,figureNumber,figureTitle,130,18,0,'clean',12);
clearvars figureNumber figureTitle kc cellList;

assignin('base', 'calibGUIWindow', gcf)

%-------- End editable region -------------%
%-------- End editable region -------------%
