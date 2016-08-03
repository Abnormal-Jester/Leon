import manual.*;

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

checkAndInputCameraId;
checkAndInputSquareSize;

try
    [colorDir, irDir] = selectAndValidateAllDir;
catch e
    disp(e);
    clearvars inputCameraId inputSquareSize colorDir irDir e;
end

reopenGUI;
