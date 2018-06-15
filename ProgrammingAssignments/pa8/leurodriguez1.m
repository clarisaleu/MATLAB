%% Programming Assignment #8 - Problem #1
%% Created By: Clarisa Leu-Rodriguez

%A function that implements the centered finite difference to solve the
%boundary value problem based on the second order differential equation of
%interest which describes the radial temperature distribution in the wall
%of a hollow cylinder.

%% Parameters:
%tempRange = Row vector defining the boundary value conditions for the wall
%of the cylinder (tempRange = [tempInner,tempOuter]; where tempInner = the
%temperature of the inner wall of the cylinder & tempOuter = the
%temperature of the outer wall of the cylinder). ; radRange = Row vector
%definining the boundary value conditions for the radius of the cylinder
%(radRange = [radInner,radOuter]; where radInner = the inner radius of the
%cylinder & radOuter = the outer radius of the cylinder); nodeSpacing = the
%spacing between each respective node; valS = heat generation term to model
%a heat source along the central axis (a scalar quantity)

%% Returns:
%radResp = radius values specified  by the boundary value conditions of the
%radius of the hollow sphere and spacings between each subsequent node;
%tempResp = associated temperature values computed using the finite
%difference method and centered formulas

function [radResp,tempResp] = leurodriguez1(tempRange,radRange,nodeSpacing,valS)
%Assign boundary conditions/values to variables
tempInner=tempRange(1); tempOuter=tempRange(2);
radInner=radRange(1); radOuter=radRange(2);

%Compute n based on the range of radius values. We will solve n-1 equations
%for n-1 variables as the boundary values are known.
n=((radOuter-radInner)/nodeSpacing);

%Initialize arrays to push relevant equations too.
A=[]; b=[]; eqns=zeros(1,n-1);

%Initialize inner nodes to access radius values later. 
innerNodes=(radInner+nodeSpacing):nodeSpacing:(radOuter-nodeSpacing);

%Compute the first iteration with i = 1
eqns(1)=-2;
eqns(2)=(nodeSpacing/(2*innerNodes(1)))+1;
A=[eqns];
b=[-valS*nodeSpacing^2-tempInner+(nodeSpacing/(2*innerNodes(1)))*tempInner];

%Populate matrix A & b for nodes [2,n-2]
for i=2:n-2
eqns=zeros(1,n-1);
eqns(i-1)=1-(nodeSpacing/(2*innerNodes(i)));
eqns(i+1)=1+(nodeSpacing/(2*innerNodes(i)));
eqns(i)=-2;
b=[b ; -valS*nodeSpacing^2];
A=[A ; eqns];
end

%Compute the last iteration with i = n-1
eqns=zeros(1,n-1);
eqns(n-2)=1-(nodeSpacing/(2*innerNodes(n-1)));
eqns(n-1)=-2;
A=[A ; eqns];
b=[b ; -valS*nodeSpacing^2-tempOuter-((tempOuter*nodeSpacing)/(2*innerNodes(n-1)))];

%Solve for the temperature values based on matrix A & b using leftt
%division
finiteDiffVals=(A\b)';

%Return radius & temperature values for the cylinder
radResp=[radInner innerNodes radOuter];
tempResp=[tempInner finiteDiffVals tempOuter];

end