% command_and_reopen Puts focus on the command windows, evaluates a string, then reopens the gui
%   Takes the variable 'run' as a parameter

try
    commandwindow;
    eval(run);

catch exception
    clearvars run;
    gui.reopen_gui;

    rethrow(exception);
end

clearvars run;

gui.reopen_gui;
