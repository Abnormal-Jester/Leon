function [ colorDir, irDir ] = selectAllDir (startPath)
%SELECTALLDIR Double open directory dialog box
%   DIRECTORYNAME = UIGETDIR(STARTPATH)
%   displays two dialog boxs one after another for the user to browse through
%   the directory structure and select the color image directory and ir
%   image directory.
%
%   The STARTPATH parameter determines the initial folder in which the
%   dialog box opens.
%
%   See also UIGETDIR

narginchk(0,1);

if nargin == 0,
    startPath = '';
end

dirPrompt = 'Select the Color image directory.\n';
fprintf(1, dirPrompt);
colorDir = uigetdir(startPath, dirPrompt);

% Sets the search for the ir directory in the parent of the color directory.
parentDir = fileparts(colorDir);

dirPrompt = 'Select the IR image directory.\n';
fprintf(1, dirPrompt);
irDir = uigetdir(parentDir, dirPrompt);

end
