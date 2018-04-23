%Problem 2 - A script that produces a group of the cable definied by the
%catenary curve given initial conditions.
x=-200:1:200;
t=fixedpointfunction(1000,.0001);
dens=10;
y0=5;
y=(t./dens).*cosh((dens./t).*x)+y0-(t./dens);
plot(x,y)
title('A Hanging Cable')



