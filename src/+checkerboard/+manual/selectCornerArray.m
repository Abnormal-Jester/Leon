function cornerPoints = selectCornerArray(windowInfo, ima)
% selectCornerArray Obtains the coordinate of the four corners of a
% checkerboard
%   cornerPoints = selectCornerArray(windowInfo, ima)
%   have the user click near each corner of the checkerboard and use a corner
%   finding tool to obtain more precise corner locations.

% search for corners within window
wintx = windowInfo(1);
winty = windowInfo(2);

% initialize the corner point array coordinate pair
x = zeros(4,1);
y = zeros(4,1);

% create the figure
figure(2);
image(ima);
colormap(gray(256));
title('Click on the four inner corners of the checkerboard ... Image');
disp('Click on the four inner corners of the checkerboard ...');

hold on;
for count = 1:4
    % user's click coordinates
    [xi,yi] = calibToolbox.ginput4(1);

    % corner finder tool coordinates
    [xxi] = calibToolbox.cornerfinder([xi;yi],ima,winty,wintx);
    xi = xxi(1);
    yi = xxi(2);

    % show where the computer has identified corners
    figure(2);
    plot(xi,yi,'+','color',[1.000 0.314 0.510],'linewidth',2);
    plot(xi + [wintx+.5 -(wintx+.5) -(wintx+.5) wintx+.5 wintx+.5],yi +...
        [winty+.5 winty+.5 -(winty+.5) -(winty+.5)  winty+.5],'-','color',...
        [1.000 0.314 0.510],'linewidth',2);

    % save the corner point
    x(count) = xi;
    y(count) = yi;

    % plot the line between the points
    plot(x(1:count),y(1:count),'-','color',[1.000 0.314 0.510],'linewidth',2);
    drawnow;
end;
% complete the rectangle
plot([x;x(1)],[y;y(1)],'-','color',[1.000 0.314 0.510],'linewidth',2);
drawnow;
hold off;

% output the corner point coordinate pair
cornerPoints = [x y];

end
