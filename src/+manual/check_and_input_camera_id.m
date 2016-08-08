% check_and_input_camera_id Prompts the user for the id of the camera
%   uses the current value of cameraId as the default value if it exists.

if exist('cameraId', 'var')
    [cameraId] = inputCameraId(cameraId);
else
    [cameraId] = inputCameraId;
end
