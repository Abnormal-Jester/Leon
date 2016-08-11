%check_and_auto_detection Check the checkerboard detection progress and
% manually detect the checkerboards in the image set pair

import checkerboard.*;

if exist('checkerboardProgress','var')
    if checkerboardProgress < 2
        check_and_auto_detection;
    end
else
    check_and_auto_detection;
end

if checkerboardProgress < 2
    error('checkerboard progress failure');
end

fprintf(1, 'Running manual checkerboard detection...\n');

manualImaNum = sum(boardData.imagePairsUsed(:)==0);
fprintf(1, [num2str(manualImaNum) ' image sets to manually input.\n']);
clearvars num;

[colorData, irData, boardData] = manualCheckerboardDetection(colorData, irData, boardData);

fprintf(1, 'Manual checkerboard detection finished.\n\n');

if ishandle(2)
    close(2);
end

gui.reopen_gui;

checkerboardProgress = 3;
