% detect_all_checkerboard Try to automatically detect the checkerboards and
% manually fill in the missing checkerboards

import checkerboard.*;

fprintf('Checking for constants...\n');

if ~constantsObtained
    fprintf('Constants not found.\n\n');

    obtain_missing_data;

    if ~constantsObtained
        error('Failed to obtain missing data.');
    end
end

fprintf('Constants found.\n\n');


fprintf('Running automatic checkerboard detection...\n');

% Create the image sets
colorImageSet = imageSet(colorDir);
irImageSet = imageSet(irDir);

[colorData, irData, boardData] = automaticCheckerboardDetection (...
    colorImageSet, irImageSet);

fprintf('Automatic checkerboard detection finished.\n\n');


fprintf('Manual checkerboard detection...\n\n');

[colorData, irData, boardData] = manualCheckerboardDetection (colorData, irData, boardData);

fprintf('Manual checkerboard detection finished.\n\n');
