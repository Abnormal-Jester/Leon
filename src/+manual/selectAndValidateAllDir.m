function [colorDir, irDir] = selectAndValidateAllDir
% selectAndValidateAllDir Obtains the directory to valid color and ir image sets
%   [colorDir, irDir] = selectAndValidateAllDir
%   makes the user select a directory, generates an exception, handles the
%   exception, then throws the exception if the function failed.

import manual.*;

valid = false;
repeatSelection = true;

while repeatSelection

    [colorDir, irDir] = selectAllDir;
    [valid, warning, tempError] = validateAllDir(colorDir, irDir);
    [repeatSelection] = promptUser(valid, warning, tempError);

end

if ~valid
    error('Failed to obtain valid image set directories');
end

end
