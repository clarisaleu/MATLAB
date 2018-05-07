%A function that returns the least squares regression line given a set of
%data x and y
function [y,r] = linrega(x,y)
if length(x)~=length(y)
    disp('Please enter two arrays of the same size.')
else
    xbar=mean(x);
    ybar=mean(y);
    n=length(x);
    
    m=(n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.*x)-(sum(x))^2);
    b=ybar-m*xbar;
    
    r=sqrt((sum((y-ybar).^2)-sum((y-m*x-b).^2))/(sum((y-ybar).^2)));
    y=m*x+b;
end
end