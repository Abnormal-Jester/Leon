
if exist('checkerboardProgress','var')
    if checkerboardProgress < 5
        stereo.estimate_stereo_parameters;
    end
else
    stereo.estimate_stereo_parameters;
end

fprintf(1, 'Generating ini file...\n');

fileId = fopen(['Cam_Paras_' num2str(cameraId) '.ini'],'w');

tempFC = stereoParams.CameraParameters1.FocalLength;
tempCC = stereoParams.CameraParameters1.PrincipalPoint;

fprintf(fileId, [num2str(tempFC(1)) ' ' num2str(tempFC(2)) ' '...
    num2str(tempCC(1)) ' ' num2str(tempCC(2)) '\r\n']);

tempFC = stereoParams.CameraParameters2.FocalLength;
tempCC = stereoParams.CameraParameters2.PrincipalPoint;

fprintf(fileId, [num2str(tempFC(1)) ' ' num2str(tempFC(2)) ' '...
    num2str(tempCC(1)) ' ' num2str(tempCC(2)) '\r\n']);

tempRotation = stereoParams.RotationOfCamera2;

fprintf(fileId, [num2str(tempRotation(1,1)) ' ' num2str(tempRotation(1,2))...
    ' ' num2str(tempRotation(1,3)) '\r\n']);
fprintf(fileId, [num2str(tempRotation(2,1)) ' ' num2str(tempRotation(2,2))...
    ' ' num2str(tempRotation(2,3)) '\r\n']);
fprintf(fileId, [num2str(tempRotation(3,1)) ' ' num2str(tempRotation(3,2))...
    ' ' num2str(tempRotation(3,3)) '\r\n']);

tempTranslation = stereoParams.TranslationOfCamera2;

fprintf(fileId, [num2str(tempTranslation(1)) ' ' num2str(tempTranslation(2))...
    ' ' num2str(tempTranslation(3))]);

% tempRadial1 = stereoParams.CameraParameters1.RadialDistortion;
% tempRadial2 = stereoParams.CameraParameters2.RadialDistortion;

clearvars tempFC;
clearvars tempCC;
clearvars tempRotation;
clearvars tempTranslation;
% clearvars tempRadial;

fclose(fileId);
clearvars fileId;

fprintf(1, 'ini file created.\n\n');

checkerboardProgress = 6;
