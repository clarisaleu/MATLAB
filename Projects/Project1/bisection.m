%% Our Code
%A function to solve for the Mach numbers for each value of the normalized
%area defined by the area a de Laval Nozzle & the area at the throat of the
%tube. Inputs a value k (the specific heat ratio of a gas) and returns all
%of the Mach values found for A between 1 and 4 using the bisection method.

function y=bisection(k)
mvals=[];

for A=1:.001:4
    f=@(M)(1/M).*((2/(k+1)).*(1+(k-1).*.5.*M.^2)).^((k+1)/(2.*(k-1)))-A;
    %Get Supersonic Mach Number
    supersonic=bisectionhelper(f,1,4,2,.001);
    %Get Subsonic Mach Number
    subsonic=bisectionhelper(f,0,1,2,.001);
    %Return both
    machnums=[supersonic;subsonic];
    mvals=[mvals machnums];
end
y=mvals;
end

%% Class Code
function fout = bisectionhelper(func,a,b,ns,err)
%Implementation of the bisection method of root finding. Here func is the
%function whose roots are to be found on the interval [a,b]. ns is the
%number of subdivisions to be used and err is the desired absolute error.
if err<=0
    disp('Error. Your error tolerance must be positive.');
else
    
    x=linspace(a,b,ns); %Split up our search interval.
    roots=[]; %This will hold the roots.
    
    for i=1:ns-1  %Search each subinterval.
        if signchange(func,x(i),x(i+1)) %If there is a sign change there
            %should be a root.
            
            left=x(i); right=x(i+1); mid=(left+right)/2;
            while (right-left)>err %Execute the bisection search until the
                %subinterval is short enough.
                if signchange(func,left,mid)
                    right=mid;
                else
                    left=mid;
                end
                mid=(left+right)/2;
            end
            roots=[roots mid];
        end
    end
    
    if length(roots)==0  %Just in case nothing is found, warn the user.
        disp('No roots found.');
    end
    
    fout=roots;
end
end


function fout=signchange(func,a,b)
%A subfunction for detecting a sign change on an interval.
if sign(func(a))~=sign(func(b))
    %If sign of left != sign on right... you found a sign change
    fout=1;
else
    fout=0;
end

end

