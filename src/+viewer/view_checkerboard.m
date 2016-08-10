
import checkerboard.*;

if exist('imageSelect', 'var')
    prompt = {'Select image number:'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'1'};
    imageSelect = str2double(inputdlg(prompt,dlg_title,num_lines,defaultans));
else
    imageSelect = 1;
end

try
    figure(2);
    title('Calibration images');
    imshow(rgb2gray(imread(colorData.imageSet.ImageLocation{imageSelect})));
    hold on;
    plot(colorData.imagePoints(:,1,imageSelect),...
        colorData.imagePoints(:,2,imageSelect), 'r+');
    hold off;

    clearvars imageSelect;
catch

end

if exist('viewerGuiWindow', 'var')
    figure(viewerGuiWindow);
else
    reopen_gui;
end
