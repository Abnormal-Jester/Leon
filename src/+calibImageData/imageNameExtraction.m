function [ imagePrefix, imageFormat ] = imageNameExtraction( imageSet )
%soloImageExtraction Summary of this function goes here
%   Detailed explanation goes here

fileName = char(imageSet.ImageLocation(1, 1));

[~,tempName,imageFormat] = fileparts(fileName);

imageFormat = imageFormat(2:end);

startIndex = regexp(tempName,'\d+$');

imagePrefix = tempName(1:startIndex-1);
% first_num = str2double(tempName(startIndex:end));

end
