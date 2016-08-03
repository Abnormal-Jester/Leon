function cameraId = inputCameraId(defaultId)
% inputCameraId Prompts the user for the id of the camera.
%   cameraId = inputCameraId
%   cameraId = inputCameraId(defaultId)

if nargin == 0
    defaultId = 0;
else

try
    cameraId = input(['Camera ID number (' num2str(defaultId) ') = ']);

    if isblank(cameraId),
        cameraId = defaultId;
    end
catch
    cameraId = defaultId;
end

end
