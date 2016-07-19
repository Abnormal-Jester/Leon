
validImages = false;
checkContinue = false;

fprintf(1, '\n');
fprintf(1, 'Obtaining the image set...\n');

while ~validImages
    
    fprintf(1, 'Select the Color image directory.\n');
    colorDir = uigetdir('', 'Select the Color image directory');
    tempPath = fileparts(colorDir);
    fprintf(1, 'Select the IR image directory.\n');
    irDir = uigetdir(tempPath, 'Select the IR image directory');
    clearvars tempPath;

    irImages = imageSet(irDir);
    colorImages = imageSet(colorDir);

    if irImages.Count ~= colorImages.Count
        fprintf(1, 'The number of images in each set do not match.\n');
        checkContinue = true;
    elseif irImages.Count <= 10
        fprintf(1, 'More than 10 images are required.\n');
        return
    elseif irImages.Count <= 14
        fprintf(1, 'It is recommended to have at least 15 initial images.\n');
        checkContinue = true;
    else
        validImages = true;
    end
    
    if checkContinue
        tempCheck = input('Continue? ([] = Yes, Number = No) ');
        if isempty(tempCheck)
            validImages = true;
            clearvars tempCheck;
        else
            error('Valid image set not found');
        end
    end
    checkContinue = false;
end

clearvars checkContinue;
clearvars validImages;

fprintf(1, 'Image set obtained.\n\n');
