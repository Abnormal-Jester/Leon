import manual.*;

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

if exist('cameraId', 'var')
    [cameraId] = inputCameraId(cameraId);
else
    [cameraId] = inputCameraId;
end

[squareSize] = inputSquareSize;

try
    [colorDir, irDir] = selectAndValidateAllDir;
catch e
    disp(e);
    clearvars inputCameraId inputSquareSize colorDir irDir e;
end

reopenGUI;
