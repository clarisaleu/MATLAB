%% ENGR 204 - Numerical Methods: Spring '18
%% Pogramming Assignment #5 - Problem 2
%A script that graphs the drag force of a sphere as a function of velocity for
%v=4m/s to v=40m/s based on the Reynolds number and drag coefficient (cd)
%for each specific value of v.
 
%Given values of the Reynolds Numbers (R) and the corresponding drag
%coefficient values (cd).
R=[2 5.8 16.8 27.2 29.9 33.9 36.3 40 46 60 100 200 400].*10^4;
cd=[0.52 0.52 0.52 0.5 0.49 0.44 0.18 0.074 0.067 0.08 0.12 0.16 0.19];

%Given values
rho=1.3; %Density of the fluid through which it passes through
mu=1.78*10^(-5); %Dynamic viscosity
diameter=0.22; %Diameter of the hemisphere in meters
frontalArea=pi*(diameter/2)^2; %Frontal area of hemisphere

%Cubic spline not-a-knot end condition estimate to find cd values
velocityVals=linspace(4,40,200);
RVals=(rho.*velocityVals.*diameter)./mu;
spline1=spline(R,cd,RVals);

%Calculate drag force after solving for cd values
dragForce=0.5*rho.*(velocityVals.^2)*frontalArea.*spline1;

%Plot
plot(velocityVals,dragForce,'r');
title('Drag Force (N) vs. Velocity (m/s) for a Hemisphere');
xlabel('Velocity (meters/second)');
ylabel('Drag Force (Newtons)');
axis('equal')