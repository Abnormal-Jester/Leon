function displayPointArrayOnImage(ima, cornerPoints, points)
%
%
%

x = [cornerPoints(:, 1); cornerPoints(1, 1)];
y = [cornerPoints(:, 2); cornerPoints(1, 2)];
px = points(:,1);
py = points(:,2);
dx = [x(1)+(x(4)-x(1))/2 y(1)+(y(4)-y(1))/2];
dy = [x(1)+(x(2)-x(1))/2 y(1)+(y(2)-y(1))/2];

figure(2);
image(ima);
colormap(gray(256));
hold on;

plot(x,y,'-','color',[0.394 0.953 0.449],'linewidth',1);
plot(x,y,'mo');
plot(x(1),y(1),'*m')
plot(px,py,'r+');
h2 = text(dx(1)-30,dx(2),'dX');
set(h2,'Color','g','FontSize',14);
h3 = text(dy(1),dy(2)-10,'dY');
set(h3,'Color','g','FontSize',14);
xlabel('Xc (in camera frame)');
ylabel('Yc (in camera frame)');
title('Extracted corners');
zoom on;
drawnow;
hold off;

end
