function [points, windowInfo] = clickCalibration(boardSize, imageName, windowInfoIn)
% function: Short description
%
% Extended description

import checkerboard.*;
import checkerboard.manual.*;

fprintf(1, 'Manual detection...\n');

% process image
ima = imread(imageName);
% if image is already grayscale, this function should catch it
try
    tempIma = rgb2gray(ima);
    ima = tempIma;
    clearvars tempIma;
catch
    clearvars tempIma;
end
ima = double(ima);


imaSize = size(ima);
xSize = ceil(imaSize(1)/110);
ySize = ceil(imaSize(2)/110);

% get window size
if ~exist('windowInfoIn', 'var')
    windowInfo = [xSize ySize];
else
    if isempty(windowInfoIn)

        windowInfo = [xSize ySize];
    else
        windowInfo = windowInfoIn;
    end
end
clearvars imaSize;


p = 'No';

while ~strcmp(p, 'Yes')
    cornerPoints = selectCornerArray(windowInfo, ima);
    cornerPoints = sortCornerArray(cornerPoints);

    points = calculatePointArray(windowInfo, cornerPoints, boardSize, ima);

    displayPointArrayOnImage(ima, cornerPoints, points);

    p = questdlg('Looks good?');

    if strcmp(p, 'No')
        try
            commandwindow;
            p = input('Input new corner detection window size for x ([] = no change): ');
            if ~isempty(p)
                windowInfo(1) = p;
                p = input('Input new corner detection window size for y ([] = no change): ');
                if ~isempty(p)
                    windowInfo(2) = p;
                end
            end
        catch
        end
    elseif strcmp(p, 'Cancel')
        error('Unable to obtain manual image');
    end
end

fprintf(1, 'Done.\n\n');

end
