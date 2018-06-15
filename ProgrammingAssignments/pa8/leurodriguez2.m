%% Programming Assignment #8 - Problem #2
%% Created By: Clarisa Leu-Rodriguez

%A function that implements the shooting method to solve the linearized
%model for an aquafer and the root finding approach for the shooting method
%to solve the non-linear model for an aquafer & plots each respective
%solution.

%% Parameters:
%xRange = x-values to solve over [xMin, xMax] (units:meters); hRange =
%boundary conditions for the height of the water table at a distance x
%meters measured in the waterflow direction [hMin, hMax] (units:meters); K
%= constant which measures the ease with which water flows through the
%soil; N = constant which measures how much water enters from the surface;

%% Returns:
%plot1 = graph for the linearized solution using the shooting method; plot2
%= graph of the non-linear solution using the root-finding approach for the
%shooting method

function [plot1,plot2] = leurodriguez2(xRange,hRange,K,N)
%Compute hBar for the linearized model & set up problem
hBar=mean(hRange);
xMin=xRange(1); xMax=xRange(2);
hMin=hRange(1); hMax=hRange(2);

%% Linearized Model - Shooting Method
%Set up guess 1
[x,h]=ode45(@(x,h)eqn(x,h,K,N,hBar),[xMin xMax],[hMin -5]);
Tb1=h(length(x));
%Set up guess 2
[x,h]=ode45(@(x,h)eqn(x,h,K,N,hBar),[xMin xMax],[hMin -50]);
Tb2=h(length(x));

%Using interpolation to find the correct guess for the slope
za=(hMax-Tb2)*(-50+5)/(Tb2-Tb1)-50;

%Reshoot and verify that our model satisfies the boundary value.
[x,h]=ode45(@(x,h)eqn(x,h,K,N,hBar),[xMin xMax],[hMin za]);

plot1=figure(1);
plot(x,h(:,1)')
xStr0='\fontsize{13}\bfDistance \it(Meters)';
yStr0='\fontsize{13}\bfHeight of Water Table \it(Meters)';
title('\fontsize{16}\color[rgb]{0,.2,.5}\bf Solution for the Linearized Model of an Aquafer');
whitebg([0.992, 0.768, 0.886]);
grid on;
set(gcf,'units','inches','position',[.5,.5,15,7]);
xlabel(xStr0);
ylabel(yStr0);

%% Nonlinear Rootfinding Technique - Root Finding Approach for the Shooting Method
%Decoupled System
plot2=figure(2);
hVals2=[hMin];
options=optimset('Display','iter');
x1=fzero(@solver,0)
title('\fontsize{16}\color[rgb]{0,.2,.5}\bf Solution for the Non-Linearized Model of an Aquafer');
whitebg([0.992, 0.768, 0.886]);
grid on;
set(gcf,'units','inches','position',[.5,.5,15,7]);
xlabel(xStr0);
ylabel(yStr0);

end

function f= solver(t)
options=odeset('RelTol',1e-8,'AbsTol',[1e-8 1e-8]);
    [x,u]=ode45(@(x,h)eqn1(x,h,K,N),[xMin xMax],[hMin t],options);
    s=length(x);
    f=u(s,1);
end

%Decoupled system for the linearized model; <h,z>=<h(1),h(2)>;
%<dhdx,dzdx>=<dh(1),dh(2)>; dhdx=z; dzdx=-N/(K*hBar);
function dhResp=eqn(x,h,K,N,hBar)
dh=zeros(2,1);
dh(1)=h(2); dh(2)=-N./(K.*hBar);
dhResp=dh;
end

%Decoupled system for the non-linear model; <h,z>=<h(1),h(2)>;
%<dhdx,dzdx>=<dh(1),dh(2)>; dhdx=z; dzdx=-N/(K*z);
function dhResp=eqn1(x,h,K,N)
dh=zeros(2,1);
dh(1)=h(2); dh(2)=-N./(K.*h(2));
dhResp=dh;
end
