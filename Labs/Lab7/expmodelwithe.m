%A function that returns the model of the form y=ae^mx given a set of data
%x and y
function [y,r] = expmodelwithe(x,y)
if length(x)~=length(y)
    disp('Please enter two arrays of the same size.')
else
    xbar=mean(x);
    z=log(y);
    n=length(x);
    zbar=mean(z);
    %Perform least squares regress on (x,z) pairs
    m=(n*sum(x.*z)-sum(x)*sum(z))/(n*sum(x.*x)-(sum(x))^2);
    a=exp(zbar-m*xbar);
    r=sqrt((sum((z-zbar).^2)-sum((z-m*x-b).^2))/(sum((z-zbar).^2)));
    y=a.*exp(m.*x);
end
end

