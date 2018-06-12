%% ENGR 240 - Numerical Methods: Spring '18 - Project #4
%% Created By: Clarisa Leu-Rodriguez & Zheng Zhong
%% Dr. Willett | June 7th, 2018 | Tacoma Community College

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Purpose of Project:

%The purpose of this script is to analyze the standard SIR model for a
%closed population in light of two different numerical methods for solving
%differential equations discussed in class. This script will utilize the
%Fourth Order Runge Kutta method and the adaptive ode45() method built into
%MATLAB to solve three differential equations based on the standard SIR
%model. We will determine the most efficent method based on the runtime of
%each method. We will also be analyzing how sensitive the model itself is
%to changes in the given initial conditions and parameters. In addition, we
%will look at how varying the initial infected and suspectible proportions,
%the birth/death rates, and the recovery rates of the population affects
%the maximum number of infected people at any time as well as the overall
%trend/behavior of the model. In the SIR model, S+I+R=1 where S = the
%members of the population susceptible to the disease, I = the members who
%the population infected with the disease, and R = the members of the
%population who have recovered from the disease.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Running group5.m for Project #4...')
space=sprintf(' ');
disp(space)
format long;

%Given Parameters & Initial Conditions:
u=[0.1]; %Birth/Death Rate
y=[1.5]; %Recovery Rate
T=12; %Length of the Infection Season (months).
B0=3; %Initial Infection Rate.
S0=0.999999; %Initial S Proportion of Population.
I0=0.000001; %Initial I Proportion of Population.
R0=0; %Intial R Proportion of Population.
h=.1; %Step size for Fourth Order Runge Kutta Method.
totalMonths=48; %Period of the SIR model we are analyzing.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Varying Initial Conditions & Parameters:
%% Varying S0 and I0 of the Population:

%Change the initial proportions of individuals susceptible to the disease
%and individuals infected with the disease while holding everything else
%constant.
S02=0.199999; %Initial S proportion of population.
I02=0.800001; %Initial I proportion of population.

%Use ode45() with initial given conditions & parameters to solve the ODE.
[t3,y3]=ode45(@SIRmodel,[0 totalMonths],[S02,I02,R0],odeset('RelTol',1e-5),u(1),y(1),T,B0);

%% Varying the Birth/Death Rate of the Population:

%Change the Birth/Death Rate of the population while holding everything
%else constant.
u2=[.5]; %Birth/Death Rate

%Use ode45() with initial given conditions & parameters to solve the ODE.
[t4,y4]=ode45(@SIRmodel,[0 totalMonths],[S0,I0,R0],odeset('RelTol',1e-5),u2(1),y(1),T,B0);

%% Varying the Recovery Rate of the Population:

%Change the recovery rate of the population while holding everything else
%constant.
y2=[.1]; %Recovery Rate

