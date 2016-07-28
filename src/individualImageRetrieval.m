
currentDir = pwd;

cd (activeImageDir);

% Obtain a list of all the images and other variables.
% Argument variables:
%  - calib_name
%  - format_image
check_directory

% Read the images
ima_read_calib

cd (currentDir);
