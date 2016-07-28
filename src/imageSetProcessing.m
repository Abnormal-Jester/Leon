function [autoImagePoints, boardSize, checkerboardPairsUsed] = imageSetProcessing (colorImages, irImages)
% imageSetProcessing Use the MATLAB Computer Vision System Toolbox to preprocess the images.
%
%   This method exists in order to keep imageSetExtraction looking clean.
%
%   See also imageSetExtraction, detectCheckerboardPoints

fprintf(1, 'Processing image sets...\n');

[autoImagePoints,boardSize,checkerboardPairsUsed] = detectCheckerboardPoints(...
    colorImages.ImageLocation, irImages.ImageLocation);

fprintf(1, 'Image sets processed.\n\n');

end