%Use ode45() with initial given conditions & parameters to solve the ODE.
[t5,y5]=ode45(@SIRmodel,[0 totalMonths],[S0,I0,R0],odeset('RelTol',1e-5),u(1),y2(1),T,B0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Timing Methods:
%% Method 1 - Fourth Order Runge Kutta Method:

%Time method to compare to the adaptive ode45() method build into MATLAB
%later.
tic
method1Data=RK4sys(u,y,T,B0,S0,I0,R0,h,totalMonths);
rk4time=toc;

%Pull out appropiate values from matrix [method1Data] to plot and analyze
%later.
S1=method1Data(1,:); %S values
I1=method1Data(2,:); %I values
R1=method1Data(3,:); %R values
t1=method1Data(4,:); %Time range

%% Method 2 - Adaptive ode45() Method Build into MATLAB:

%Time method to compare to the Fourth Order Runge Kutta Method later.
tic
[t2,y2]=ode45(@SIRmodel,[0 totalMonths],[S0,I0,R0],odeset('RelTol',1e-5),u(1),y(1),T,B0);
ode45time=toc;

%Compute the differences in runtime to return to user later.
deltaTime=abs(ode45time-rk4time);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Display
disp('Plotting Graphs of Interest...')
disp(space)
%Plot the Baseline Levels
xStr0='\fontsize{10}\bfTime \it(Months)';
yStr0='\fontsize{10}\bfProportion of Population';
figure(1)
%Plot using Method One's Data for Baseline Plot
subplot(2,1,1)
plot(t1,S1,'o',t1,I1,'o',t1,R1,'o');
xlabel(xStr0);
ylabel(yStr0);
legend('\fontsize{10}S (Members of population who are susceptible to the disease)','\fontsize{10}I (Members of population who are infected with the disease)','\fontsize{10}R (Members of population who recovered from disease)');
title('\fontsize{15}\color[rgb]{0,.2,.5}\bf The SIR Model for a Closed Population (Baseline)');
%title('\fontsize{15}\color[rgb]{0,.5,.5}\bf The SIR Model for a Closed Population (Using the Fourth Order Runge Kutta Method)')
grid on;
%Plot Using Method Two's Data for Baseline Plot
subplot(2,1,2)
plot(t2,y2,'o');
xlabel(xStr0);
ylabel(yStr0);
legend('\fontsize{10}S (Members of population who are susceptible to the disease)','\fontsize{10}I (Members of population who are infected with the disease)','\fontsize{10}R (Members of population who recovered from disease)');
title('\fontsize{15}\color[rgb]{0,.2,.5}\bf The SIR Model for a Closed Population (Using the Built in ode45() Method)');
whitebg([0.700, 0.852, 0.904]);
grid on;
set(gcf,'units','inches','position',[.5,.5,15,7]);


%Plot when varying initial conditions & parameters to compare to Baseline
xStr='\fontsize{9}\bfTime \it(Months)';
yStr='\fontsize{7}\bfProportion of Population';
figure(2)
whitebg([0.900, 0.902, 0.804]);
set(gcf,'units','inches','position',[.5,.5,15,7]);
%Baseline
subplot(4,1,1)
plot(t2,y2,'o')
grid on;
xlabel(xStr);
ylabel(yStr);
title('\fontsize{12}\color[rgb]{.3,.5,.1}\bf The SIR Model for a Closed Population (Baseline)');
legend('S','I','R');
%Varying S0 and I0 of Population
subplot(4,1,2)
plot(t3,y3,'o')
grid on;
xlabel(xStr);
ylabel(yStr);
title('\fontsize{12}\color[rgb]{.6,.2,.8}\bf The SIR Model for a Closed Population (Varying Initial S0 & I0)');
legend('S','I','R');
%Varying Birth/Death Rate of Population
subplot(4,1,3)
plot(t4,y4,'o')
grid on;
xlabel(xStr);
ylabel(yStr);
title('\fontsize{12}\color[rgb]{.1,.2,.8}\bf The SIR Model for a Closed Population (Varying the Birth/Death Rate)');
legend('S','I','R');
%Varying Recovery Rate of Population
subplot(4,1,4)
plot(t5,y5,'o')
grid on;
xlabel(xStr);
ylabel(yStr);
title('\fontsize{12}\color[rgb]{.7,.1,.2}\bf The SIR Model for a Closed Population (Varying the Recovery Rate)');
legend('S','I','R');


%Determine Fastest Method & Display to User
disp('Determining fastest method...')
disp(space)
if(min([ode45time rk4time])==rk4time)
    strResp=sprintf('  • The fastest method was the Fourth Order Runge Kutta Method by %f seconds in comparison to the adaptive ode45() method built into MATLAB.',deltaTime);
    disp(strResp)
else
    strResp=sprintf('  • The fastest method was the adaptive ode45() method built into MATLAB by %f seconds in comparison to the Fourth Order Runge Kutta Method.',deltaTime);
    disp(strResp)
end
disp(space)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=msgbox('Done Running group5.m','Success','help');