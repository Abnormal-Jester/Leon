function [valid, warning, tempError] = validateAllDir(colorDir, irDir)
% validateAllDir Checks if the directories can be used by a calibration program
%   [valid, warning, error] = validateAllDir(colorDir, irDir)
%   converts the directories into image sets and compares the number of images
%   in each image set in order to verify the image sets are valid.
%
%   See also selectAndValidateAllDir

valid = false;
warning = [];
tempError = [];

% These two image sets are lost and recreated again later, but they are not
% output to keep the code cleaner.
colorImageSet = imageSet(colorDir);
irImageSet = imageSet(irDir);
nImage = colorImageSet.Count;

% Several other control-flow structures, but this was ultimately the easiest to
% read.
if colorImageSet.Count ~= irImageSet.Count
    tempError = 'The number of images in each set do not match.';
elseif nImage <= 10
    tempError = 'More than 10 images are required.';
elseif strcmp(colorDir, irDir),
    tempError = 'The directories cannot be the same.';
else

    % The image sets meet the minimal requirements for the program to function.
    valid = true;

    if nImage <= 14
        warning = ['At least 15 images are recommended for the best quality'...
            'results.'];
    end

end

end
