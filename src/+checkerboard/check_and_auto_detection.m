% check_and_auto_detection Check the checkerboard detection progress and
% automatically detect the checkerboards in the image set pair


import checkerboard.*;

if checkerboardProgress < 1
    create_all_image_set;

    if checkerboardProgress < 1
        error('checkerboard progress failure');
    end
end

fprintf('Running automatic checkerboard detection...\n');

[colorData, irData, boardData] = automaticCheckerboardDetection (...
    colorImageSet, irImageSet);

fprintf('Automatic checkerboard detection finished.\n\n');

checkerboardProgress = 2;
