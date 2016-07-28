fprintf(1, 'Analizing image sets...\n');

[autoImagePoints,boardSize,checkerboardPairsUsed] = detectCheckerboardPoints(colorImages.ImageLocation,...
    irImages.ImageLocation);

fprintf(1, 'Image sets analized.\n\n');
