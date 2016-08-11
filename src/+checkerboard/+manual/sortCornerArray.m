function cornerPointArray = sortCornerArray(cornerPointArrayIn)
% sortCornerArray Sorts the corner points to go clockwise starting with the
% top-left corner
%   cornerPointArray = sortCornerArray(cornerPointArrayIn)
%   assuming the shape of the rectangle is not too deformed the function uses
%   algorithms to sort the corner points to go clockwise starting with the top-
%   left corner.

% initialize the new corner point Array
cornerPointArray = zeros(4, 2);

% split the corner point array
x = cornerPointArrayIn(:, 1);
y = cornerPointArrayIn(:, 2);

% calculate the distance from the origin
% the closest point to the origin is the first point and furthest point is the
% third point
d = (x-min(x)).^2 + (y-min(y)).^2;
[~, dMinIndex] = min(d);
cornerPointArray(1, :) = cornerPointArrayIn(dMinIndex, :);



d = (max(x)-x).^2 + (max(y)-y).^2;
[~, dMaxIndex] = min(d);
cornerPointArray(3, :) = cornerPointArrayIn(dMaxIndex, :);

% obtain the index of the points that have not been used yet
r = zeros(1, 2);
index = 1;
for count = 1:4
    if (count ~= dMinIndex) && (count ~= dMaxIndex)
        r(index) = count;
        index = index + 1;
    end
end

% put the point further to the right in the 2nd position
if x(r(1)) > x(r(2))
    cornerPointArray(2, :) = cornerPointArrayIn(r(1), :);
    cornerPointArray(4, :) = cornerPointArrayIn(r(2), :);
else
    cornerPointArray(2, :) = cornerPointArrayIn(r(2), :);
    cornerPointArray(4, :) = cornerPointArrayIn(r(1), :);
end

end
