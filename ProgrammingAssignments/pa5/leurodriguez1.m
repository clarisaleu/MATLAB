%% ENGR 204 - Numerical Methods: Spring '18
%% Pogramming Assignment #5 - Problem 1
%A function that inputs a number (x) and returns a row vector containing,
%in order: The estimate of erf(x) using a quadratic Lagrange interpolating
%polynomial, the true relative error for the Lagrange polynomial estimate,
%the cubic spline not-a-knot end condition estimate, and the true relative
%error for the spine estimate.

function y= leurodriguez1(x)
format long;
disp('Running PA5 Problem #1 for erf(x)...')
%Given data: values of erf(x)
data=[0,.5,1,1.5,2;0,.5205,.8427,.9661,.9953];
xData=data(1,:);
yData=data(2,:);


%Quadratic Lagrange Interpolating Polynomial Estimate
if x<=.75
    %If x is less than or equal to .75, use the Quadratic Lagrange
    %Interpolating Polynomial for the first 3 points in the given data set.
    xData1=xData(1:3);
    yData1=yData(1:3);
    L1=(x-xData1(2)).*(x-xData1(3))/((xData1(1)-xData1(2))*(xData1(1)-xData1(3)));
    L2=(x-xData1(1)).*(x-xData1(3))/((xData1(2)-xData1(1))*(xData1(2)-xData1(3)));
    L3=(x-xData1(1)).*(x-xData1(2))/((xData1(3)-xData1(1))*(xData1(3)-xData1(2)));
    polyEst=L1*yData1(1)+L2*yData1(2)+L3*yData1(3);
    err1=abs(polyEst-erf(x))/erf(x);
elseif x<=1.25 & x>.75
    %If x is less than or equal to 1.25 and greater than .75, use the
    %Quadratic Lagrange Interpolating Polynomial for the middle 3 points in
    %the given data set.
    xData2=xData(2:4);
    yData2=yData(2:4);
    L1=(x-xData2(2)).*(x-xData2(3))/((xData2(1)-xData2(2))*(xData2(1)-xData2(3)));
    L2=(x-xData2(1)).*(x-xData2(3))/((xData2(2)-xData2(1))*(xData2(2)-xData2(3)));
    L3=(x-xData2(1)).*(x-xData2(2))/((xData2(3)-xData2(1))*(xData2(3)-xData2(2)));
    polyEst=L1*yData2(1)+L2*yData2(2)+L3*yData2(3);
    err1=abs(polyEst-erf(x))/erf(x);
else
    %Otherwise, use the Quadratic Lagrange Interpolating Polynomial for the
    %last 3 points in the given data set.
    xData3=xData(3:5);
    yData3=yData(3:5);
    L1=(x-xData3(2)).*(x-xData3(3))/((xData3(1)-xData3(2))*(xData3(1)-xData3(3)));
    L2=(x-xData3(1)).*(x-xData3(3))/((xData3(2)-xData3(1))*(xData3(2)-xData3(3)));
    L3=(x-xData3(1)).*(x-xData3(2))/((xData3(3)-xData3(1))*(xData3(3)-xData3(2)));
    polyEst=L1*yData3(1)+L2*yData3(2)+L3*yData3(3);
    err1=abs(polyEst-erf(x))/erf(x);
end

%Cubic spline not-a-knot end condition estimate
yrn=spline(xData,yData,x);
splineEst=yrn;

%True Relative Error using the cubic spline estimate
err2=abs(splineEst-erf(x))/erf(x);

%Construct resulting row vector
y=[polyEst,err1,splineEst,err2];

end