

for i=1:colorData.imageSet.Count
    ima = colorData.getImage(i);
    ima = double(rgb2gray(imread(ima)));
    XX = colorData.imagePoints(:,:,i);
    tempPoints = calibToolbox.cornerfinder(XX,ima,7,7);
    colorData = colorData.addPoints(i, tempPoints);

    ima = irData.getImage(i);
    ima = double(rgb2gray(imread(ima)));
    XX = irData.imagePoints(:,:,i);
    tempPoints = calibToolbox.cornerfinder(XX,ima,7,7);
    irData = irData.addPoints(i, tempPoints);
end

clearvars ima XX tempPoints;
