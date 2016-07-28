try
    imageSetNotice;
    [colorImages, irImages, colorDir, irDir] = imageSetSelection;
    [autoImagePoints, boardSize, checkerboardPairsUsed] = imageSetProcessing (colorImages, irImages);
catch myError
    clearvars colorImages irImages colorDir irDir autoImagePoints boardSize checkerboardPairsUsed;
    reopenGUI;
    rethrow myError;
end

reopenGUI;
