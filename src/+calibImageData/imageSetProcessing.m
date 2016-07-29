function [colorData, irData] = imageSetProcessing (colorImages, irImages, colorDir, irDir)
% imageSetProcessing Use the MATLAB Computer Vision System Toolbox to
% preprocess the images, obtain their prefix and postfix, then output
% data objects.
%
%   See also imageSetExtraction, detectCheckerboardPoints

import calibImageData.*;

fprintf(1, 'Processing image sets...\n');

[autoImagePoints,boardSize,checkerboardPairsUsed] = detectCheckerboardPoints(...
    colorImages.ImageLocation, irImages.ImageLocation);

fprintf(1, '1...\n');

[colorPrefix, colorType] = imageNameExtraction (colorImages);
[irPrefix, irType] = imageNameExtraction (irImages);

fprintf(1, '2...\n');

tempPoints = autoImagePoints(:,:,:,1);
colorData = CalibImageData (tempPoints, colorImages, colorDir,...
    colorPrefix, colorType, checkerboardPairsUsed, boardSize);

fprintf(1, '3...\n');

tempPoints = autoImagePoints(:,:,:,2);
irData = CalibImageData (tempPoints, irImages, irDir,...
    irPrefix, irType, checkerboardPairsUsed, boardSize);

fprintf(1, '4...\n');

fprintf(1, 'Image sets processed.\n\n');

end
