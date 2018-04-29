%A script to find the solutions of the non-linear system y=5cos(x) &
%x=y^2/2-y-1
format long
%Initial Guesses
x0=2;y0=0;
maxit=10000;

f=@(x,y)5.*cos(x)-y;
g=@(x,y)(y^2./2)-y-1-x;

%Partials
dfx=@(x)-5.*sin(x); dfy=-1;
dgy=@(y)y-1; dgx=-1;

jacoby=@(x,y)((-5.*sin(x)).*(y-1))+(y-1);

x1=x0-((f(x0,y0).*dgy(y0))-(g(x0,y0).*dfy))./jacoby(x0,y0);
y1=y0-((g(x0,y0).*dfx(x0))-(f(x0,y0).*dgx))./jacoby(x0,y0);
err1=abs((x1-x0))./x1;
err2=abs((y1-y0))./y1;
err=sqrt((err1.^2)+(err2.^2));
i=1;

while err<.00001 && i<=maxit
    i=i+1;
    x0=x1;
    y0=y1;
    x1=x0-((f(x0,y0).*dgy(y0))-(g(x0,y0).*dfy))./jacoby(x0,y0);
    y1=y0-((g(x0,y0).*dfx(x0))-(f(x0,y0).*dgx))./jacoby(x0,y0);
    err1=abs((x1-x0)./x1);
    err2=abs((y1-y0)./y1);
    err=sqrt((err1.^2)+(err2.^2));
end

disp('The solution is x,y:')
disp(x1)
disp(y1)

