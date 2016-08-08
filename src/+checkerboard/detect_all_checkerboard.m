% detect_all_checkerboard Try to automatically detect the checkerboards and
% manually fill in the missing checkerboards

import checkerboard.*;

manual.ensure_constants_obtained;


% Create the image sets
colorImageSet = imageSet(colorDir);
irImageSet = imageSet(irDir);


fprintf('Running automatic checkerboard detection...\n');

[colorData, irData, boardData] = automaticCheckerboardDetection (...
    colorImageSet, irImageSet);

fprintf('Automatic checkerboard detection finished.\n\n');


fprintf('Running manual checkerboard detection...\n');

[colorData, irData, boardData] = manualCheckerboardDetection (colorData, irData, boardData);

fprintf('Manual checkerboard detection finished.\n\n');
