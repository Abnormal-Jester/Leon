cellList = {};


%-------- Begin editable region -------------%
%-------- Begin editable region -------------%


figureNumber = 5;

figureTitle = 'Camera Calibration Toolbox - Custom Version 1.01';

clear fc cc kc KK
kc = zeros(5,1);
clearwin;


cellList{1,1} = {'Back', ';'};
cellList{1,2} = {'Next', ';'};


cellList{2,1} = {'Color', ';'};
cellList{2,2} = {'IR', ';'};

cellList{3,1} = {'Redo', ';'};
cellList{3,2} = {'Exit', 'reopen_gui; close(5);'};


show_window(cellList,figureNumber,figureTitle,130,18,0,'clean',12);
clearvars figureNumber figureTitle kc cellList;

%-------- End editable region -------------%
%-------- End editable region -------------%
