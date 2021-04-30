clc
clear

run Constant_Matrix.m
design_mat = [5357;400;0.0586;0.2328;0.1158;0.1458]; % Optimized matrix
[row,column]=size(design_mat);
for i=1:column
    design_mat = design_mat(:,i);
    xz_values(i) = sim('Project_Model2020a',[0 10]);
end

st_val=90;                      % percentage of final value to be assumed as steady state
t0=1.8*log(1/(1-st_val*0.01));  % At st_val% of final value, steady state is achieved 
x = xz_values(1,1).xz([1:end-1],1);
z = xz_values(1,1).xz([1:end-1],2);

figure(2)
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);

for i=1:10:(length(x))
    plot(x(i)+xp,z(i)+yp);
    hold on
    plot([x(i) x(i)+xp(idivide(length(ang),int16(8)))],[z(i) z(i)+yp(idivide(length(ang),int16(8)))]);
    plot([x(i) x(i)+xp(idivide(3*length(ang),int16(8)))],[z(i) z(i)+yp(idivide(3*length(ang),int16(8)))]);
    plot([x(i) x(i)+xp(idivide(5*length(ang),int16(8)))],[z(i) z(i)+yp(idivide(5*length(ang),int16(8)))]);
    plot([x(i) x(i)+xp(idivide(7*length(ang),int16(8)))],[z(i) z(i)+yp(idivide(7*length(ang),int16(8)))]);
    hold off
    grid on;
    axis([-1.5*r 1.5*r -1.5*r 1.5*r]);
    frames(:, i) = getframe;
end

figure(3)
for i=1:10:(length(x))
    plot(x(i)+xp,z(i)+yp);
    hold on
    axis([-1.2*r 1.2*r -1.2*r 1.2*r]);
    grid on;
end
plot(xp,yp,'g','LineStyle','--','LineWidth',2);
hold on

figure(4)
plot(xz_values(1,1).tout,xz_values(1,1).xz([1:end-1],1))      % x vs time
title('X vs Time');
grid on;
figure(5)
plot(xz_values(1,1).tout,xz_values(1,1).force_x([1:end-1],1)) % xforce vs time
title('Fx vs Time');
grid on;
figure(6)
plot(xz_values(1,1).tout,xz_values(1,1).xz([1:end-1],2))      % z vs time
title('Z vs Time');
grid on;
figure(7)
plot(xz_values(1,1).tout,xz_values(1,1).force_z([1:end-1],1)) % zforce vs time
title('Fz vs Time');
grid on;
