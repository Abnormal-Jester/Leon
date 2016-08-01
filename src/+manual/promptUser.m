function [repeatSelection] = promptUser(validIn, exception)
%PROMPTUSER Open two directory dialog box with prompts
%   REPEATSELECTION = PROMPTUSER(VALIDIN, EXCEPTION)
%   displays the exception message then propmts the user for a response
%   depending on the exception level.

valid = validIn;

fprintf(1, exception.msgtext);

if valid && exception.msgID == 0,
    repeatSelection = false;

elseif valid
    tempCheck = input('Use image set anyways? ([] = Yes, Number = No) ');

    if isempty(tempCheck)
        repeatSelection = false;
    else
        repeatSelection = true;
    end

else

    tempCheck = input('Select different image sets? ([] = Yes, Number = No) ');

    if isempty(tempCheck)
        repeatSelection = true;
    else
        repeatSelection = false;
    end

end



end
