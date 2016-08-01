function [ valid, exception ] = validateAllDir (colorDir, irDir)
%VALIDATEALLDIR Checks if the directories can be used by a calibration program
%   [VALID, EXCEPTION] = VALIDATEALLDIR(COLORDIR, IRDIR)
%   converts the directories into image sets and compares the number of images
%   in each image set in order to verify the image sets are valid.
%
%   The EXCEPTION
%   errors have a value greater than 10
%   warnings have a value from 1-9 inclusive
%   valid arguments have a value of 0
%
%   See also SELECTANDVALIDATEALLDIR

valid = false;


% These two image sets are lost and recreated again later, but they are not
% output to keep the code cleaner.
colorImages = imageSet(colorDir);
irImages = imageSet(irDir);
nImages = colorImages.Count;

% Several other control-flow structures, but this was ultimately the easiest to
% read.
if colorImages.Count ~= irImages.Count
    exception = MException(19, 'The number of images in each set do not match.');
elseif nImages <= 10
    exception = MException(18, 'More than 10 images are required.');
elseif strcmp(colorDir, irDir),
    exception = MException(17, 'The directories cannot be the same.');
else

    % The image sets meet the minimal requirements for the program to function.
    valid = true;

    if nImages <= 14
        exception = MException(9, ['At least 15 images are recommended for the '...
            'best quality results.']);
    else
        exception = MException(0, 'The images are valid.');
    end
end

end
