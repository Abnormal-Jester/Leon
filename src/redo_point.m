redo_num = input('Number of bad corner selection ([] = none) = ');
kk = redo_num;

if ~isempty(redo_num),
    if exist(['I_' num2str(kk)], 'var'),
        click_ima_calib;
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

    check_active_images;
else
    more_redoes = 0;
end