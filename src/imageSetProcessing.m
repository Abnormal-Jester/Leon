function [colorData, irData] = imageSetProcessing (colorImages, irImages, colorDir, irDir)
% imageSetProcessing Use the MATLAB Computer Vision System Toolbox to
% preprocess the images, obtain their prefix and postfix, then output
% data objects.
%
%   See also imageSetExtraction, detectCheckerboardPoints

fprintf(1, 'Processing image sets...\n');

[autoImagePoints,boardSize,checkerboardPairsUsed] = detectCheckerboardPoints(...
    colorImages.ImageLocation, irImages.ImageLocation);

[colorPrefix, colorType] = imageNameExtraction (colorImages);
[irPrefix, irType] = imageNameExtraction (irImages);

tempPoints = autoImagePoints(:,:,:,1);
colorData = calibImageSet.CalibImageSet (tempPoints, colorImages, colorDir,...
    colorPrefix, colorType, checkerboardPairsUsed, boardSize);

tempPoints = autoImagePoints(:,:,:,2);
irData = calibImageSet.CalibImageSet (tempPoints, irImages, irDir,...
    irPrefix, irType, checkerboardPairsUsed, boardSize);

fprintf(1, 'Image sets processed.\n\n');

end
