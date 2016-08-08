function points = generateCheckerboard (boardSize, imageName);
% function: Short description
%
% Extended description

% Set
map = gray(256);


% Cleaned-up version of init_calib.m

fprintf(1,'\nProcessing image...\n');

I = double(imread(imageName));
if size(I,3)>1,
    I = 0.299 * I(:,:,1) + 0.5870 * I(:,:,2) + 0.114 * I(:,:,3);
end;

wintx = 5;
winty = 5;


fprintf(1,'Using (wintx,winty)=(%d,%d) - Window size = %dx%d      (Note: To reset the window size, run script clearwin)\n',wintx,winty,2*wintx+1,2*winty+1);
%fprintf(1,'Note: To reset the window size, clear wintx and winty and run ''Extract grid corners'' again\n');

figure(2);
imshow(rgb2gray(imread(imageName)));

figure(2);
% image(I);
% colormap(map);
set(2,'color',[1 1 1]);

title('Click on the four extreme corners of the rectangular pattern (first corner = origin)... Image ');

disp('Click on the four extreme corners of the rectangular complete pattern (the first clicked corner is the origin)...');

x= [];
y = [];
figure(2); hold on;
for count = 1:4,
    [xi,yi] = ginput4(1);
    [xxi] = cornerfinder([xi;yi],I,winty,wintx);
    xi = xxi(1);
    yi = xxi(2);
    figure(2);
    plot(xi,yi,'+','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    plot(xi + [wintx+.5 -(wintx+.5) -(wintx+.5) wintx+.5 wintx+.5],yi + [winty+.5 winty+.5 -(winty+.5) -(winty+.5)  winty+.5],'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    x = [x;xi];
    y = [y;yi];
    plot(x,y,'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    drawnow;
end;
plot([x;x(1)],[y;y(1)],'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
drawnow;
hold off;


%[x,y] = ginput4(4);

[Xc,good,bad,type] = cornerfinder([x';y'],I,winty,wintx); % the four corners

x = Xc(1,:)';
y = Xc(2,:)';


% Sort the corners:
x_mean = mean(x);
y_mean = mean(y);
x_v = x - x_mean;
y_v = y - y_mean;

theta = atan2(-y_v,x_v);
[junk,ind] = sort(theta);

[junk,ind] = sort(mod(theta-theta(1),2*pi));

%ind = ind([2 3 4 1]);

ind = ind([4 3 2 1]); %-> New: the Z axis is pointing uppward

x = x(ind);
y = y(ind);
x1= x(1); x2 = x(2); x3 = x(3); x4 = x(4);
y1= y(1); y2 = y(2); y3 = y(3); y4 = y(4);


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


figure(2);
image(I);
colormap(map);
hold on;
plot([x;x(1)],[y;y(1)],'g-');
plot(x,y,'og');
hx=text(x6 + delta * vX(1) ,y6 + delta*vX(2),'X');
set(hx,'color','g','Fontsize',14);
hy=text(x7 + delta*vY(1), y7 + delta*vY(2),'Y');
set(hy,'color','g','Fontsize',14);
hO=text(x4 + delta * vO(1) ,y4 + delta*vO(2),'O','color','g','Fontsize',14);
hold off;

% Try to automatically count the number of squares in the grid

n_sq_x1 = count_squares(I,x1,y1,x2,y2,wintx);
n_sq_x2 = count_squares(I,x3,y3,x4,y4,wintx);
n_sq_y1 = count_squares(I,x2,y2,x3,y3,wintx);
n_sq_y2 = count_squares(I,x4,y4,x1,y1,wintx);



% If could not count the number of squares, enter manually

if (n_sq_x1~=n_sq_x2)||(n_sq_y1~=n_sq_y2),


    disp('Could not count the number of squares in the grid. Enter manually.');
    n_sq_x = input(['Number of squares along the X direction ([]=' num2str(boardSize(1)) ') = ']); %6
    if isempty(n_sq_x), n_sq_x = boardSize(1); end;
    n_sq_y = input(['Number of squares along the Y direction ([]=' num2str(boardSize(2)) ') = ']); %6
    if isempty(n_sq_y), n_sq_y = boardSize(2); end;

else

    n_sq_x = n_sq_x1;
    n_sq_y = n_sq_y1;

end;

dX = 73;
dY = 73;

fprintf(1,['Size of each square along the X direction: dX=' num2str(dX) 'mm\n']);
fprintf(1,['Size of each square along the Y direction: dY=' num2str(dY) 'mm   (Note: To reset the size of the squares, clear the variables dX and dY)\n']);
%fprintf(1,'Note: To reset the size of the squares, clear the variables dX and dY\n');



% Compute the inside points through computation of the planar homography (collineation)

a00 = [x(1);y(1);1];
a10 = [x(2);y(2);1];
a11 = [x(3);y(3);1];
a01 = [x(4);y(4);1];


% Compute the planar collineation: (return the normalization matrix as well)

[Homo,Hnorm,inv_Hnorm] = compute_homography([a00 a10 a11 a01],[0 1 1 0;0 0 1 1;1 1 1 1]);


% Build the grid using the planar collineation:

x_l = ((0:n_sq_x)'*ones(1,n_sq_y+1))/n_sq_x;
y_l = (ones(n_sq_x+1,1)*(0:n_sq_y))/n_sq_y;
pts = [x_l(:) y_l(:) ones((n_sq_x+1)*(n_sq_y+1),1)]';

XX = Homo*pts;
XX = XX(1:2,:) ./ (ones(2,1)*XX(3,:));


% Complete size of the rectangle

W = n_sq_x*dX;
L = n_sq_y*dY;




%%%%%%%%%%%%%%%%%%%%%%%% ADDITIONAL STUFF IN THE CASE OF HIGHLY DISTORTED IMAGES %%%%%%%%%%%%%
figure(2);
hold on;
plot(XX(1,:),XX(2,:),'r+');
title('The red crosses should be close to the image corners');
hold off;

disp('If the guessed grid corners (red crosses on the image) are not close to the actual corners,');
disp('it is necessary to enter an initial guess for the radial distortion factor kc (useful for subpixel detection)');
quest_distort = input('Need of an initial guess for distortion? ([]=no, other=yes) ');

quest_distort = ~isempty(quest_distort);

if quest_distort,
    % Estimation of focal length:
    c_g = [size(I,2);size(I,1)]/2 + .5;
    f_g = Distor2Calib(0,[[x(1) x(2) x(4) x(3)] - c_g(1);[y(1) y(2) y(4) y(3)] - c_g(2)],1,1,4,W,L,[-W/2 W/2 W/2 -W/2;L/2 L/2 -L/2 -L/2; 0 0 0 0],100,1,1);
    f_g = mean(f_g);

    %script_fit_distortion

    satis_distort = 0;

    disp(['Estimated focal: ' num2str(f_g) ' pixels']);

    while ~satis_distort,

        k_g = input('Guess for distortion factor kc ([]=0): ');

        if isempty(k_g), k_g = 0; end;

        xy_corners_undist = comp_distortion2([x' - c_g(1);y'-c_g(2)]/f_g,k_g);

        xu = xy_corners_undist(1,:)';
        yu = xy_corners_undist(2,:)';

        [XXu] = projectedGrid ( [xu(1);yu(1)], [xu(2);yu(2)],[xu(3);yu(3)], [xu(4);yu(4)],n_sq_x+1,n_sq_y+1); % The full grid

        XX = (ones(2,1)*(1 + k_g * sum(XXu.^2))) .* XXu;
        XX(1,:) = f_g*XX(1,:)+c_g(1);
        XX(2,:) = f_g*XX(2,:)+c_g(2);

        figure(2);
        image(I);
        colormap(map);
        zoom on;
        hold on;
        %plot(f_g*XXu(1,:)+c_g(1),f_g*XXu(2,:)+c_g(2),'ro');
        plot(XX(1,:),XX(2,:),'r+');
        title('The red crosses should be on the grid corners...');
        hold off;

        satis_distort = input('Satisfied with distortion? ([]=no, other=yes) ');

        satis_distort = ~isempty(satis_distort);
    end;
end;
%%%%%%%%%%%%%%%%%%%%% END ADDITIONAL STUFF IN THE CASE OF HIGHLY DISTORTED IMAGES %%%%%%%%%%%%%



Np = (n_sq_x+1)*(n_sq_y+1);

disp('Corner extraction...');

grid_pts = cornerfinder(XX,I,winty,wintx); %%% Finds the exact corners at every points!

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

%save all_corners x y grid_pts

grid_pts = grid_pts - 1; % subtract 1 to bring the origin to (0,0) instead of (1,1) in matlab (not necessary in C)



ind_corners = [1 n_sq_x+1 (n_sq_x+1)*n_sq_y+1 (n_sq_x+1)*(n_sq_y+1)]; % index of the 4 corners
ind_orig = (n_sq_x+1)*n_sq_y + 1;
xorig = grid_pts(1,ind_orig);
yorig = grid_pts(2,ind_orig);
dxpos = mean([grid_pts(:,ind_orig) grid_pts(:,ind_orig+1)]');
dypos = mean([grid_pts(:,ind_orig) grid_pts(:,ind_orig-n_sq_x-1)]');


x_box_kk = [grid_pts(1,:)-(wintx+.5);grid_pts(1,:)+(wintx+.5);grid_pts(1,:)+(wintx+.5);grid_pts(1,:)-(wintx+.5);grid_pts(1,:)-(wintx+.5)];
y_box_kk = [grid_pts(2,:)-(winty+.5);grid_pts(2,:)-(winty+.5);grid_pts(2,:)+(winty+.5);grid_pts(2,:)+(winty+.5);grid_pts(2,:)-(winty+.5)];


figure(3);
image(I); colormap(map); hold on;
plot(grid_pts(1,:)+1,grid_pts(2,:)+1,'r+');
plot(x_box_kk+1,y_box_kk+1,'-b');
plot(grid_pts(1,ind_corners)+1,grid_pts(2,ind_corners)+1,'mo');
plot(xorig+1,yorig+1,'*m');
h = text(xorig+delta*vO(1),yorig+delta*vO(2),'O');
set(h,'Color','m','FontSize',14);
h2 = text(dxpos(1)+delta*vX(1),dxpos(2)+delta*vX(2),'dX');
set(h2,'Color','g','FontSize',14);
h3 = text(dypos(1)+delta*vY(1),dypos(2)+delta*vY(2),'dY');
set(h3,'Color','g','FontSize',14);
xlabel('Xc (in camera frame)');
ylabel('Yc (in camera frame)');
title('Extracted corners');
zoom on;
drawnow;
hold off;


Xi = reshape(([0:n_sq_x]*dX)'*ones(1,n_sq_y+1),Np,1)';
Yi = reshape(ones(n_sq_x+1,1)*[n_sq_y:-1:0]*dY,Np,1)';
Zi = zeros(1,Np);

Xgrid = [Xi;Yi;Zi];


% All the point coordinates (on the image, and in 3D) - for global optimization:

x = grid_pts;
X = Xgrid;

end
