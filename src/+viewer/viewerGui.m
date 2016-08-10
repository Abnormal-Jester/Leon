cellList = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%

if exist('viewerGuiWindow', 'var'),
    clearvars viewerGuiWindow;
end

figureNumber = 5;

figureTitle = 'Viewer';

clear fc cc kc KK
kc = zeros(5,1);

cellList{1,1} = {'Back', ';'};
cellList{1,2} = {'Next', ';'};


cellList{2,1} = {'Color', ';'};
cellList{2,2} = {'IR', ';'};

cellList{3,1} = {'Redo', ';'};
cellList{3,2} = {'Exit', 'gui.reopen_gui; close(2); close(viewerGuiWindow); clearvars viewerGuiWindow;'};


calibToolbox.show_window(cellList,figureNumber,figureTitle,130,18,0,'clean',12);
clearvars figureNumber figureTitle kc cellList;

assignin('base', 'viewerGuiWindow', gcf),

viewer.view_checkerboard;

%-------- End editable region -------------%
%-------- End editable region -------------%
