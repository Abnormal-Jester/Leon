function squareSize = obtainConstants

defaultSquareSize = 73;

% Refocuses the window onto the Command Window for the input prompt
commandwindow;

squareSize = input(['Size of a side of each square ([]=' num2str(defaultSquareSize) 'mm) = ']);
if isempty(squareSize), squareSize = defaultSquareSize; end;

end