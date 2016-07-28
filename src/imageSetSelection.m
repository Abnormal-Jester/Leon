function [colorImages, irImages, colorDir, irDir] = imageSetSelection
% imageSetSelection Prompt the user for the color and ir image sets
%
%   Have the user select the directory that contains the color images and the
%   directory that contains the IR images, verify there are enough images, then
%   keep the image sets.

fprintf(1, '\n');
fprintf(1, 'Obtaining the image set...\n');

validImageSetsExist = false;
promptAttemptRepeat = true;
tempCheck = [];

while ~validImageSetsExist

    % Select directories
    fprintf(1, 'Select the Color image directory.\n');
    colorDir = uigetdir('', 'Select the Color image directory');
    tempPath = fileparts(colorDir);
    fprintf(1, 'Select the IR image directory.\n');
    irDir = uigetdir(tempPath, 'Select the IR image directory');
    clearvars tempPath;

    % Obtain images sets
    irImages = imageSet(irDir);
    colorImages = imageSet(colorDir);

    % Verify image count
    if irImages.Count ~= colorImages.Count
        fprintf(1, 'The number of images in each set do not match.\n');
    elseif irImages.Count <= 10
        fprintf(1, 'More than 10 images are required.\n');
    elseif irImages.Count <= 14
        fprintf(1, 'More than 15 images are recommended.\n');
    else
        fprintf(1, 'The image counts are valid.\n');
        validImageSetsExist = true;
        promptAttemptRepeat = false;
    end

    % Prompt attempt to select the directories again
    if promptAttemptRepeat
        tempCheck = input('Continue? ([] = Yes, Number = No) ');
        if isempty(tempCheck)
            validImageSetsExist = true;
        else
            error('Valid image set not found');
        end
    end
end

fprintf(1, 'Image set obtained.\n\n');

end
