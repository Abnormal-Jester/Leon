function [imageSetData, windowSize] = overwritePointArray(varargin)
% overwritePointArray Replace the original ponits with manually dectected points
%   imageSetData = overwritePointArray(boardData, imageSetDataIn, imageIndex)
%   Overwrite the 2d point set of the image set data at the indicated index with
%   data points created by manually selecting the corners

import checkerboard.*;

narginchk(3, 4);

boardData = varargin{1};
imageSetDataIn = varargin{2};
imageIndex = varargin{3};
if nargin > 3
    windowSize = varargin{4};
else
    windowSize = [];
end


[manualPoints, windowSize] = clickCalibration(boardData.boardSize, imageSetDataIn.getImage(imageIndex), windowSize);
imageSetData = imageSetDataIn.addPoints(imageIndex, manualPoints);

end
