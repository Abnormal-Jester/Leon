function calib(mode),

% calib (mode)
%   Runs the simple calibration tool.
%   Any other value for mode will run the full calibration tool.

if nargin < 1,
    calibGUI;
else
    calibGUIFull;
end

end
