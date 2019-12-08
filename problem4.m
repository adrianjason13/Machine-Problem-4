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
    'the ?-component of the acceleration, considering the sign, in m/s^2 : ',
    'the ?-component of the acceleration, considering the sign, in m/s^2 : '};
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


tfinal=(-vo*sind(angle_in_degrees)+sqrt((vo*sind(angle_in_degrees))^2-2*y_accel*height))/y_accel;
if tfinal<=0 || tfinal<(-vo*math.sin(angle_in_degrees)/y_accel)
    tfinal=(-vo*sind(angle_in_degrees)-sqrt((vo*sind(angle_in_degrees))^2-2*y_accel*height))/y_accel;
end
t = 0:0.001:tfinal;
y = height+vo.*sind(angle_in_degrees).*t+(1./2).*y_accel.*t.^2;
x = vo.*cosd(angle_in_degrees).*t+(1./2).*x_accel.*t.^2;
plot(x,y,'--')
grid on
axis tight
xlabel 'The Range'; 
ylabel 'The Height'; 
title 'Problem 5: Projectile Motion'
legend('trajectory')
end