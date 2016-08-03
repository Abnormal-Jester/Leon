% obtain_valid_directories

try
    [colorDir, irDir] = selectAndValidateAllDir;
catch e
    disp(e);
    clearvars inputCameraId inputSquareSize colorDir irDir e;
end

check_constants_obtained
