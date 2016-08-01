function [ colorDir, irDir ] = selectAndValidateAllDir
%SELECTANDVALIDATEALLDIR Obtains the directory to valid color and ir image sets.
%   [COLORDIR, IRDIR] = SELECTANDVALIDATEALLDIR
%   makes the user select a directory, generates an exception, handles the
%   exception, then throws the exception if the function failed.

import manual.*;

valid = false;
repeatSelection = true;

while repeatSelection

    [colorDir, irDir] = selectAllDir;
    [valid, warning, error] = validateAllDir(colorDir, irDir);
    [repeatSelection] = promptUser(valid, warning, error);

end

if ~valid
    throw exception;
end

end
