% check_and_input_camera_id Prompts the user for the id of the camera

if exist('cameraId', 'var')
    [cameraId] = inputCameraId(cameraId);
else
    [cameraId] = inputCameraId;
end

check_constants_obtained;
