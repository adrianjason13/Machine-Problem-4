function [] = problem4()
height = 0;
vo = 0;
angle_in_degrees = 0;
x_accel = 0;
y_accel = 0;

defaultValue = {num2str(height), num2str(vo), num2str(angle_in_degrees), num2str(x_accel),num2str(y_accel)};
titleBar = 'Enter values';
Inputs = {'the initial height of the projectile above the ground in meters : ', 
    'the magnitude of the velocity in m/s : ', 
    'the angle in degrees with respect to the +?-axis at which the projectile is fired : ', 
    'the x-component of the acceleration, considering the sign, in m/s^2 : ',
    'the y-component of the acceleration, considering the sign, in m/s^2 : '};
user_input = inputdlg(Inputs, titleBar, 1, defaultValue, 'on');
Value1 = str2double(user_input{1});
Value2 = str2double(user_input{2});
Value3 = str2double(user_input{3});
Value4 = str2double(user_input{4});
Value5 = str2double(user_input{5});

if Value5 == 0
    Value5 = str2double(user_input{5});
    error("There is no Free Fall, Please Input a non zero vertical acceleration")   
end
height = Value1;
vo = Value2;
angle_in_degrees = Value3;
x_accel = Value4;
y_accel = Value5;
xi_accel = 0;

rad = deg2rad(angle_in_degrees);
vx = vo*cos(rad);
vy = vo*sin(rad);
dist = ((vy.^2) - (4*(1/2*y_accel)*height));
dsqrt = sqrt(dist);
t1 = (-vy + dsqrt )/ y_accel;
t2 = (-vy - dsqrt )/ y_accel;

 
if t1 <= 0
    t1 = t2;
    xi = vx*(linspace(0,t1)) + 1/2*xi_accel*linspace(0,t1).^2;
    yi = vy*(linspace(0,t1)) + 1/2*y_accel*linspace(0,t1).^2;
else
    xi = vx*(linspace(0,t1)) + 1/2*xi_accel*linspace(0,t1).^2;
    yi = vy*(linspace(0,t1)) + 1/2*y_accel*linspace(0,t1).^2;
end

if t1 <= 0
    t1 = t2;
    xni = vx*(linspace(0,t1)) + 1/2*x_accel*linspace(0,t1).^2;
    yni = vy*(linspace(0,t1)) + 1/2*y_accel*linspace(0,t1).^2;
else
    xni = vx*(linspace(0,t1)) + 1/2*x_accel*linspace(0,t1).^2;
    yni = vy*(linspace(0,t1)) + 1/2*y_accel*linspace(0,t1).^2;

end
plot(xi,yi,'g')
hold on;
plot(xni,yni,'--b')
hold off;
legend('Graph of Ideal Motion','Graph of Non-Ideal Motion')
title('Projectile Motion')
xlabel('Trajectory in the X direction')
ylabel('Trajectory in the Y direction')
end