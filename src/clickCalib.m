% Use the MATLAB toolbox results to automatically fill in the squares the
% toolbox was able to find. Allow manual corner selection for the rest of the
% images.

var2fix = 'map';
fixvariable;

dX_default = dX;
dY_default = dY;

if ~exist('n_ima', 'var'),
    return;
end;

check_active_images;

fprintf(1,'\nExtraction of the grid corners on the images\n');

if (exist('map', 'var')~=1), map = gray(256); end;

if exist('n_sq_x', 'var'),
    n_sq_x_default = n_sq_x;
end;

if exist('n_sq_y', 'var'),
    n_sq_y_default = n_sq_y;
end;


if ~exist('n_sq_x_default', 'var')||~exist('n_sq_y_default', 'var'),
    n_sq_x_default = 10;
    n_sq_y_default = 10;
end;

if ~exist('wintx_default', 'var')||~exist('winty_default', 'var'),
    wintx_default = max(round(nx/128),round(ny/96));
    winty_default = wintx_default;
    clear wintx winty
end;


if ~exist('wintx', 'var') || ~exist('winty', 'var'),
    clear_windows; % Clear all the window sizes (to re-initiate)
end;



if ~exist('dont_ask', 'var'),
    dont_ask = 1;
end;


if ~dont_ask,
    % Refocuses the window onto the Command Window for the input prompt
    commandwindow;

    ima_numbers = input('Number(s) of image(s) to process ([] = all images) = ');
else
    ima_numbers = [];
end;

if isempty(ima_numbers),
    ima_proc = 1:n_ima;
else
    ima_proc = ima_numbers;
end;


% Useful option to add images:
kk_first = ima_proc(1); %input('Start image number ([]=1=first): ');


if exist(['wintx_' num2str(kk_first)], 'var'),

    eval(['wintxkk = wintx_' num2str(kk_first) ';']);

    if isempty(wintxkk) || isnan(wintxkk),

        wintx = wintx_default;
        winty = winty_default;

    end;

else

    wintx = wintx_default;
    winty = winty_default;

end;


if ~dont_ask,

    % Refocuses the window onto the Command Window for the input prompt
    commandwindow;

    fprintf(1,'Do you want to use the automatic square counting mechanism (0=[]=default)\n');
    manual_squares = input('  or do you always want to enter the number of squares manually (1,other)? ');
    if isempty(manual_squares),
        manual_squares = 0;
    else
        manual_squares = ~~manual_squares;
    end;
else
    manual_squares = 0;
end;

% for kk = ima_proc,
%     for usefulkk = 1:sum(checkerboardPairsUsed),
%         clickImaCalib
%         fprintf(1, [num2str(kk) ', ' num2str(usefulkk)]);
%         pause;
%     end
% end


alphaNums = alphaOrderMake(n_ima);
[~,kkMax] = max(alphaNums)
usefulNums = alphaOrderMake(sum(checkerboardPairsUsed));
skip = 0;

for getkk = ima_proc,

    kk = alphaOrder(getkk, n_ima)

    if exist(['I_' num2str(kk)], 'var'),

        local_auto_fail = 0;
        good_squares = 0;
        first_try = checkerboardPairsUsed(getkk);

        if ~first_try
            skip = skip + 1;
        end

        while ~good_squares
            if first_try
                usefulkk = getkk - skip

                clickImaCalib;
                first_try = 0;
            else
                manualClickImaCalib;
            end

            if local_auto_fail,
                manualClickImaCalib;
                local_auto_fail = 0;
            end

        end

        active_images(kk) = 1;
    else
        eval(['dX_' num2str(kk) ' = NaN;']);
        eval(['dY_' num2str(kk) ' = NaN;']);

        eval(['wintx_' num2str(kk) ' = NaN;']);
        eval(['winty_' num2str(kk) ' = NaN;']);

        eval(['x_' num2str(kk) ' = NaN*ones(2,1);']);
        eval(['X_' num2str(kk) ' = NaN*ones(3,1);']);

        eval(['n_sq_x_' num2str(kk) ' = NaN;']);
        eval(['n_sq_y_' num2str(kk) ' = NaN;']);
    end;
end;


check_active_images;



% Fix potential non-existing variables:

for kk = 1:n_ima,
    if ~exist(['x_' num2str(kk)], 'var'),
        eval(['dX_' num2str(kk) ' = NaN;']);
        eval(['dY_' num2str(kk) ' = NaN;']);

        eval(['x_' num2str(kk) ' = NaN*ones(2,1);']);
        eval(['X_' num2str(kk) ' = NaN*ones(3,1);']);

        eval(['n_sq_x_' num2str(kk) ' = NaN;']);
        eval(['n_sq_y_' num2str(kk) ' = NaN;']);
    end;

    if ~exist(['wintx_' num2str(kk)], 'var') || ~exist(['winty_' num2str(kk)], 'var'),

        eval(['wintx_' num2str(kk) ' = NaN;']);
        eval(['winty_' num2str(kk) ' = NaN;']);

    end;
end;

string_save = 'save calib_data active_images ind_active wintx winty n_ima type_numbering N_slots first_num image_numbers format_image calib_name Hcal Wcal nx ny map dX_default dY_default dX dY wintx_default winty_default';

for kk = 1:n_ima,
    string_save = [string_save ' X_' num2str(kk) ' x_' num2str(kk) ' n_sq_x_' num2str(kk) ' n_sq_y_' num2str(kk) ' wintx_' num2str(kk) ' winty_' num2str(kk) ' dX_' num2str(kk) ' dY_' num2str(kk)];
end;

eval(string_save);

if ishandle(1),

    set(1, 'HandleVisibility', 'off');
    close all;
    set(1, 'HandleVisibility', 'on');
    figure(1);
else
    close all;
end

disp('done');
return;
