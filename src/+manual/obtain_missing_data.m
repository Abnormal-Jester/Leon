% obtain_missing_data obtains all the constants required to calibrate the camera

import manual.*;

fprintf('Obtaining missing data...\n');

if ~exist('cameraId', 'var')
    check_and_input_camera_id;
end

if ~exist('squareSize', 'var')
    check_and_input_square_size;
end

if ~exist('colorDir', 'var') || ~exist('irDir', 'var')
    obtainValidDirectories;
end

check_constants_obtained;

fprintf('Missing data obtained.\n\n');
