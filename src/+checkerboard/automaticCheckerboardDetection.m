function [colorData, irData, boardData] = automaticCheckerboardDetection (colorImageSet, irImageSet)
% AUTOMATICCHECKERBOARDDETECTION Automatically detect the checkerboards
%   [COLORDATA, IRDATA, BOARDDATA] = AUTOMATICCHECKERBOARDDETECTION (COLORIMAGESET, IRIMAGESET)
%   uses the MATLAB Computer Vision System Toolbox to automatically detect some
%   of the checkerpoints and constructs the data objects the calibration program
%   requires.

import checkerboard.*;

[autoImagePoints, boardSize, imagePairsUsed] =...
    detectCheckerboardPoints(colorImageSet.ImageLocation, irImageSet.ImageLocation);

tempPoints = autoImagePoints(:,:,:,1);
colorData = ImageSetData(tempPoints, colorImageSet, imagePairsUsed);

tempPoints = autoImagePoints(:,:,:,2);
irData = ImageSetData(tempPoints, irImageSet, imagePairsUsed);

boardData = CheckerboardData(boardSize, imagePairsUsed);

end
