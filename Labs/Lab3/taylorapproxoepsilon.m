%A function that returns the taylor approximation of  e^x centered at x=0
%to within epsilon of the true value.

function y = taylorapproxoepsilon(x,epsilon)
if epsilon <0
   disp('Sorry hoss, epsilon must be positive. Try again!')
else
taylorold=1;
n=1;
taylornew=taylorold+((x.^(n))./factorial(n));
error=epsilon;
while abs((taylorold-taylornew)./taylorold)>error
   taylorold=taylornew;
   n=n+1;
   taylornew=taylorold+((x.^(n))./factorial(n));
end
y=taylornew;
end


