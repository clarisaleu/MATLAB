%Lab Assignment #1
%Studying unforced oscillating systems. A dying spring.

A=10;
k=.25;
omega=2.5;
phi=1.5;

t=linspace(0,10);

%Our function
y=A.*exp(-k.*t).*sin(omega.*t+phi);

%Plot
plot(t,y,'-.dm');hold on;
title({'Lab #1 Graph - Unforced Oscillating Systems';'y=Ae^{-kt}sin({\omega}t+{\phi})'})
xlabel('t - Time (seconds)')
ylabel('y - Postion (m)')
axis([0 6*pi./omega -10 10])
