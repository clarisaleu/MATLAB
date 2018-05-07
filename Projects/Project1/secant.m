%% Our Code
%A function to solve for the Mach numbers for each value of the normalized
%area defined by the area a de Laval Nozzle & the area at the throat of the
%tube. Inputs a value k (the specific heat ratio of a gas) and returns all
%of the Mach values found for A between 1 and 4 using the modified secant
%method.
function y=secant(k)
mvals=[];

for A=1:.001:4
    f=@(M)(1/M).*((2/(k+1)).*(1+(k-1).*.5.*M.^2)).^((k+1)/(2.*(k-1)))-A;
    %Get Supersonic Mach Number
    supersonic=secanthelper(f,4,.0001,50);
    %Get Subsonic Mach Number
    subsonic=secanthelper(f,0,.0001,50);
    %Return both
    machnums=[supersonic;subsonic];
    mvals=[mvals machnums];
end

y=mvals;
end

%% Class Code
%A function that uses the Modified Secant Method For Root Solving. Inputs a
%function, initial guess, error tolerance, and max iterations.
function root=secanthelper(f,x0,err,maxit)
if x0==0
    x0=10.^-6;
end
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

