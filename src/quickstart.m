
currentDir = pwd;

%QUICKSTART

dX_default = 73;
dY_default = dX_default;

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

dX = input(['Size of a side of each square ([]=' num2str(dX_default) 'mm) = ']);
dY = dX;
if isempty(dX), dX = dX_default; end;
if isempty(dY), dY = dY_default; end;

% Obtain input names through selecting any image file in the series
[calib_name,format_image,path_name,first_num] = obtain_valid_file();
cd (path_name);

% Obtain a list of all the images and other various variables
check_directory

% Read the images
ima_read_calib

if exist('my_window', 'var'),
    figure(my_window);
end

cd (currentDir);