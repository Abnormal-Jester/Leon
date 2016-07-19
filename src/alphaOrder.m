function [ out ] = alphaOrder( cur, max, initialArray )
%ALPHA Summary of this function goes here
%   1   2   3   4   5   6   7   8   9   10  11  12  13
%   1   10  11  12  13  2   3   4   5   6   7   8   9

if ~exist('initialArray', 'var'),
    initialArray = 1:max;
end

strArray = textscan(num2str(initialArray),'%s');
strArray = sort(strArray{1,1});

out = str2double(strArray(cur));

end

