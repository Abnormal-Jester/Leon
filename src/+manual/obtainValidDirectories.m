try
    [colorDir, irDir] = selectAndValidateAllDir;
catch e
    disp(e);
    clearvars inputCameraId inputSquareSize colorDir irDir e;
end
