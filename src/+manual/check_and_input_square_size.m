% check_and_input_square_size Prompts the user for the size of the checkerboard squares
%   uses the current value of squareSize as the default value if it exists.

if exist('squareSize', 'var')
    [squareSize] = inputSquareSize(squareSize);
else
    [squareSize] = inputSquareSize;
end

check_constants_obtained;
