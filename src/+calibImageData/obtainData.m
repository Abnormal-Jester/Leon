import calibImageData.*;

try
    sendNotice;

    [colorImages, irImages, colorDir, irDir] = selectDirs;

    [colorData, irData] = imageSetProcessing (colorImages, irImages, ...
        colorDir, irDir);
catch e
    clearvars colorImages irImages colorDir irDir;
    clearvars colorData irData;
    fprintf(2, e.message);
    fprintf (1, '\n');
    clearvars e;

    fprintf (1, 'Failed.\n\n');
    reopenGUI;
end

clearvars colorImages irImages colorDir irDir;
reopenGUI;
