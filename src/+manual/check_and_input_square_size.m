% check_and_input_square_size Prompts the user for the size of the checkerboard squares
%   uses the current value of squareSize as the default value if it exists.

import manual.*;

if exist('squareSize', 'var')
    [squareSize] = inputSquareSize(squareSize);
else
    [squareSize] = inputSquareSize;
end

fprintf(1, ['squareSize = ' num2str(squareSize) '\n']);
