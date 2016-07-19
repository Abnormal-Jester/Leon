
fprintf(1, 'Obtaining constants...\n');

defaultSquareSize = 73;

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

squareSize = input(['Size of a side of each square ([]=' num2str(defaultSquareSize) 'mm) = ']);
if isempty(squareSize), squareSize = defaultSquareSize; end;

dX = squareSize;
dY = squareSize;

fprintf(1, '\n');

fprintf(1, 'Color dir: ');
disp(colorDir);
fprintf(1, 'IR dir: ');
disp(irDir);

cameraID = input('Camera ID number = ');

fprintf(1, 'Constants obtained.\n\n');

if ishandle(1),
    figure(1);
end