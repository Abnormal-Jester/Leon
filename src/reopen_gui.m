% reopen_gui reopens the calibration gui if it exists

if exist('calabiGuiWindow', 'var'),
    figure(calabiGuiWindow);
end
