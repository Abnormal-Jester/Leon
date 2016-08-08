% ensure_constants_obtained Check if all the constants the calibration software
% requires are set and obtain the missing data if the constants are not set.

import manual.*;

fprintf('Checking for constants...\n');

check_constants_obtained;

if ~constantsObtained
    fprintf('Constants not found.\n\n');

    obtain_missing_data;

    if ~constantsObtained
        error('Failed to obtain missing data.');
    end
end

fprintf('Constants found.\n\n');
