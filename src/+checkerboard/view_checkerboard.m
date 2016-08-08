
import checkerboard.*;

commandwindow;
number = input('Image number = ');

try
    while number ~= 0

        figure(2);
        title('Calibration images');
        imshow(rgb2gray(imread(colorData.imageSet.ImageLocation{number})));
        hold on;
        plot(colorData.imagePoints(:,1,number),...
            colorData.imagePoints(:,2,number), 'r+');
        hold off;

        commandwindow;
        number = input('Image number = ');

    end
catch

end

fprintf(1, 'end');

reopen_gui;
