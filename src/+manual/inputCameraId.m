function cameraId = inputCameraId(defaultId)
%inputCameraId Prompts the user for the id of the camera.
%   cameraId = inputCameraId
%   cameraId = inputCameraId(defaultId)

if nargin == 0
    defaultId = 0;
else

try
    cameraId = input(['Camera ID number (' num2str(defaultId) ') = ']);
    % Considered 'inputdlg', but it slowed the process because the user has
    % to click on the 'ok' button and cannot press enter. A custom function
    % may be implemented in the future.

    if isblank(cameraId),
        cameraId = defaultId;
    end
catch
    cameraId = defaultId;
end

end
