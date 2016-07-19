function my_calib ( loc_complete_auto )
%CALIB Summary of this function goes here
%   Detailed explanation goes here

if ~exist('loc_complete_auto', 'var'),
    loc_complete_auto = 0;
end

if loc_complete_auto,
    small_set_complete_auto_1;
else
    small_set_complete_auto_0;
end

complete_calib;

end

