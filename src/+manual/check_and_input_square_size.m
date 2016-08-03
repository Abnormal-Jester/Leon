% check_and_input_square_size Prompts the user for the size of the checkerboard squares.
%   prompts the user for the size of the checkerboard squares, using the
%   current value of squareSize as the default value.

if exist('squareSize', 'var')
    [squareSize] = inputSquareSize(squareSize);
else
    [squareSize] = inputSquareSize;
end
