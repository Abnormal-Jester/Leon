% reopen_gui reopens the calibration gui if it exists

if exist('calibGuiWindow', 'var'),
    figure(calibGuiWindow);
end
