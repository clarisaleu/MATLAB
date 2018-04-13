%A Script to find the potential energy of a spring given the force of the
%spring & the corresponding stretch of the spring


disp('Now running the script for problem 3...')
%Given information for the force of a spring (Newtons)
force=[14;18;8;9;13];
%Given information for corresponding stretch (meters) of spring
xdistance=[0.013;0.020;0.009;0.010;0.012];

%Hooke's Law: F=kx
springConstant=force./xdistance
%Potential Energy of the corresponding spring (Joules) in table
potentialEnergy=.5.*springConstant.*(xdistance.*xdistance);

%Display
disp('The corresponding potential energies for the spring systems in Joules are:')
disp(potentialEnergy)

