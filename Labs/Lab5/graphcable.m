


%Problem 2 - A script that produces a group of the cable definied by the
%catenary curve given initial conditions.
disp('Okay... graphing now hoss...')
x=-200:1:200;
di
t=fixedpointfunction(1000,.0001);
dens=10;
y0=5;
y=(t./dens).*cosh((dens./t).*x)+y0-(t./dens);
disp('Almost done...')
plot(x,y)
title('A Hanging Cable');
xlabel('Legnth, meters');
ylabel('Height, meters');
%axis([-100,100,0,50]);
axis equal;







