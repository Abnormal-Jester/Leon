try
    imageSetNotice;


    [colorImages, irImages, colorDir, irDir] = imageSetSelection;

    [colorData, irData] = imageSetProcessing (colorImages, irImages, ...
        colorDir, irDir);
catch e
    clearvars colorImages irImages colorDir irDir;
    clearvars colorData irData;
    fprintf (1, 'Failed.\n\n');
    disp(e);
    reopenGUI;
end

clearvars colorImages irImages colorDir irDir;
reopenGUI;
