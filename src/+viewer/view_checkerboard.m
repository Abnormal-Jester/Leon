% Last minute addition that displays the image the user inputs

import checkerboard.*;

imageSelect = 1;
prevI = 1;
activeData = colorData;

try
    while imageSelect ~= -1
        txtPrompt = {'Select image number (-1 to exit, 0 to switch, -2 to redo points):'};
        dialogTitle = 'Input';
        nLines = 1;
        defaultAns = {'1'};

        imageSelect = str2double(inputdlg(txtPrompt,dialogTitle,nLines,defaultAns));
        clearvars txtPrompt nLines dialogTitle defaultAns;

        if imageSelect == 0
            if isequal(activeData, colorData)
                fprintf(1, 'IR selected\n');
                activeData = irData;
            else
                fprintf(1, 'Color selected\n');
                activeData = colorData;
            end
        elseif imageSelect == -2
            try
                if isequal(activeData, colorData)
                    colorData = overwritePointArray(boardData, colorData, prevI);
                else
                    irData = overwritePointArray(boardData, irData, prevI);
                end
            catch
                fprintf(1, 'Could not overwrite\n');
            end
        elseif imageSelect ~= -1
            try
                figure(2);
                if isequal(activeData, colorData)
                    title(['Color image' num2str(imageSelect)]);
                else
                    title(['IR image' num2str(imageSelect)]);
                end
                ima = activeData.imageSet.ImageLocation{imageSelect};
                ima = imread(ima);
                try
                    tempIma = rgb2gray(ima);
                    ima = tempIma;
                    clearvars tempIma;
                catch
                    clearvars tempIma;
                end
                imshow(ima);
                hold on;
                plot(activeData.imagePoints(:,1,imageSelect),...
                    activeData.imagePoints(:,2,imageSelect), 'r+');
                hold off;
                prevI = imageSelect;
            catch
                fprintf(1, 'Image does not exist\n');
            end
        end
    end
catch

end


clearvars imageSelect ima;

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
