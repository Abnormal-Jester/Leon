% Obtain the image name prefix and the format of the images.

fileName = char(activeImageSet.ImageLocation(1, 1));
[calib_name, format_image] = imageDataExtraction (fileName);
clearvars fileName;
