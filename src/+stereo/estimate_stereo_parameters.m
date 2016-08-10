
fprintf(1, 'Estimating camera parameters...\n');

[stereoParams,pairsUsed,estimationErrors] =...
    estimateCameraParameters(imagePoints,worldPoints);

fprintf(1, 'Done.\n\n');
