import manual.*;

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

try
    [cameraId] = inputCameraId;
    [squareSize] = inputSquareSize;
    [colorDir, irDir] = selectAllDirAndValidate;
catch
    clearvars inputCameraId inputSquareSize colorDir irDir;
    fprintf(2, 'Invalid Input');
end
