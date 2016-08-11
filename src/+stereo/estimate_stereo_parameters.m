
if exist('checkerboardProgress','var')
    if checkerboardProgress < 4
        stereo.generate_core_point_array_pair;
    end
else
    stereo.generate_core_point_array_pair;
end

fprintf(1, 'Estimating camera parameters...\n');

[stereoParams,pairsUsed,estimationErrors] =...
    estimateCameraParameters(imagePoints,worldPoints);

fprintf(1, 'Done.\n\n');

checkerboardProgress = 5;
