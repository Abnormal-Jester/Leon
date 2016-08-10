cellList = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%

if exist('calibGuiWindow', 'var'),
    clearvars calibGuiWindow;
end

figureNumber = 1;

figureTitle = 'Camera Calibration Toolbox - Custom Version 1.02';

clear fc cc kc KK
kc = zeros(5,1);

% Enter all constants, individual constants, or all missing constants

cellList{1,1} = {'Enter Constants',...
    'run=''manual.obtain_data;'';command_and_reopen;'};
cellList{1,2} = {'Enter Camera Id',...
    'run=''manual.check_and_input_camera_id;'';command_and_reopen;'};
cellList{1,3} = {'Enter Square Size',...
    'run=''manual.check_and_input_square_size;'';command_and_reopen;'};
cellList{1,4} = {'Select Image Dirs',...
    'manual.obtain_valid_directories;'};
cellList{1,5} = {'Enter Missing Constants',...
    'run=''manual.obtain_missing_data;'';command_and_reopen;'};

% Find all of the checkerboards, run an individual part of the process, or
% open the view GUI

cellList{2,1} = {'Extract Checkerboards','checkerboard.detect_all_checkerboard;'};
cellList{2,2} = {'Create Image Sets','checkerboard.create_all_image_set;'};
cellList{2,3} = {'Automatic Detection','checkerboard.check_and_auto_detection;'};
cellList{2,4} = {'Manual Detection','checkerboard.check_and_manual_detection;'};
cellList{2,5} = {'View Checkerboards','viewer.viewerGui;'};


cellList{3,1} = {'Run stereo calibration','stereoCalib;'};

% - Check errors
% - Save current progress
% - Clear
% - Exit

cellList{4,1} = {'Save',';'};
cellList{4,2} = {'Clear','clearvars -except calibGuiWindow;'};
cellList{4,3} = {'Exit','disp(''Bye. To run again, type calib.''); close(calibGuiWindow); clearvars calibGuiWindow;'}; % {'Exit','calib_gui;'};

% - Change settings


calibToolbox.show_window(cellList,figureNumber,figureTitle,130,18,0,'clean',12);
clearvars figureNumber figureTitle kc cellList;

assignin('base', 'calibGuiWindow', gcf),

%-------- End editable region -------------%
%-------- End editable region -------------%
