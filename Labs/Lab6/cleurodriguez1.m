%Problem 1 - A script that finds all solutions to the nonlinear system
%described using the Newton-Raphson method.

format long;
f=@(y)acos(y./5)-((y^2)/2-y-1);
df=@(y)-1./(5.*sqrt(1-((y.^2)/25)))-y+1;
err=.0001;
sol=newtonhelp(f,df,0,err);
sol1=newtonhelp(f,df,2,err);
disp('The solutions are:')
disp(sol)
disp(sol1)

