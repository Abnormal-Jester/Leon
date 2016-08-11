
if exist('checkerboardProgress','var')
    if checkerboardProgress < 3
        checkerboard.check_and_manual_detection;
    end
else
    checkerboard.check_and_manual_detection;
end

try
    cameraPos = input(['Is the color camera to the right or left of the ir '...
    'camera? ([] = right, other = left)']);

    cameraPos = isempty(cameraPos);

catch
    cameraPos = 1;
end


fprintf(1, 'Generating core point array pair...\n');

worldPoints = generateCheckerboardPoints(boardData.boardSize,squareSize);

imagePoints = zeros([size(colorData.imagePoints) 2] );

if cameraPos
    imagePoints(:,:,:,2) = colorData.imagePoints;
    imagePoints(:,:,:,1) = irData.imagePoints;
else
    imagePoints(:,:,:,1) = colorData.imagePoints;
    imagePoints(:,:,:,2) = irData.imagePoints;
end

fprintf(1, 'Done.\n\n');

checkerboardProgress = 4;
