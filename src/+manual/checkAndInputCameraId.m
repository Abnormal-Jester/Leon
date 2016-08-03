% checkAndInputCameraId Prompts the user for the id of the camera.
%   prompts the user for the id of the camera, using the current value of
%   cameraId as the default value.

if exist('cameraId', 'var')
    [cameraId] = inputCameraId(cameraId);
else
    [cameraId] = inputCameraId;
end
