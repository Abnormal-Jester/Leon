function squareSize = inputSquareSize(defaultSquareSize)
% inputSquareSize Prompts the user for the size of the checkerboard squares
%   squareSize = inputSquareSize
%   squareSize = inputSquareSize(defaultSquareSize)

if nargin == 0
    defaultSquareSize = 73;
end

try
    squareSize = input(['Length of the side of each square in mm ('...
    num2str(defaultSquareSize) ') = ']);

    if isblank(squareSize) || squareSize <= 0
        squareSize = defaultSquareSize;
    end
catch
    squareSize = defaultSquareSize;
end

end
