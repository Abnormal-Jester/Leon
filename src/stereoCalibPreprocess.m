% Set active variables
activeData = colorData;

save_name = 'Calib_Results_right';
% Used to parse the autoImagePoints from the MATLAB toolbox.

calibPreprocess;

% set active variables
activeData = irData

save_name = 'Calib_Results_left';
% Used to parse the autoImagePoints from the MATLAB toolbox.

calibPreprocess;

clear activeData save_name;

reopenGUI;
