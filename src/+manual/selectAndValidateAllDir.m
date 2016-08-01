function [ colorDir, irDir ] = selectAndValidateAllDir
%SELECTANDVALIDATEALLDIR Obtains the directory to valid color and ir image sets.
%   [COLORDIR, IRDIR] = SELECTANDVALIDATEALLDIR
%   makes the user select a directory, generates an exception, handles the
%   exception, then throws the exception if the function failed.

valid = false;
repeatSelection = true;

while repeatSelection

    [colorDir, irDir] = selectAllDir;
    [valid, exception] = validateAllDir(dirRight, dirLeft);
    [repeatSelection] = promptUser(valid, exception);

end

if ~valid
    throw exception;
end

end
