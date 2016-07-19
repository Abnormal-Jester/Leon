
currentDir = pwd;

% Obtain input names through selecting any image file in the series

cd (activeImageDir);

file_full_name = char(activeImageSet.ImageLocation(1, 1));

[~,temp_name,format_image] = fileparts(file_full_name);

format_image = format_image(2:end);

startIndex = regexp(temp_name,'\d+$');

calib_name = temp_name(1:startIndex-1);
first_num = str2double(temp_name(startIndex:end));



% Obtain a list of all the images and other various variables
check_directory

% Read the images
ima_read_calib

if exist('my_window', 'var'),
    figure(my_window);
end

cd (currentDir);