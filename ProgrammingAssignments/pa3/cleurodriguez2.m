%Problem 2 - A Function that uses the Modified Secant Method For Root
%Solving. Inputs a function, initial guess, error tolerance, and max
%iterations.

function root=cleurodriguez2(f,x0,err,maxit)
if x0==0
    disp('Please choose another initial guess.')
else
    del=10.^-6;
    x1=x0-(del.*x0.*f(x0))./(f(x0+del.*x0)-f(x0));
    j=1;
    while abs((x1-x0)/x1)>err & j<maxit
        j=j+1;
        x0=x1;
        x1=x0-(del.*x0.*f(x0))./(f(x0+del.*x0)-f(x0));
    end
    if f(x1)>err %A double check to see if there is a root.
        disp('Method diverges. No root found.');
    else
        root=x1;
    end
end
end