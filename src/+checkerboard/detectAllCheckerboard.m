% DETECTALLCHECKERBOARD Try to automatically detect the checkerboards and
% manually fill in the missing checkerboards

import checkerboard.*;

colorImageSet = imageSet(colorDir);
irImageSet = imageSet(irDir);
% clearvars colorDir irDir;

[colorData, irData, boardData] = automaticCheckerboardDetection (...
    colorImageSet, irImageSet);
% clearvars colorImageSet irImageSet;

[colorData, irData, boardData] = manualCheckerboardDetection (colorData, irData, boardData);
