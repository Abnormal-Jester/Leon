fprintf(1, 'Saving calib data...\n');
fprintf(1, 'Warning, the data only contains links to the images.\n');
fprintf(1, 'Moving the images will break the save file.\n');

if exist('cameraId', 'var')
    saveFile = ['myCalibData' num2str(cameraId) '.mat'];
else
    saveFile = 'myCalibData.mat';
end

fprintf(1, ['Saving to' saveFile]);

variableList = {'cameraId','squareSize','colorDir','irDir','constantsObtained',...
    'colorImageSet','irImageSet','colorData', 'irData','checkerboardProgress',...
    'imageSelect','boardData','estimationErrors','imagePoints','worldPoints',...
    'pairsUsed','stereoParams'};

if exist(saveFile, 'file')
    delete saveFile;
end

for variableIndex = 1:length(variableList)
    if exist(variableList{variableIndex}, 'var')
        if exist(saveFile, 'file')
            save(saveFile,variableList{variableIndex},'-append');
        else
            save(saveFile,variableList{variableIndex});
        end
    end
end

clearvars saveFile;
