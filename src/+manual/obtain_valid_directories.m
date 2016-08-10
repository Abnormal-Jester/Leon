% obtain_valid_directories prompts the user for two image directories and
%   verifies the directories can be used by the calibration program

import manual.*;

try
    [colorDir, irDir] = selectAndValidateAllDir;
catch exception
    clearvars colorDir irDir;
    rethrow(exception);
end
