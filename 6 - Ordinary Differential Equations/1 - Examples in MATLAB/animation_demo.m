clear; clf;

range = 360;
step = 1;
t = 0:step:range;
current = sin(deg2rad(t));

v = VideoWriter('animation_demo.avi');
open(v);
figure(1);

k = 1;
for i = 1:length(current)
    plot(t,current,'k','LineWidth',3);
    xlim([0 360]); ylim([-1.1 1.1]);
    xticks([0 45 90 135 180 225 270 315 360]);
    hold on;
    grid on;
    plot( t(i), current(i),'ro','MarkerSize',8,'MarkerFaceColor','r' );
    legend('current');
    hold off;
%     pause(0.05);
    M(k) = getframe;
    writeVideo(v,M(k));
    k = k + 1;
end

close(v);
clc;