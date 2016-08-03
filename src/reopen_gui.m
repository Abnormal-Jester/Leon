% reopen_gui reopens the calibration gui if it exists

if exist('calibGUIWindow', 'var'),
    figure(calibGUIWindow);
end
