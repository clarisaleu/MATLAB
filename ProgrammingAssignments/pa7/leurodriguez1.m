%% Programming Assignment #7 - Problem #1
%% Created By: Clarisa Leu-Rodriguez

%A function that implements Heun's method for first order ordinary
%differential equations over a given interval with a specified initial
%conidition, step-size, and relative approximate error (epsilon).

%% Parameters:
%ode = First Order Differential of the form (dy/dx) = f(x,y); rangeX =
%Interval to solve ode over [xStart,xEnd]; initConidition = Initial
%conditions [x0,y0]; h = Step-size to increment over rangeX; epsilon =
%Specified error tolerance when computing correlating x & y values.

%% Returns:
% xValsResp = Row vector containing solved for x-values with step size h
% starting at x0; yValsResp = Row vector containing solved for y-values
% below a specified error tolerance (epsilon).

function [xValsResp, yValsResp]=leurodriguez1(ode,rangeX,initCondition,h,epsilon)
format long;
if epsilon<0
    disp('Please enter a positive error tolerance.')
elseif rangeX(1)~=initCondition(1)
    disp('Please make sure your rangeX starts at 0.')
end

%Initialize given initial conditions & compute the first temporary y
%value to compare later.
initX=initCondition(1); initY=initCondition(2);
tempY=initY+ode(initX,initY)*h;

%Perform First Iteration to Compute Temporary Y-Value
newApproxY=initY+((ode(initX,initY)+ode(initX+h,tempY))./2).*h;

%Store Values to Return Later
xVals=[initX]; yVals=[initY];

%Iterate through rangeX to solve for all solutions below a specified error
%tolerance
xStart=rangeX(1); xEnd=rangeX(2);
for i=xStart+h:h:xEnd
    %Continue iterating through until you are below a specified error
    %tolerance epsilon for a specified value of X
    currX=i;
    %Store X-Values to return later.
    xVals=[xVals currX];
    while abs((tempY-newApproxY)./tempY)>epsilon
        tempY=newApproxY;
        newApproxY=initY+((ode(initX,initY)+ode(currX,tempY))./2).*h;
    end
    %Once we find the y-value corresponding to currX below epsilon, we'll
    %update initY & initX for the next iteration & store it to return
    %later.
    yVals=[yVals newApproxY];
    initY=newApproxY;
    initX=currX;
    tempY=initY+ode(initX,initY)*h;
end

%Return Values
xValsResp=xVals;
yValsResp=yVals;

end