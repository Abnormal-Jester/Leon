function points = clickCalibration(boardSize, imageName)
% function: Short description
%
% Extended description

import checkerboard.*;
import checkerboard.manual.*;


ima = double(rgb2gray(imread(imageName)));
windowInfo = [7 7];

fprintf(1, 'Manual detection...\n');

p = 'No';

while ~strcmp(p, 'Yes')
    cornerPoints = selectCornerArray(windowInfo, ima);
    cornerPoints = sortCornerArray(cornerPoints);

    points = calculatePointArray(windowInfo, cornerPoints, boardSize, ima);

    displayPointArrayOnImage(ima, cornerPoints, points);

    p = questdlg('Looks good?');

    if strcmp(p, 'Cancel')
        error('Unable to obtain manual images');
    end
end

fprintf(1, 'Done.\n\n');

end
