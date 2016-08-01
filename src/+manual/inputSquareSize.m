function squareSize = inputSquareSize
%INPUTSQUARESIZE Prompts the user for the size of the checkerboard squares

defaultSquareSize = 73;

squareSize = input(['Size of a side of each square ([]='...
    num2str(defaultSquareSize) 'mm) = ']);

if isempty(squareSize),
    squareSize = defaultSquareSize;
end

end
