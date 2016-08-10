function points = calculatePointArray(varargin)
%
%
%

narginchk(4, 4);

windowInfo = varargin{1};
cornerPoints = varargin{2};
boardSize = varargin{3};
ima = varargin{4};

winty = windowInfo(1);
wintx = windowInfo(2);

[Xc,~,~,~] = calibToolbox.cornerfinder(cornerPoints.',ima,winty,wintx); % the four corners

x = Xc(1,:)';
y = Xc(2,:)';


% Sort the corners:
x_mean = mean(x);
y_mean = mean(y);
x_v = x - x_mean;
y_v = y - y_mean;

theta = atan2(-y_v,x_v);
[~,~] = sort(theta);

[~,ind] = sort(mod(theta-theta(1),2*pi));

%ind = ind([2 3 4 1]);

ind = ind([4 3 2 1]); %-> New: the Z axis is pointing uppward

x = x(ind);
y = y(ind);
x1= x(1); x2 = x(2); x3 = x(3); x4 = x(4);
y1= y(1); y2 = y(2); y3 = y(3); y4 = y(4);

%{

% Find center:
p_center = cross(cross([x1;y1;1],[x3;y3;1]),cross([x2;y2;1],[x4;y4;1]));
x5 = p_center(1)/p_center(3);
y5 = p_center(2)/p_center(3);

% center on the X axis:
x6 = (x3 + x4)/2;
y6 = (y3 + y4)/2;

% center on the Y axis:
x7 = (x1 + x4)/2;
y7 = (y1 + y4)/2;

% Direction of displacement for the X axis:
vX = [x6-x5;y6-y5];
vX = vX / norm(vX);

% Direction of displacement for the X axis:
vY = [x7-x5;y7-y5];
vY = vY / norm(vY);

% Direction of diagonal:
vO = [x4 - x5; y4 - y5];
vO = vO / norm(vO);

delta = 30;

%}

% Try to automatically count the number of squares in the grid

n_sq_x1 = calibToolbox.count_squares(ima,x1,y1,x2,y2,wintx);
n_sq_x2 = calibToolbox.count_squares(ima,x3,y3,x4,y4,wintx);
n_sq_y1 = calibToolbox.count_squares(ima,x2,y2,x3,y3,wintx);
n_sq_y2 = calibToolbox.count_squares(ima,x4,y4,x1,y1,wintx);

% If could not count the number of squares, give a warning

boardFailure = (n_sq_x1~=n_sq_x2)||(n_sq_y1~=n_sq_y2);
boardFailure = (~boardFailure)||(n_sq_x1~=boardSize(1)-2);
boardFailure = (~boardFailure)||(n_sq_y1~=boardSize(2)-2);

if boardFailure
    disp('Warning: Could not count the number of squares in the grid.');
end

n_sq_x = boardSize(1) - 2;
n_sq_y = boardSize(2) - 2;

% Compute the inside points through computation of the planar homography (collineation)

a00 = [x(1);y(1);1];
a10 = [x(2);y(2);1];
a11 = [x(3);y(3);1];
a01 = [x(4);y(4);1];


% Compute the planar collineation: (return the normalization matrix as well)

[Homo,~,~] = calibToolbox.compute_homography([a00 a10 a11 a01],[0 1 1 0;0 0 1 1;1 1 1 1]);


% Build the grid using the planar collineation:

x_l = ((0:n_sq_x)'*ones(1,n_sq_y+1))/n_sq_x;
y_l = (ones(n_sq_x+1,1)*(0:n_sq_y))/n_sq_y;
pts = [x_l(:) y_l(:) ones((n_sq_x+1)*(n_sq_y+1),1)]';

XX = Homo*pts;
XX = XX(1:2,:) ./ (ones(2,1)*XX(3,:));

%{
% Complete size of the rectangle

W = n_sq_x*dX;
L = n_sq_y*dY;
%}



%%%%%%%%%%%%%%%%%%%%%%%% ADDITIONAL STUFF IN THE CASE OF HIGHLY DISTORTED IMAGES %%%%%%%%%%%%%

% Np = (n_sq_x+1)*(n_sq_y+1);

%% Finds the exact corners at every points!
grid_pts = calibToolbox.cornerfinder(XX,ima,winty,wintx);

grid_pts = grid_pts.';
points = zeros(size(grid_pts));

x = boardSize(1) - 1; % 6
y = boardSize(2) - 1; % 9

for i = 1:y,
    low = x*(i-1)+1;
    high = x*(y-i)+1;

    points(low:low+x-1,:) = grid_pts(high:high+x-1,:);
end

return;

end
