function root = newtonhelp(func,dfunc,x0,err)
%Implement Newton's method to find the root of a function func given the
%derivative dfunc and an initial guess x0. Continue until the relative
%error is less than err.

x1=x0-func(x0)/dfunc(x0);
maxit=500; %Maximum number of times we allow the routine to execute.
j=1;

%Build in a fail safe so that if the method diverges the computer won't get
%stuck.
while abs((x1-x0)/x1)>err & j<maxit
    j=j+1;
    x0=x1;
    x1=x0-func(x0)/dfunc(x0);
end

if func(x1)>err %A double check to see if we actually have a root.
    disp('Method diverges. No root found.');
else
    root=x1;
end

end

