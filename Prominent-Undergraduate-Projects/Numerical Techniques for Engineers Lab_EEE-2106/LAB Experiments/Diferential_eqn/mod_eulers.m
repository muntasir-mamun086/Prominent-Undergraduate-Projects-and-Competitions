clc;
clear;
% First step- Input and File Creation
a = input('Enter your Function : ','s');
fileID = fopen('fofx.m','w');
fprintf(fileID,'function y = fofx(x,y)\n\t y = %s; \n end',a);
% Second step- Parameters Input
s = input('Enter the number of sub-division :  ');
x0 = input('Enter the initial value of x :  ');
y0 = input('Enter the initial value of y :  ');
x = input('Enter the  value of x :  ');
% Third step- Calculate step size
if x > x0
    h = (x - x0) / s;
else
    h = (x0 - x) / s;
end
% Fourth step- Initialize x values
for j = 1 : s+1
if j == 1
        x(j) = x0;
else
        x(j) = x(j-1) + h;
end
end
% Fifth step- Modified Euler Loop
sy(1) = y0;
sy(2) = y0 + h * fofx(x0, y0);
for k = 1 : s
for m = 1 : 10000
if m == 1
            yy(m+1) = sy(k) + (h/2) * (fofx(x(k), sy(k)) + fofx(x(k+1), sy(m+1)));
else
            yy(m+1) = sy(k) + (h/2) * (fofx(x(k), sy(k)) + fofx(x(k+1), yy(m)));
end
        str_yy(m) = yy(m+1);
if m > 1
            d = abs(str_yy(m) - str_yy(m-1));
if d < 0.00001
                sy(k+1) = str_yy(m);
                y(k) = str_yy(m);
break;
end
end
end
end
% Sixth step- Display the result
fprintf('The Solution of the function is : %0.7f\n', y(s));