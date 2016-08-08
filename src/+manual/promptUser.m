function repeatSelection = promptUser(validIn, warning, error)
% promptUser Open two directory dialog box with prompts
%   repeatSelection = promptUser(validIn, warning, error)
%   displays the exception message then propmts the user for a response
%   depending on the exception level.

valid = validIn;

if valid && isempty(warning),
    fprintf(1, 'The image set is valid.');
    fprintf(1, '\n');

    repeatSelection = false;

elseif valid
    fprintf(1, warning);
    fprintf(1, '\n');

    tempCheck = input('Use image set anyways? ([] = Yes, Number = No) ');

    if isempty(tempCheck)
        repeatSelection = false;
    else
        repeatSelection = true;
    end

else
    fprintf(2, error);
    fprintf(2, '\n');

    tempCheck = input('Select different image sets? ([] = Yes, Number = No) ');

    if isempty(tempCheck)
        repeatSelection = true;
    else
        repeatSelection = false;
    end

end

end
