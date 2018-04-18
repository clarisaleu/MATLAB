function fout = bisection(f,a,b,n,err)
%Implementation of the bisection method of root finding. Here f is the
%function whose roots are to be found on the interval [a,b]. n is the
%number of subdivision to be used and err is the desired absolute error.
if err<=0
    disp('Error. Your error tolerance must be positive.');
else
    
    x=linpace(a,b,n); %Split up our search interval.
    roots=[]; %This will hold the roots.
    
    for i=1:n-1  %Search each subinterval.
        if signchange(f,x(i),x(i+1)) %If there is a sign change there
            %should be a root.
            
            left=x(i); right=x(i+1); mid=(left+right)/2;
            while (right-left)>err %Execute the bisection search until the
                %subinterval is short enough.
                if signchange(f,left,mid)
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


function fout=signchange(f,a,b)
%A subftion for detecting a sign change on an interval.
if sign(f(a))~=sign(f(b))
    %If sign of left != sign on right... you found a sign change
    fout=1;
else
    fout=0;
end
end

