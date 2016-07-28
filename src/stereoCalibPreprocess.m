% Set active variables
activeImageDir = colorDir;
activeImageSet = colorImages;
save_name = 'Calib_Results_right';
% Used to parse the autoImagePoints from the MATLAB toolbox.
activeImageSetNum = 1;

calibPreprocess;

% set active variables
activeImageDir = irDir;
activeImageSet = irImages;
save_name = 'Calib_Results_left';
% Used to parse the autoImagePoints from the MATLAB toolbox.
activeImageSetNum = 2;

calibPreprocess;

reopenGUI;
