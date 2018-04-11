%A function that returns the taylor approximation of  e^x centered at x=0 to within 0.001
%of the true value.
function y = taylorapprox(x)
taylorold=1;
n=1;
taylornew=taylorold+((x.^(n))./factorial(n));
error=.001;
while abs(taylorold-taylornew)>error
   taylorold=taylornew;
   n=n+1;
   taylornew=taylorold+((x.^(n))./factorial(n));
   y=taylornew;
end
end


