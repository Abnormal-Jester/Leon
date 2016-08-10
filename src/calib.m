function calib(i)
% calib Runs the simple calibration tool
% Wrapper for the calib_gui script

if nargin == 0
    gui.calib_gui;
else
    if i == 0
        gui.calib_gui;
    else
        gui.calib_gui_simple
    end
end

end
