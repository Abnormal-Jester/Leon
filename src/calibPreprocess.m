generateRequiredVariables;
individualImageRetrieval;

clickCalib;

go_calib_optim

my_saving_calib

save_name = [save_name '.mat'];
if exist('calib_data.mat', 'file'),
    delete calib_data.mat
end
