%% Programming Assignment #7 - Problem #2
%% Created By: Clarisa Leu-Rodriguez

%A function that implements the fourth order Runge Kutta method for a
%system of ODES describing the motion of a rocket according to Newton's
%Second Law of Motion. Relevant equation: m(t)*y''=T-*m(t)*g-cd*(y')^2  where
%m(t)=1200-mf*t. We'll assume y(0)=0 and y'(0)=0. g=9.81m/s/s is the
%acceleration due to gravity. 

%% Parameters:
%T=thrust of rocket; cd=drag coefficient; trange=range of t-values to solve
%over [tstart, tend]; mf=burn rate of fuel; h=step size

%% Returns:
%tResp=row vector of the t-values, approxSolResp=row of the y-values as computed by Runge
%Kutta

function [tResp,approxSolResp] = leurodriguez2(T,cd,trange,mf,h)

tmin=trange(1);
tmax=trange(2); 
g=9.81; %Acceleration due to gravity (m/s/s)

%Set-up decoupled system
f=@(t,y,z)z;
g=@(t,y,z)(T-(1200-mf.*t).*g-cd.*(z).^2)./(1200-mf.*t);



t=linspace(tmin,tmax,(tmax-tmin)/h+1);
len=length(t);
approxSol=[0];
yvals=[0];


%Compute the four k values for each estimating point.
for i=1:len-1
    k1x=f(t(i),approxSol(i),yvals(i));
    k1y=g(t(i),approxSol(i),yvals(i));
    
    k2x=f(t(i)+0.5*h,approxSol(i)+0.5*h*k1x,yvals(i)+0.5*h*k1y);
    k2y=g(t(i)+0.5*h,approxSol(i)+0.5*h*k1x,yvals(i)+0.5*h*k1y);
    
    k3x=f(t(i)+0.5*h,approxSol(i)+0.5*h*k2x,yvals(i)+0.5*h*k2y);
    k3y=g(t(i)+0.5*h,approxSol(i)+0.5*h*k2x,yvals(i)+0.5*h*k2y);
    
    k4x=f(t(i)+h,approxSol(i)+h*k3x,yvals(i)+h*k3y);
    k4y=g(t(i)+h,approxSol(i)+h*k3x,yvals(i)+h*k3y);
    
    %Form the weighted average.
    approxSol=[approxSol approxSol(i)+(k1x+2*k2x+2*k3x+k4x)*h/6];
    yvals=[yvals yvals(i)+(k1y+2*k2y+2*k3y+k4y)*h/6];
end

%Return Values
tResp=t;
approxSolResp=approxSol;

end

