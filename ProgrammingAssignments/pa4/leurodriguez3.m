%Problem 3 - A script that linearizes/plots the model y=axe^(bx) based on a
%set of given data. Uses linear regresssion to find the best a and b for
%the given model and computes the correlation coefficient of the modeled
%data versus the actual data.

%Given data
xVals=[.1,.2,.4,.6,.9,1.3,1.5,1.7,1.8];
yVals=[.75,1.25,1.45,1.25,.85,.55,.35,.28,.18];

xbar=mean(xVals);
z=log(yVals./xVals);
n=length(xVals);
zbar=mean(z);
m=(n*sum(xVals.*z)-sum(xVals)*sum(z))/(n*sum(xVals.*xVals)-(sum(xVals))^2);
a=exp(zbar-m*xbar);
x=0:0.01:2;
y1=a.*x.*exp(m.*x);
r=sqrt((sum((z-zbar).^2)-sum((z-m.*xVals-log(a)).^2))/(sum((z-zbar).^2)));

%Plot
disp('Plotting...')
plot(x,y1,xVals,yVals,'*');
axis('equal')
title('Problem 3');
legend('Data','Exponential Regression Line');
xlabel('x');
ylabel('y');

%Correlation Coefficient
disp('The Correlation Coefficient is:')
disp(r)