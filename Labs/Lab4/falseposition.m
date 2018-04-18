function fout = falseposition(func,a,b,ns,err)
%Implementation of the false position method of root finding. Here func is
%the function whose roots are to be found on the interval [a,b]. ns is the
%number of subdivisions to be used and err is the desired absolute error.
if err<=0
    disp('Error. Your error tolerance must be positive.');
else
    
    x=linspace(a,b,ns); %Split up our search interval.
    roots=[]; %This will hold the roots.
    
    for i=1:ns-1  %Search each subinterval.
        if signchange(func,x(i),x(i+1)) %If there is a sign change there
            %should be a root.
            left=x(i); right=x(i+1); xr=right-(func(left).*(right-left))./(func(left)-func(right));
            while (right-left)>err %Execute the bisection search until the
                %subinterval is short enough.
                if signchange(func,left,xr)
                    right=xr;
                else
                    left=xr;
                end
                xr=(left+right)/2;
            end
            roots=[roots xr];
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

