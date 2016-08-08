% obtain_valid_directories prompts the user for two image directories and
%   verifies the directories can be used by the calibration program

try
    [colorDir, irDir] = selectAndValidateAllDir;
catch exception
    fprintf(2, getReport(exception));
    clearvars colorDir irDir;
end
