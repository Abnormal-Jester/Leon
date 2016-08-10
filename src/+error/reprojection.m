
fHandle = figure;

try
    showReprojectionErrors(stereoParams);
catch ME
    close(fHandle);
    clearvars fHandle;
    rethrow(ME);
end

clearvars fHandle;
