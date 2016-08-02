
worldPoints = generateCheckerboardPoints(boardData.boardSize,squareSize);

imagePoints = zeros([size(colorData.imagePoints) 2] );
imagePoints(:,:,:,1) = colorData.imagePoints;
imagePoints(:,:,:,2) = irData.imagePoints;

[stereoParams,pairsUsed,estimationErrors] = estimateCameraParameters(imagePoints,worldPoints);
