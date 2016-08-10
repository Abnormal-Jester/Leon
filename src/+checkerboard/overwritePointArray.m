function imageSetData = overwritePointArray(varargin)
% overwritePointArray Replace the original ponits with manually dectected points
%   imageSetData = overwritePointArray(boardData, imageSetDataIn, imageIndex)
%   Overwrite the 2d point set of the image set data at the indicated index with
%   data points created by manually selecting the corners

import checkerboard.*;

narginchk(3, 3);

boardData = varargin{1};
imageSetDataIn = varargin{2};
imageIndex = varargin{3};

manualPoints = clickCalibration(boardData.boardSize, imageSetDataIn.getImage(imageIndex));
imageSetData = imageSetDataIn.addPoints(imageIndex, manualPoints);

end
