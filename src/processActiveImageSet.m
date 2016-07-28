
currentDir = pwd;

% Obtain input names through selecting any image file in the series

cd (activeImageDir);

fileName = char(activeImageSet.ImageLocation(1, 1));
[calib_name, format_image] = soloImageExtraction (fileName);

% Obtain a list of all the images and other variables.
% Required variables:
%  - calib_name
%  - format_image
check_directory

% Read the images
ima_read_calib

reopenGUI

cd (currentDir);
