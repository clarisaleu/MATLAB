%% ENGR 240 - Numerical Methods: Spring '18 - Project #3
%% Created By: Clarisa Leu-Rodriguez & William Ayers 
%% Dr. Willett | May 31st, 2018 | Tacoma Community College

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%A script that plots the Position (m) vs. Time (s) of a vehicle's
%suspension system given time and acceleration data of the system via three
%seperate methods of numerical modeling & using the trapezoid rule for
%numerical integration twice. The purpose of this script is to estimate the
%position of the vehicle's center of mass (which is the position of the
%suspension system) and the total distance traveled by the vehicle.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running group2.m for Project #3...')
space=sprintf(' ');
disp(space)
format long;

%Import Given Data
A=load('project3data.txt');
%Time Data
t=A(:,1);
%Acceleration Data
accelData=A(:,2);
%Given Initial Velocity (m/s)
v0=-1.6;
%Given Initial Position (m)
s0=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem #1 - Part A
%Create a plot of the Position(m) vs. Time(s) given the acceleration data
%of a vehicle's suspension system using the trapezoid rule directly on the
%data.

%Time the method to compare to other methods later.
tic
[posDataTrap,partADisp]=trapHelper(v0,s0,t,accelData);
trapTime=toc;

%Plot
plot(t,posDataTrap,'k-.x'); hold on;
txt='\bf\heartsuit\rm Made with love \bf\heartsuit';
title('\fontsize{20}\color[rgb]{0,.5,.5}\bfCenter of Mass of a Vehicles Suspension System')
text(1.42,-.19,txt)
xlabel('\fontsize{15}\bfTime \it(s)')
ylabel('\fontsize{15}\bfPosition \it(m)')
whitebg([0.929, 0.992, 0.984])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem #1 - Part B
%Create a plot of the Position(m) vs. Time(s) given the acceleration data
%of a vehicle's suspension system using a cubic spline with not-a-knot end
%condition to model the data and than using the trapezoid rule directly on
%the spline.

%Time the method to compare to other methods later.
tic
vrn=spline(t,accelData,t);
[splinePos,partBDisp]=trapHelper(v0,s0,t,vrn);
splineTime=toc;

%Plot
plot(t,splinePos,'bo'); hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem #1 - Part C
%Create a plot of the Position(m) vs. Time(s) given the acceleration data
%of a vehicle's suspension system using regression to model the data
%according to the non lienar equation of a damped oscillator & than using
%the trapezoid rule directly on the non linear model.

%Define options to be used by fminsearch()
options=optimset('MaxIter',Inf,'MaxFunEvals',Inf);

%Minimize the defined non-linear model with an intial guess of 1 based on
%the unknown constants ([1,1,1,1]) with the defined options above. Feed in
%our data. Time the method to compare to other methods later.
tic
C=fminsearch(@nonlinmodel,[1 1 1,1],options,t,accelData);
regAccel=C(1).*exp(C(2).*t).*cos(C(3).*t+C(4));
[regPos,partCDisp]=trapHelper(v0,s0,t,regAccel);
nonLinModelTime=toc;

%Plot
plot(t,regPos,'m*'); hold off;
legend('\fontsize{15}\color{black}Trapezoidal Rule','\fontsize{15}\color{blue}Cubic Spline','\fontsize{15}\color{magenta}Regression')
grid on;
set(gcf,'units','inches','position',[.5,.5,15,7])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem #2
%Display Computed Total Distance Data
disp('Problem #2 - Total Distance Traveled:')
fprintf('   •Part 1A: The computed total distance traveled using the trapezoid rule directly on the data is: %fm',partADisp);
disp(space)
fprintf('   •Part 1B: The commputed total distance traveled using a cubic spline to model the acceleration data and using the trapezoid rule directly on the spline is: %fm',partBDisp);
disp(space)
fprintf('   •Part 1C: The computed total distance traveled using non linear regression to model the data and using the trapezoid rule directly on the model is: %fm',partCDisp);
disp(space)
fprintf('   •The average computed total distance traveled is: %fm',mean([partADisp partBDisp partCDisp]));
disp(space)
fprintf('   •Standard Deviation: %fm',std([partADisp partBDisp partCDisp]));
disp(space)

%Display Time Data
disp('Times:')
fprintf('   •Part 1A: The total run time using the trapezoidal rule directly on the data is: %fs',trapTime);
disp(space)
fprintf('   •Part 1B: The total run time using a cubic spline to model the acceleration data and using the trapezoid rule directly on the spline is: %fs',splineTime);
disp(space)
fprintf('   •Part 1C: The total run time using regression to model the data and using the trapezoid rule directly on the non linear model is: %fs',nonLinModelTime);
disp(space)
fprintf('   •The average run time is: %fs',mean([trapTime splineTime nonLinModelTime]));
disp(space)
fprintf('   •Standard Deviation: %fs',std([trapTime splineTime nonLinModelTime]));
disp(space)

%Determine Fastest Method & Display to User
if(min([trapTime splineTime nonLinModelTime])==trapTime)
    disp('   •The fastest method was Part 1A - using the trapezoidal rule directly on the data.')
elseif(min([trapTime splineTime nonLinModelTime])==splineTime)
    disp('   •The fastest method was Part 1B - using a cubic spline to model the acceleration data and using the trapezoid rule directly on the spline.')
else
    disp('   •The fastest method was Part 1C - using regression to model the data and using the trapezoid rule directly on the non linear model.')
end
disp(space)


h=msgbox('Done Running group2.m','Success','help');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%