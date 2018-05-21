%% ENGR 240 - Numerical Methods: Spring '18.
% Created by: Claire Leu-Rodriguez & Frances Constantino

%% Project 2: Group 4

%This script linearizes and plots the Arrhenius' equations of a chemical
%reaction using two differnt methods of general least squares regression
%(linear and nonlinear), based on a set of given imported data for the
%Temperature and Reaction Rate of a chemical reaction. For the original
%equation, we used a linear method. For the modified equation, we used a
%nonlinear approach via an optimization routine using MATLAB's fminsearch()
%function to minimize the modeled data to find the best fit.

%% Part 1

%Import Data
disp('Running grou4.m...')
C=load('DataSet.txt');
T=C(:,1);
k=C(:,2);

%Part 1 (Linearization)
Tnew=1./T;
knew=log(k);

%Compute the average values for the correlation coefficient.
knewbar=mean(knew);
Tnewbar=mean(Tnew);
[n,l]=size(Tnew);

%Compute slope (m) and y-intercept to find the 'best fit' line.
m=(n*sum(Tnew.*knew)-sum(Tnew)*sum(knew))/(n*sum(Tnew.*Tnew)-(sum(Tnew))^2);
b=knewbar-m*Tnewbar;

%Calculate the values of A and E.
A=exp(b);
E=-8.314*m;

%Compute the correlation coefficient.
cor1=sqrt((sum((knew-knewbar).^2)-sum((knew-m.*Tnew-b).^2))/(sum((knew-knewbar).^2)));

%Create a function for the y values to plot.
y=exp(m.*Tnew)';

%Create the linearized regression model:
linreg=y.*A;

%% Part 2 - Nonlinear Regression

%Define options to be used by fminsearch()
options=optimset('MaxIter',Inf,'MaxFunEvals',Inf);

%Minimize the defined non-linear model with an intial guess of 1 based on
%the unknown constants ([1,1,1]) with the defined options above. Feed in
%our data.
C=fminsearch(@nonlinmodel,[1 1 1],options,T,k);

%Create the regression function and evaluate it on the x axis.
reg=C(1).*T.^C(2).*exp(-C(3)./(8.314*T));

%Compute the correlation coefficient.
kbar=mean(k);
St2=sum((k-kbar).^2);
S2=sum((k-reg).^2);
cor2=sqrt((St2-S2)/St2);

%% Display & Plot

%Create a string with this data and display it to the user.
str1=sprintf('The Computed Correlation Coefficient using Linear Regression is: %f',cor1);
disp(str1);
str2=sprintf('The Computed Correlation Coefficient using Nonlinear Regression is: %f',cor2);
disp(str2);

%Plot
plot(T,k,'m*',T,linreg,'r',T,reg,'b');
str3=sprintf('%f*e^{%f*T} (Linear)',A,E);
str4=sprintf('%f*T^{%f}e^{%f*T} (Nonlinear)',C(1),C(2),C(3));
title('Temperature vs. Reaction Rate');
xlabel('Temperature (Kelvin)');
ylabel('Reaction Rate (k)');
legend('Data',str3,str4);
