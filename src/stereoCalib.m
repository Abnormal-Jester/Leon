
worldPoints = generateCheckerboardPoints(boardData.boardSize,squareSize);

imagePoints = zeros([size(colorData.imagePoints) 2] );
imagePoints(:,:,:,2) = colorData.imagePoints;
imagePoints(:,:,:,1) = irData.imagePoints;

[stereoParams,pairsUsed,estimationErrors] = estimateCameraParameters(imagePoints,worldPoints);

stereo.generateIni
