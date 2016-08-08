% create_all_image_set Use the directories to create image sets


manual.ensure_constants_obtained;

fprintf(1, 'Creating image sets...\n');

% Create the image sets
colorImageSet = imageSet(colorDir);
irImageSet = imageSet(irDir);

fprintf(1, 'Image sets created.\n\n');

if checkerboardProgress < 1
    checkerboardProgress = 1;
end
