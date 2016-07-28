function [colorImages, irImages, colorDir, irDir] = imageSetSelection
% imageSetSelection Prompt the user for the color and ir image sets
%
%   Have the user select the directory that contains the color images and the
%   directory that contains the IR images, verify there are enough images, then
%   keep the image sets.

fprintf(1, '\n');
fprintf(1, 'Obtaining the image set...\n');

validImageSetsExist = false;
fatalError = false;
promptAttemptRepeat = false;
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
        fprintf(1, 'ERROR: The number of images in each set do not match.\n');
        fatalError = true;
    elseif irImages.Count <= 10
        fprintf(1, 'ERROR: More than 10 images are required.\n');
        fprintf(1, 'At least 15 images are recommended for best quality.\n');
        fatalError = true;
    elseif irImages.Count <= 14
        fprintf(1, 'WARNING: At least 15 images are recommended for best quality.\n');
        promptAttemptRepeat = true;
    else
        fprintf(1, 'The image counts are valid.\n');
        validImageSetsExist = true;
    end

    % Force entry again or prompt attempt to select the directories again
    if fatalError
        tempCheck = input('Try Again? ([] = Yes, Number = No) ');
        if isempty(tempCheck)
            fatalError = false;
        else
            error('Valid image set not found');
        end
    elseif promptAttemptRepeat
        tempCheck = input('Continue Anyways? ([] = Yes, Number = No) ');
        if isempty(tempCheck)
            validImageSetsExist = true;
        else
            error('Valid image set not found');
        end
    end
end

fprintf(1, 'Image set obtained.\n\n');

end
