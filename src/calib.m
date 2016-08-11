function calib(i)
% calib Runs the simple calibration tool
% Wrapper for the calib_gui script

if nargin == 0
    gui.calib_gui_simple;
else
    if i == 0
        gui.calib_gui_simple;
    else
        gui.calib_gui;
    end
end

end
