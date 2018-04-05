%Lab Assignment #1

%Studying unforced oscillating systems. A dying spring

A=10;
k=.25;
omega=2.5;
phi=1.5;
t=linspace(0,10);


y=A.*exp(-k.*t).*sin(omega.*t+phi);

