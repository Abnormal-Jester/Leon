% Last minute addition that displays the image the user inputs

import checkerboard.*;

imageSelect = 1;
activeData = colorData;

try
    while imageSelect ~= -1
        prompt = {'Select image number (-1 to exit, 0 to switch):'};
        dlg_title = 'Input';
        num_lines = 1;
        defaultans = {'1'};

        imageSelect = str2double(inputdlg(prompt,dlg_title,num_lines,defaultans));
        clearvars prompt num_lines dlg_title defaultans;

        if imageSelect == 0
            if isequal(activeData, colorData)
                fprintf(1, 'IR selected\n');
                activeData = irData;
            else
                fprintf(1, 'Color selected\n');
                activeData = colorData;
            end
        elseif imageSelect ~= -1
            try
                figure(2);
                if isequal(activeData, colorData)
                    title(['Color image' num2str(imageSelect)]);
                else
                    title(['IR image' num2str(imageSelect)]);
                end
                imshow(rgb2gray(imread(activeData.imageSet.ImageLocation{imageSelect})));
                hold on;
                plot(activeData.imagePoints(:,1,imageSelect),...
                    activeData.imagePoints(:,2,imageSelect), 'r+');
                hold off;
            catch
                fprintf(1, 'Image does not exist');
            end
        end
    end
catch

end


clearvars imageSelect;

if exist('viewerGuiWindow', 'var')
    figure(viewerGuiWindow);
else
    gui.reopen_gui;
end

%{
if exist('imageSelect', 'var')
    prompt = {'Select image number:'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'1'};
    imageSelect = str2double(inputdlg(prompt,dlg_title,num_lines,defaultans));
    clearvars prompt num_lines dlg_title defaultans;
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
%}
