% check_constants_obtained checks if the calibration constants have values

constantsObtained = true;

if ~exist('cameraId', 'var')
    constantsObtained = false;
end

if ~exist('squareSize', 'var')
    constantsObtained = false;
end

if ~exist('colorDir', 'var')
    constantsObtained = false;
end

if ~exist('irDir', 'var')
    constantsObtained = false;
end
