function [colorData, irData, boardData] = manualCheckerboardDetection (varargin)
% MANUALCHECKERBOARDDETECTION Manually detect the checkerboards
%   [COLORDATA, IRDATA, BOARDDATA] = MANUALCHECKERBOARDDETECTION (COLORDATA, IRDATA, BOARDDATA)
%   fills in the missing checkerboards by having the user select the four
%   corners of the checkerboards.

import checkerboard.*;

narginchk(3, 3);

colorData = varargin{1};
irData = varargin{2};
boardData = varargin{3};

nImagePairsUsed = numel(boardData.imagePairsUsed);

for i = 1:nImagePairsUsed,

    if ~boardData.imagePairsUsed(i),

        manualPoints = clickCalibration(boardData.boardSize, colorData.getImage(i));
        colorData = colorData.addPoints(i, manualPoints);

        manualPoints = clickCalibration(boardData.boardSize, colorData.getImage(i));
        irData = irData.addPoints(i, manualPoints);

    end

end
