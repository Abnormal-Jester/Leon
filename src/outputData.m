save_name = 'Calib_Results_right';
my_saving_calib

save_name = 'Calib_Results_right.mat';
movefile(save_name,[start_folder '\' save_name])
if exist('calib_data.mat', 'file'),
    delete calib_data.mat
end