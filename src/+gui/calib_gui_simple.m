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

figureTitle = 'Camera Calibration Toolbox (simple)- Custom Version 1.04';

clear fc cc kc KK
kc = zeros(5,1);


cellList{1,1} = {'1 Constants',...
    'run=''manual.obtain_data;'';command_and_reopen;'};
cellList{1,2} = {'2 Checkerboards','checkerboard.detect_all_checkerboard;'};
cellList{1,3} = {'3 Calibration',...
    'run=''stereo.stereo_calib;'';command_and_reopen;'};

cellList{2,1} = {'Missing Constants',...
'run=''manual.obtain_missing_data;'';command_and_reopen;'};
% cellList{2,2} = {'View Checkerboards','viewer.viewerGui;'};
cellList{2,2} = {'View Checkerboards','viewer.view_checkerboard;'};
cellList{2,3} = {'Save Workspace','save_calib_data'};

cellList{3,1} = {'Reprojection Errors','error.reprojection'};
cellList{3,2} = {'Estimation Errors','error.estimation'};

cellList{4,1} = {'Robust View','gui.calib_gui;'};
cellList{4,2} = {'Clear','clearvars -except calibGuiWindow;'};
cellList{4,3} = {'Exit','disp(''Bye. To run again, type calib.''); close(calibGuiWindow); clearvars calibGuiWindow;'};

% cellList{5,3} = {'Special Calib', 'optimize;'};


calibToolbox.show_window(cellList,figureNumber,figureTitle,130,18,0,'clean',12);
clearvars figureNumber figureTitle kc cellList;

assignin('base', 'calibGuiWindow', gcf),

%-------- End editable region -------------%
%-------- End editable region -------------%
