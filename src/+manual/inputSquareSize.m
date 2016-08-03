function squareSize = inputSquareSize(defaultSquareSize)
% inputSquareSize Prompts the user for the size of the checkerboard squares
%   squareSize = inputSquareSize
%   squareSize = inputSquareSize(defaultSquareSize)

if nargin == 0
    defaultSquareSize = 73;
end

try
    squareSize = input(['Camera ID number (' num2str(defaultSquareSize)...
        ') = ']);

    if isblank(squareSize),
        squareSize = defaultSquareSize;
    end
catch
    squareSize = defaultSquareSize;
end

end
