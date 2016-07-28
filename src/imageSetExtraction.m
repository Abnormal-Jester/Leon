try
    imageSetNotice;
    [colorImages, irImages, colorDir, irDir] = imageSetSelection;
    [autoImagePoints, boardSize, checkerboardPairsUsed] = imageSetProcessing (colorImages, irImages);
catch
    clearvars colorImages irImages colorDir irDir autoImagePoints boardSize checkerboardPairsUsed;
    fprintf (1, 'Failed.\n\n');
    reopenGUI;
end

reopenGUI;
