
fprintf(1, 'Generating core point array pair...\n');

worldPoints = generateCheckerboardPoints(boardData.boardSize,squareSize);

imagePoints = zeros([size(colorData.imagePoints) 2] );
imagePoints(:,:,:,2) = colorData.imagePoints;
imagePoints(:,:,:,1) = irData.imagePoints;

fprintf(1, 'Done.\n\n');
