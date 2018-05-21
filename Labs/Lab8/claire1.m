%Problem 1 - Lab 8.

%4th degree interpolating polynomial
f=@(x) 1/(1+100*x^2);
xvals=linspace(-1,1,5);
plotvals=linspace(-1,1);
fvals=[f(xvals(1))];

for i=2:1:length(xvals)
fvals=[fvals f(xvals(i))];
end

if(length(xvals)==4+1)
    disp('Interpolating Polynomial')
end

format long;
g=polyfit(xvals,fvals,4);
g4=polyval(g,plotvals);
gfunc=@(x)g(1)*x^4+g(2)*x^3+g(3)*x^2+g(4)*x+g(5);
gvals=[gfunc(plotvals(1))];

for i=2:1:length(plotvals)
    gvals=[gvals gfunc(plotvals(i))];
end

figure(1)
plot(xvals,fvals,'*',plotvals,g4)
title('4th Degree')
axis('equal')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%10th degree interpolating polynomial
xvals2=linspace(-1,1,11);
plotvals2=linspace(-1,1);
fvals2=[f(xvals(1))];

for i=2:1:length(xvals2)
fvals2=[fvals2 f(xvals2(i))];
end

if(length(xvals2)==10+1)
    disp('Interpolating Polynomial')
end

w=polyfit(xvals2,fvals2,10);
w10=polyval(w,plotvals2);
wfunc=@(x)w(1)*x^10+w(2)*x^9+w(3)*x^8+w(4)*x^7+w(5)*x^6+w(6)*x^5+w(7)*x^4+w(8)*x^3+w(9)*x^2+w(10)*x+w(11);
wvals=[gfunc(plotvals2(1))];
for i=2:1:length(plotvals2)
    wvals=[wvals wfunc(plotvals2(i))];
end



%Problem 2 - Lab 8.
yvals3=spline(xvals,fvals,plotvals);
figure(2)
plot(xvals2,fvals2,'*',plotvals2,w10,plotvals2,yvals3)
title('10th Degree & Cubic Spine')
axis([-1 1 -1 5])