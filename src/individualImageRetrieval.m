% The images are retrieved using the original toolbox.

currentDir = pwd;

cd (activeData.mDir);

calib_name = activeData.mPrefix;
format_image = activeData.mType;

% Obtain a list of all the images and other variables.
% Argument variables:
%  - calib_name
%  - format_image
check_directory;

% Read the images
ima_read_calib;

cd (currentDir);

clearvars currentDir;
