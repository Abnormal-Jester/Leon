function [ out ] = alphaOrderMake( max )
%ALPHA Summary of this function goes here
%   1   2   3   4   5   6   7   8   9   10  11  12  13
%   1   10  11  12  13  2   3   4   5   6   7   8   9

initialArray = 1:max;
strArray = textscan(num2str(initialArray),'%s');
strArray = sort(strArray{1,1});
out = cellfun(@str2double,strArray);

end

