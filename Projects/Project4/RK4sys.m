%% ENGR 240 - Numerical Methods: Spring '18 - Project #4
%% Created By: Clarisa Leu-Rodriguez & Zheng Zhong
%% Dr. Willett | June 7th, 2018 | Tacoma Community College

%A helper function to solve/model the ODEs of interest with respect to our
%project using the Fourth Order Runge-Kutta Method [Method 1].

%% Parameters:
%u = birth rate of population; y = recovery rate of population; T = length
%of the infection season (months); B0 = initial infection rate of
%population; S0 = initial proportion of members of population who are
%suscpetiable to the disease; I0 = initial proportion of members of
%population who are infected with the disease; R0 = initial proportion of
%members of population who have recovered from the disease; h = step size;
%tim = time interval to solve model over;

%% Returns:
%Svals = members who are suscpetible to the disease; Ivals = members who
%are infected to the disease; Rvals = members who are recovered from the
%disease; tran = time range;

function resp = RK4sys(u,y,T,B0,S0,I0,R0,h,tim)

tran=(0:h:tim); %Initialize array containing the time to solve the model over.
dsdt=@(t,S,I,R)u.*(1-S)-(B0.*(1+sin(2.*pi.*t./T))).*I.*S; %Given differential equation of members who are suscpetible to the disease
didt=@(t,S,I,R)(B0.*(1+sin(2.*pi.*t./T))).*I.*S-(y+u).*I; %Given differential equation of members who are infected
drdt=@(t,S,I,R)y.*I-u.*R; %Given differential equation of members who are recovered

%Initialize arrays to store results.
Svals=[S0];
Ivals=[I0];
Rvals=[R0];


for i=1:length(tran)-1 %For loop to excute the Fourth Order Runge Kutta System method
    %Compute the four k values for each estimating point.
    k1s=dsdt(tran(i),Svals(i),Ivals(i),Rvals(i));
    k1i=didt(tran(i),Svals(i),Ivals(i),Rvals(i));
    k1r=drdt(tran(i),Svals(i),Ivals(i),Rvals(i));
    
    k2s=dsdt(tran(i)+0.5*h,Svals(i)+0.5*k1s*h,Ivals(i)+0.5*k1i*h,Rvals(i)+0.5*k1r*h);
    k2i=didt(tran(i)+0.5*h,Svals(i)+0.5*k1s*h,Ivals(i)+0.5*k1i*h,Rvals(i)+0.5*k1r*h);
    k2r=drdt(tran(i)+0.5*h,Svals(i)+0.5*k1s*h,Ivals(i)+0.5*k1i*h,Rvals(i)+0.5*k1r*h);
    
    k3s=dsdt(tran(i)+0.5*h,Svals(i)+0.5*k2s*h,Ivals(i)+0.5*k2i*h,Rvals(i)+0.5*k2r*h);
    k3i=didt(tran(i)+0.5*h,Svals(i)+0.5*k2s*h,Ivals(i)+0.5*k2i*h,Rvals(i)+0.5*k2r*h);
    k3r=drdt(tran(i)+0.5*h,Svals(i)+0.5*k2s*h,Ivals(i)+0.5*k2i*h,Rvals(i)+0.5*k2r*h);
    
    k4s=dsdt(tran(i)+h,Svals(i)+k3s*h,Ivals(i)+k3i*h,Rvals(i)+k3r*h);
    k4i=didt(tran(i)+h,Svals(i)+k3s*h,Ivals(i)+k3i*h,Rvals(i)+k3r*h);
    k4r=drdt(tran(i)+h,Svals(i)+k3s*h,Ivals(i)+k3i*h,Rvals(i)+k3r*h);
    
    %Form the weighted average.
    S1=Svals(i)+(k1s+2*k2s+2*k3s+k4s)*h/6;
    I1=Ivals(i)+(k1i+2*k2i+2*k3i+k4i)*h/6;
    R1=Rvals(i)+(k1r+2*k2r+2*k3r+k4r)*h/6;
    
    %Push result for the ith iteration over tran to array
    Svals=[Svals,S1];
    Ivals=[Ivals,I1];
    Rvals=[Rvals,R1];
end

%Return solved for values over tran
resp=[Svals;Ivals;Rvals;tran];

end