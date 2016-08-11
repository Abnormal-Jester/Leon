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
if exist('colorData.windowSize','var')
    colorWindowSize = colorData.windowSize;
end
if exist('irData.windowSize','var')
    irWindowSize = irData.windowSize;
end

nImagePairsUsed = numel(boardData.imagePairsUsed);

count = 1;
manualImaNum = sum(boardData.imagePairsUsed(:)==0)*2;

for i = 1:nImagePairsUsed,

    if ~boardData.imagePairsUsed(i),

        fprintf(1, ['Color Image ' num2str(i) ' (' num2str(count) ' of ' num2str(manualImaNum) ')\n\n']);
        count = count + 1;
        
        [colorData, colorWindowSize] = overwritePointArray(boardData, colorData, i, colorWindowSize);
        colorData.windowSize = colorWindowSize;
        
        fprintf(1, ['Depth Image ' num2str(i) ' (' num2str(count) ' of ' num2str(manualImaNum) ')\n\n']);
        count = count + 1;
        
        [irData, irWindowSize] = overwritePointArray(boardData, irData, i, irWindowSize);
        irData.windowSize = irWindowSize;
    end

end
