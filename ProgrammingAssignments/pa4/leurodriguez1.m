%Problem 1 - A function that inputs two constants A and B, a row vector
%containing the initial guesses for x and y ([x0,y0]), and error tolerance.
%Computes the solution to the non-linear system of f and g as defined in
%PA4 using the Newton-Raphson mthod.

function y = leurodriguez1(A,B,initGuesses,errtol)
format short
maxit=500;
x0=initGuesses(1);
y0=initGuesses(2);
f=@(x,y) exp(A.*x)+y-(.5.*(y.^2))-2.5;
g=@(x,y) B.*y-(4.*cos(3.*sqrt(x)));

%Partials
dfx=@(x,y)A.*exp(A.*x);
dfy=@(x,y)1-y;
dgx=@(x,y)(2.*sqrt(x)).*sin(3.*sqrt(x))./x;
dgy=@(x,y)B;

J=@(x,y) dfx(x,y)*dgy(x,y)-dfy(x,y)*dgx(x,y);
x1=x0-(f(x0,y0)*dgy(x0,y0)-g(x0,y0)*dfy(x0,y0))/J(x0,y0);
y1=y0-(g(x0,y0)*dfx(x0,y0)-f(x0,y0)*dgx(x0,y0))/J(x0,y0);
err=sqrt(abs((x1-x0)/x1)^2+abs((y1-y0)/y1)^2);

i=0;
while i<maxit && err>errtol
    x0=x1;
    y0=y1;
    x1=x0-(f(x0,y0)*dgy(x0,y0)-g(x0,y0)*dfy(x0,y0))/J(x0,y0);
    y1=y0-(g(x0,y0)*dfx(x0,y0)-f(x0,y0)*dgx(x0,y0))/J(x0,y0);
    err=sqrt(abs((x1-x0)/x1)^2+abs((y1-y0)/y1)^2);
    i=i+1;
end

if i==maxit
    disp('Maximum iterations reached. Try a different initial guess.');
    y=[];
elseif isnan([x1,y1])==0
    y=[x1 y1];
else
    y=[];
end

end