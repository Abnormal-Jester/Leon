%automatic_checkerboard Automatically detect the checkerboards with notices


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

if checkerboardProgress < 2
    checkerboardProgress = 2;
end
