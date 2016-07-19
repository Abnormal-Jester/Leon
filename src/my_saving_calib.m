
if ~exist('n_ima', 'var')||~exist('fc', 'var'),
   fprintf(1,'No calibration data available.\n');
   return;
end;

if ~exist('no_image', 'var'),
    no_image = 0;
end;

if ~exist('est_alpha', 'var'),
    est_alpha = 0;
end;

if ~exist('center_optim', 'var'),
    center_optim = 1;
end;

if ~exist('est_aspect_ratio', 'var'),
    est_aspect_ratio = 1;
end;

if ~exist('est_fc', 'var');
    est_fc = [1;1]; % Set to zero if you do not want to estimate the focal length (it may be useful! believe it or not!)
end;

if exist('est_dist', 'var'),
   if length(est_dist) == 4,
      est_dist = [est_dist ; 0];
   end;
end;

if exist('kc', 'var'),
   if length(kc) == 4;
      kc = [kc;0];
   end;
end;

if ~exist('fc_error', 'var'),
   fc_error = NaN*ones(2,1);
end;

if ~exist('kc_error', 'var'),
   kc_error = NaN*ones(5,1);
end;

if ~exist('cc_error', 'var'),
   cc_error = NaN*ones(2,1);
end;

if ~exist('alpha_c_error', 'var'),
   alpha_c_error = NaN;
end;

check_active_images;

if ~exist('solution_init', 'var'), solution_init = []; end;

for kk = 1:n_ima,
   if ~exist(['dX_' num2str(kk)], 'var'), eval(['dX_' num2str(kk) '= dX;']); end;
   if ~exist(['dY_' num2str(kk)], 'var'), eval(['dY_' num2str(kk) '= dY;']); end;
end;

if ~exist('solution', 'var'),
    solution = [];
end;

if ~exist('param_list', 'var'),
   param_list = solution;
end;

if ~exist('wintx', 'var'),
   wintx = [];
   winty = [];
end;

if ~exist('dX_default', 'var'),
   dX_default = [];
   dY_default = [];
end;

if ~exist('dX', 'var'),
    dX = [];
end;
if ~exist('dY', 'var'),
    dY = dX;
end;

if ~exist('Hcal', 'var'),
    Hcal = [];
end;
if ~exist('Wcal', 'var'),
    Wcal = [];
end;
if ~exist('map', 'var'),
    map = [];
end;

if ~exist('wintx_default', 'var')||~exist('winty_default', 'var'),
    wintx_default = max(round(nx/128),round(ny/96));
    winty_default = wintx_default;
end;

if ~exist('alpha_c', 'var'),
   alpha_c = 0;
end;

if ~exist('err_std', 'var'),
    err_std = [NaN;NaN];
end;

for kk = 1:n_ima,
   if ~exist(['y_' num2str(kk)], 'var'),
   	eval(['y_' num2str(kk) ' = NaN*ones(2,1);']);
   end;
   if ~exist(['n_sq_x_' num2str(kk)], 'var'),
   	eval(['n_sq_x_' num2str(kk) ' = NaN;']);
   	eval(['n_sq_y_' num2str(kk) ' = NaN;']);
   end; 
   if ~exist(['wintx_' num2str(kk)], 'var'),
   	eval(['wintx_' num2str(kk) ' = NaN;']);
   	eval(['winty_' num2str(kk) ' = NaN;']);
   end;
   if ~exist(['Tc_' num2str(kk)], 'var'),
    eval(['Tc_' num2str(kk) ' = [NaN;NaN;NaN];']);
   end;
   if ~exist(['omc_' num2str(kk)], 'var'),
    eval(['omc_' num2str(kk) ' = [NaN;NaN;NaN];']);
    eval(['Rc_' num2str(kk) ' = NaN * ones(3,3);']);
   end;
   if ~exist(['omc_error_' num2str(kk)], 'var'),
      eval(['omc_error_' num2str(kk) ' = NaN*ones(3,1);']);
   end;
   if ~exist(['Tc_error_' num2str(kk)], 'var'),
      eval(['Tc_error_' num2str(kk) ' = NaN*ones(3,1);']);
   end;
   if ~exist(['Rc_' num2str(kk)], 'var'),
    eval(['Rc_' num2str(kk) ' = rodrigues(omc_' num2str(kk) ');']);
   end;
end;

if ~exist('small_calib_image', 'var'),
    small_calib_image = 0;
end;

if ~exist('check_cond', 'var'),
    check_cond = 1;
end;

if ~exist('MaxIter', 'var'),
    MaxIter = 30;
end;

if ~exist('save_name', 'var'),
    save_name = 'Calib_Results';
end

if exist([ save_name '.mat'], 'file')==2,
    disp(['WARNING: File ' save_name '.mat was overwritten']);
    cont_save = 1;
else
    cont_save = 1;
end;

if cont_save,
    if ~exist('save_name', 'var'),
        save_name = 'Calib_Results';
    end;
    if exist('calib_name', 'var'),
        fprintf(1,['\nSaving calibration results under ' save_name '.mat\n']);
        string_save = ['save ' save_name ' center_optim param_list active_images ind_active est_alpha est_dist est_aspect_ratio est_fc fc kc cc alpha_c fc_error kc_error cc_error alpha_c_error  err_std ex x y solution solution_init wintx winty n_ima type_numbering N_slots small_calib_image first_num image_numbers format_image calib_name Hcal Wcal nx ny map dX_default dY_default KK inv_KK dX dY wintx_default winty_default no_image check_cond MaxIter'];
        for kk = 1:n_ima,
            string_save = [string_save ' X_' num2str(kk) ' x_' num2str(kk) ' y_' num2str(kk) ' ex_' num2str(kk) ' omc_' num2str(kk) ' Rc_' num2str(kk) ' Tc_' num2str(kk) ' omc_error_' num2str(kk) ' Tc_error_' num2str(kk) ' H_' num2str(kk) ' n_sq_x_' num2str(kk) ' n_sq_y_' num2str(kk) ' wintx_' num2str(kk) ' winty_' num2str(kk) ' dX_' num2str(kk) ' dY_' num2str(kk)];
        end;
    else
        fprintf(1,['\nSaving calibration results under ' save_name '.mat (no image version)\n']);
        string_save = ['save ' save_name ' center_optim param_list active_images ind_active est_alpha est_dist est_aspect_ratio est_fc fc kc cc alpha_c fc_error kc_error cc_error alpha_c_error err_std ex x y solution solution_init wintx winty n_ima nx ny dX_default dY_default KK inv_KK dX dY wintx_default winty_default no_image check_cond MaxIter'];
        for kk = 1:n_ima,
            string_save = [string_save ' X_' num2str(kk) ' x_' num2str(kk) ' y_' num2str(kk) ' ex_' num2str(kk) ' omc_' num2str(kk) ' Rc_' num2str(kk) ' Tc_' num2str(kk) ' omc_error_' num2str(kk) ' Tc_error_' num2str(kk) ' H_' num2str(kk) ' n_sq_x_' num2str(kk) ' n_sq_y_' num2str(kk) ' wintx_' num2str(kk) ' winty_' num2str(kk) ' dX_' num2str(kk) ' dY_' num2str(kk)];
        end;
    end;
    
    %fprintf(1,'To load later click on Load\n');
    eval(string_save);
end;
