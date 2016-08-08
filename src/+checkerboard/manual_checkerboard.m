%automatic_checkerboard Manually detect the checkerboards with notices

import checkerboard.*;

if checkerboardProgress < 2
    automatic_checkerboard;

    if checkerboardProgress < 2
        error('checkerboard progress failure');
    end
end

fprintf('Running manual checkerboard detection...\n');

[colorData, irData, boardData] = manualCheckerboardDetection (colorData, irData, boardData);

fprintf('Manual checkerboard detection finished.\n\n');

checkerboardProgress = 3;
