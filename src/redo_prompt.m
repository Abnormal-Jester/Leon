redo_able = 1;

if exist('ima_proc', 'var')
    for kk = image_numbers,
        if ~exist(['n_sq_x_' num2str(kk)], 'var'),
            redo_able = 0;
        end
    end;
else
    redo_able = 0;
end

if redo_able,

    more_redoes = 1;

    while (more_redoes~=0);
        redo_point
    end
    fprintf(1,'done\n');
else
    fprintf(1,'Finish ''Extract grid corners'' before using ''Redo''\n');
end