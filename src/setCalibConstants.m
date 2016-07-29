
fprintf(1, 'Obtaining constants...\n');

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

defaultSquareSize = 73;
squareSize = input(['Size of a side of each square ([]=' num2str(defaultSquareSize) 'mm) = ']);
if isempty(squareSize), squareSize = defaultSquareSize; end;

dX = squareSize;
dY = squareSize;

clearvars squareSize defaultSquareSize;


fprintf(1, '\n');

% The calibration number is usually included in the directory path, so I print
% the directory paths here. It also allows the user to check if the directory
% paths are correct.
fprintf(1, 'Color dir: ');
disp(colorData.mDir);
fprintf(1, 'IR dir: ');
disp(irData.mDir);

cameraID = input('Camera ID number = ');


fprintf(1, 'Constants obtained.\n\n');

% Opens the GUI component if it exists.
reopenGUI
