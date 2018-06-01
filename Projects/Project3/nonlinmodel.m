%A helper function for fminsearch() which is a nonlinear programming solver
%built into MATLAB. nonlinmodel defines a function we want to model data
%based off of that can be minimized via fminsearch(). The a variable vector
%holds the coefficients that we want to solve for. The t variable vector
%represents the x-axis and the ym variable vector represents the y-axis.

function sumofsquares= nonlinmodel(a,t,ym)

%Create the regression model
yp=a(1).*exp(a(2).*t).*cos(a(3).*t+a(4));

%Create the sum of squares function.
sumofsquares=sum((yp-ym).^2);

end