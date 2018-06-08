%% ENGR 240 - Numerical Methods: Spring '18 - Project #4
%% Created By: Clarisa Leu-Rodriguez & Zheng Zhong
%% Dr. Willett | June 7th, 2018 | Tacoma Community College

%A helper function to model the ODEs of interest with respect to our
%project for ode45() [Method 2] which is a versatile ODE solver built into
%MATLAB to solve non-stiff differential equations.

%% Parameters:
%t = time interval to solve model over; init = row vector of initial values
%of the SIR model [S(0) I(0) R(0)]; u = birth/death rate of population; y =
%recovery rate of population; T = length of the infection season (months);
%B0 = initial infection rate;

%% Returns:
%s = ODE of interest concerning members who are suscpetible to the disease;
%i = ODE of interest concerning members who are infected from the disease;
%r = ODE of interest concerning members who are recovered from the disease;

function yp=SIRmodel(t,init,u,y,T,B0);

%Differential Equations of Interest from the Standard SIR Model
s=u.*(1-init(1))-(B0.*(1+sin(2.*pi.*t./T))).*init(2).*init(1);
i=(B0.*(1+sin(2.*pi.*t./T))).*init(2).*init(1)-(y+u).*init(2);
r=y.*init(2)-u.*init(3);

%Return Functions
yp=[s;i;r];