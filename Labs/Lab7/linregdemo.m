%A script to compute the linear regression line for the velocity data from
%class along with the correlation coefficient and a plot of the data.

%Get the data into MATLAB and store the independent (x) and dependent (y)
%data.
A=load('velocity.txt');
x=A(1,:);
y=A(2,:);

%We'll need a few values in our computations. I couldn't find a better way
%to pick off the number of data points.
xbar=mean(x);
ybar=mean(y);
n=size(A);
n=length(x)

%Compute the slope, y-intercept, and correlation coefficient using the 
%formulas from class.
m=(n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.*x)-(sum(x))^2);
b=ybar-m*xbar;
r=sqrt((sum((y-ybar).^2)-sum((y-m*x-b).^2))/(sum((y-ybar).^2)));

%Create the approximate y-values and plot them.
linreg=m*x+b;
plot(x,y,'*',x,linreg);
title('Velocity vs Drag Force');
legend('Data','Linear Regression Line');
xlabel('Velocity, m/s');
ylabel('Drag Force, N');

%I couldn't figure out a cleaner way of displaying data, but I think some
%of you do!
str1=sprintf('The slope of the regression line is %f',m);
str2=sprintf('The y-intercept of the regression line is %f',b);
str3=sprintf('The correlation coefficient is %f',r);
disp(str1)
disp(str2)
disp(str3)
