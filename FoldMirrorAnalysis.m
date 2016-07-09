close all; clear all;
theta0 = 27;  % TIR limit of waveguide
m0 = tand(theta0);   %slope of a ray in global coordinates

theta_tilt = linspace(0,30,31);   %tilt of panels

theta_turn(1,:) = 90 + theta_tilt;
theta_turn(2,:) = 90 - theta_tilt;


x0 = -1./tand(theta_turn+theta0);  %calculates extension to prevent retro-reflection

theta_fold = theta_turn/2;    %angle of fold mirror 
m_fold = tand(theta_fold);    %slope 

x_extend  = (-m_fold.*x0 -1)./(m0-m_fold);  %intersection of mirror and boundary ray
y_extend = m0*x_extend;

d_extend = sqrt(x_extend.^2 + y_extend.^2); %distance to intersection

h_out = d_extend.*cosd(theta0);    %perpendicular distance of output channel

couplerWidth = sum(h_out);
subplot(1,2,1);
plot(theta_tilt,couplerWidth,'r'); grid on; title('Overall dimension increase')
hold on;plot(theta_tilt,h_out);

legend('Combined Turns','Tight Turn','Lesser Turn')
subplot(1,2,2);
plot(theta_tilt,d_extend'); hold on 
plot(theta_tilt,x0','*-')