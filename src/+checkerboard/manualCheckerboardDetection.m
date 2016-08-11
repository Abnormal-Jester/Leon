function [colorData, irData, boardData] = manualCheckerboardDetection(varargin)
% manualCheckerboardDetection Manually detect the checkerboards
%   [colorData, irData, boardData] = manualCheckerboardDetection(colorData, irData, boardData)
%   fills in the all missing checkerboards by having the user select the four
%   corners of the checkerboards.

import checkerboard.*;

narginchk(3, 3);

colorData = varargin{1};
irData = varargin{2};
boardData = varargin{3};

colorWindowSize = [];
irWindowSize = [];

nImagePairsUsed = numel(boardData.imagePairsUsed);

for i = 1:nImagePairsUsed,

    if ~boardData.imagePairsUsed(i),

        [colorData, colorWindowSize] = overwritePointArray(boardData, colorData, i, colorWindowSize);
        [irData, irWindowSize] = overwritePointArray(boardData, irData, i, irWindowSize);

    end

end
