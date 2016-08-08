function [colorData, irData, boardData] = automaticCheckerboardDetection(colorImageSet, irImageSet)
% automaticCheckerboardDetection Automatically detect the checkerboards
%   [colorData, irData, boardData] = automaticCheckerboardDetection(colorImageSet, irImageSet)
%   uses the MATLAB Computer Vision System Toolbox to automatically detect some
%   of the checkerpoints and constructs the data objects the calibration program
%   requires.

import checkerboard.*;

% MATLAB Computer Vision System Toolbox
[autoImagePoints, boardSize, imagePairsUsed] =...
    detectCheckerboardPoints(colorImageSet.ImageLocation, irImageSet.ImageLocation);

% Create the image set data objects
tempPoints = autoImagePoints(:,:,:,1);
colorData = ImageSetData(tempPoints, colorImageSet, imagePairsUsed);

tempPoints = autoImagePoints(:,:,:,2);
irData = ImageSetData(tempPoints, irImageSet, imagePairsUsed);

% Create the board data object
boardData = CheckerboardData(boardSize, imagePairsUsed);

end
