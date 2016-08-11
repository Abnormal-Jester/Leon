cellList = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%

if exist('calibGuiWindow', 'var'),
    if isempty(calibGuiWindow)
        if ishandle(calibGuiWindow)
            close(calibGuiWindow);
        end
    end
    clearvars calibGuiWindow;
end

figureNumber = 1;

figureTitle = 'Camera Calibration Toolbox - Custom Version 1.04';

clear fc cc kc KK
kc = zeros(5,1);

% Enter all constants, individual constants, or all missing constants

cellList{1,1} = {'1 Constants',...
    'run=''manual.obtain_data;'';command_and_reopen;'};
cellList{1,2} = {'Enter Camera Id',...
    'run=''manual.check_and_input_camera_id;'';command_and_reopen;'};
cellList{1,3} = {'Enter Square Size',...
    'run=''manual.check_and_input_square_size;'';command_and_reopen;'};
cellList{1,4} = {'Select Image Dirs',...
    'manual.obtain_valid_directories;'};
cellList{1,5} = {'Missing Constants',...
    'run=''manual.obtain_missing_data;'';command_and_reopen;'};

% Find all of the checkerboards, run an individual part of the process, or
% open the view GUI

cellList{2,1} = {'2 Checkerboards','checkerboard.detect_all_checkerboard;'};
cellList{2,2} = {'Create Image Sets','checkerboard.create_all_image_set;'};
cellList{2,3} = {'Automatic Detection','checkerboard.check_and_auto_detection;'};
cellList{2,4} = {'Manual Detection','checkerboard.check_and_manual_detection;'};
% cellList{2,5} = {'View Checkerboards','viewer.viewerGui;'};
cellList{2,5} = {'View Checkerboards','viewer.view_checkerboard;'};


cellList{3,1} = {'3 Calibration',...
    'run=''stereo.stereo_calib;'';command_and_reopen;'};
cellList{3,2} = {'Core Points',...
    'run=''stereo.generate_core_point_array_pair;'';command_and_reopen;'};
cellList{3,3} = {'Estimate Parameters','stereo.estimate_stereo_parameters;'};
cellList{3,4} = {'Generate .ini','stereo.generate_ini;'};
cellList{3,5} = {'Save Workspace','save_calib_data;'};

% Check errors
% Save current progress
% Simple gui
% Clear
% Exit

cellList{4,1} = {'Reprojection Errors','error.reprojection;'};
cellList{4,2} = {'Estimation Errors','error.estimation;'};

cellList{4,3} = {'Simple View','gui.calib_gui_simple;'};
cellList{4,4} = {'Clear','clearvars -except calibGuiWindow;'};
cellList{4,5} = {'Exit','disp(''Bye. To run again, type calib.''); close(calibGuiWindow); clearvars calibGuiWindow;'};


% cellList{5,5} = {'Special calib', 'optimize;'};


calibToolbox.show_window(cellList,figureNumber,figureTitle,130,18,0,'clean',12);
clearvars figureNumber figureTitle kc cellList;

assignin('base', 'calibGuiWindow', gcf),

%-------- End editable region -------------%
%-------- End editable region -------------%
