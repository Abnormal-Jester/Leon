function [calib_name,format_image,path_name,first_num] = obtain_valid_file(set_type)
%OBTAIN_VALID_FILE This function obtains the base name and file type of a
%file used in calibration
%   Obtain input names through selecting any image file in the series

valid_file_types = {'*.ras;*.bmp;*.tif;*.pgm;*.ppm;*.jpg;*.jpeg'};

if ~exist('set_type', 'var'),
    set_type = '';
end

dialog_title = ['Choose the first calibration file of the ' set_type ' set'];

valid_file = 0;

while (valid_file==0),
    
    [file_full_name,path_name,filter_index] = uigetfile(valid_file_types,dialog_title,[set_type '1']);
    
    if (filter_index~=2),
        % The user didn't pick a valid file
        valid_file=1;
    else
        % The user picked a valid file or pressed cancel
        fprintf(1,'Please use a valid file type');
    end
        
end

if (filter_index==1),
    [~,temp_name,format_image] = fileparts(file_full_name);
    
    format_image = format_image(2:end);
    
    startIndex = regexp(temp_name,'\d+$');
    
    calib_name = temp_name(1:startIndex-1);
    first_num = str2double(temp_name(startIndex:end));
else
    fprintf(1,'No image selected. Ending Program\n');
end

end

