%A helper function that returns the position and displacement data using
%numerical integration via the trapezoidal rule given parameters v0
%(initial velocity), s0 (initial position), a time vector <t>, and
%acceleration data vector <accelData>.

function [posDataResp,dispDataResp] = trapHelper(v0,s0,t,accelData)

vCur=v0;
velDataTrap=[v0];

for i=1:length(t)-1 %Loop through each value of t
    %Compute velocity using trapezoid rule & store it for next computation.
    vNewTrap=vCur+(t(i+1)-t(i))*((accelData(i+1)+accelData(i))/2);
    vCur=vNewTrap;
    velDataTrap=[velDataTrap vNewTrap];
end

%Integrate the velocity data for the position data.
posCur=s0;
posDataTrap=[s0];

%For the total distance traveled, integrate the speed data.
dispCur=0;
velDataDisp=abs(velDataTrap);
dispDataTrap=[dispCur];

for j=1:length(t)-1 %Loop through each value of t and integrate numerically again.
    %Compute position using trapezoid rule & store it to plot.
    posNewTrap=posCur+(t(j+1)-t(j))*((velDataTrap(j+1)+velDataTrap(j))/2);
    posCur=posNewTrap;
    posDataTrap=[posDataTrap posNewTrap];
    
    %Compute total distance traveled
    dispNewTrap=dispCur+(t(j+1)-t(j))*((velDataDisp(j+1)+velDataDisp(j))/2);
    dispCur=dispNewTrap;
    dispDataTrap=[dispDataTrap dispNewTrap];
end

%Return Position & Displacement Data
posDataResp=posDataTrap;
dispDataResp=dispDataTrap(length(dispDataTrap));

end