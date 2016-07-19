
if complete_auto,
    fprintf(1,'WARNING: Automatic mode is less accurate than Hybrid mode.\n');
end

start_folder = pwd;

% Size of squares
dX_default = 30;
dY_default = 30;
commandwindow;
dX = input(['Size of a side of each square ([]=' num2str(dX_default) 'mm) = ']);
dY = dX;
if isempty(dX), dX = dX_default; end;
if isempty(dY), dY = dY_default; end;

% Obtain input names through selecting any image file in the series
[calib_name,format_image,path_name] = obtain_valid_file('RGB ');

% Obtain input names through selecting any image file in the series
[temp_calib_name,temp_format_image,temp_path_name] = obtain_valid_file('IR ');

cd (path_name);

% Obtain a list of all the images and other various variables
check_directory

% Read the images
ima_read_calib

dont_ask = 1;
my_click_calib;

go_calib_optim

save_name = 'Calib_Results_right';
my_saving_calib

save_name = 'Calib_Results_right.mat';
movefile(save_name,[start_folder '\' save_name])
if exist('calib_data.mat', 'file'),
    delete calib_data.mat
end

fprintf(1,'RGB Done\n');

fprintf(1,'Starting IR...\n');

calib_name = temp_calib_name;
format_image = temp_format_image;
path_name = temp_path_name;

cd (path_name);

% Obtain a list of all the images and other various variables
check_directory

% Read the images
ima_read_calib

my_click_calib;

go_calib_optim

save_name = 'Calib_Results_left';
my_saving_calib

save_name = 'Calib_Results_left.mat';
movefile(save_name,[start_folder '\' save_name])
if exist('calib_data.mat', 'file'),
    delete calib_data.mat
end

fprintf(1,'\nIR Done');

cd(start_folder);

my_load_stereo_calib_files

go_calib_stereo

generate_ini

fprintf(1,'done.\n');