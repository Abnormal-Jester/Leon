cameraNum = input('Enter the serial number of the camera: ');

%squareSize = input('Enter the size of the squares (mm): ');
squareSize = 73;

obtainValidImageSets;

fprintf(1, 'Detecting checkerboards...\n');
[imagePoints,boardSize,checkerboardPairsUsed] = detectCheckerboardPoints(leftImages.ImageLocation,...
    rightImages.ImageLocation);

checkerboardPairsCount = sum(checkerboardPairsUsed);

if checkerboardPairsCount <= 11
    fprintf(1, ['A checkerboard could only be detected on ' checkerboardPairsCount ' images.\n']);
    fprintf(1, 'It is recommended to have at least 12 images with checkerboards and at very least 10 images.');
    
    tempCheck = input('Attempt to manually detect checkerboards? ([] = Yes, Number = No) ');
    if isempty(tempCheck)
        clearvars;
        my_calib_gui;
        return
    elseif checkerboardPairsCount < 10
        fprintf(1, 'Not enough images with checkerboards.');
        clearvars tempCheck;
        return
    else
        clearvars tempCheck;
    end
    
end

fprintf(1, 'Detecting checkerboards coordinates...\n');
worldPoints = generateCheckerboardPoints(boardSize,squareSize);
fprintf(1, 'Checkerboards found.\n\n');

fprintf(1, 'Calibrating the stereo camera system...\n');
[stereoParams,parametersPairsUsed,estimationErrors] = estimateCameraParameters(imagePoints,worldPoints);
fprintf(1, 'Parameters calibrated.\n\n');

fprintf(1, 'Checking errors...\n');

totalFocalLengthError = [estimationErrors.Camera1IntrinsicsErrors.FocalLengthError estimationErrors.Camera2IntrinsicsErrors.FocalLengthError];
totalPrincipalPointError = [estimationErrors.Camera1IntrinsicsErrors.PrincipalPointError estimationErrors.Camera2IntrinsicsErrors.PrincipalPointError];

%fprintf(1, 'WARNING: Radial Distortion errors are not currently checked.\n');

totalRotationError = estimationErrors.RotationOfCamera2Error;
totalTranslationError = estimationErrors.TranslationOfCamera2Error;

errorNumber = [(totalFocalLengthError >= 2) (totalPrincipalPointError >= 1) (totalRotationError > .005) (totalTranslationError > .5)];

if sum(errorNumber) >= 1
    fprintf(1, 'The amount of error of the parameters generated by the automatic system exceeds the acceptable error value.');
    tempCheck = input('Attempt to manually correct errors? ([] = Yes, Number = No) ');
    if isempty(tempCheck)
        clearvars;
        stereoCameraCalibrator;
        return
    else
        clearvars tempCheck;
    end
end

fprintf(1, 'Errors checked.\n\n');

fprintf(1, 'Generating ini file...\n');

fileID = fopen(['Cam_Paras_' num2str(cameraNum) '.ini'],'w');

tempFC = stereoParams.CameraParameters1.FocalLength;
tempCC = stereoParams.CameraParameters1.PrincipalPoint;

fprintf(fileID, [num2str(tempFC(1)) ' ' num2str(tempFC(2)) ' ' num2str(tempCC(1)) ' ' num2str(tempCC(2)) '\r\n']);

tempFC = stereoParams.CameraParameters2.FocalLength;
tempCC = stereoParams.CameraParameters2.PrincipalPoint;

fprintf(fileID, [num2str(tempFC(1)) ' ' num2str(tempFC(2)) ' ' num2str(tempCC(1)) ' ' num2str(tempCC(2)) '\r\n']);

tempRotation = stereoParams.RotationOfCamera2;

fprintf(fileID, [num2str(tempRotation(1,1)) ' ' num2str(tempRotation(1,2)) ' ' num2str(tempRotation(1,3)) '\r\n']);
fprintf(fileID, [num2str(tempRotation(2,1)) ' ' num2str(tempRotation(2,2)) ' ' num2str(tempRotation(2,3)) '\r\n']);
fprintf(fileID, [num2str(tempRotation(3,1)) ' ' num2str(tempRotation(3,2)) ' ' num2str(tempRotation(3,3)) '\r\n']);

tempTranslation = stereoParams.TranslationOfCamera2;

fprintf(fileID, [num2str(tempTranslation(1)) ' ' num2str(tempTranslation(2)) ' ' num2str(tempTranslation(3))]);

tempRadial1 = stereoParams.CameraParameters1.RadialDistortion;
tempRadial2 = stereoParams.CameraParameters2.RadialDistortion;

clearvars tempFC;
clearvars tempCC;
clearvars tempRotation;
clearvars tempTranslation;
% clearvars tempRadial;

fclose(fileID);

fprintf(1, 'ini file created.\n\n');

fprintf(1, 'Done.\n');
