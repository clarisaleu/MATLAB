%% Problem 1

%% Main Function
% A function  that inputs a positive constant a and tolerance
%epsilon. Returns the estimate of the square root of a that has a relative
%error less than epsilon.

function y = leurodriguez1(a,epsilon)
if a <0||epsilon<0
    disp('Sorry, try again! a>0 & epsilon>0.');
elseif a==0
    y=0;
else
    oldapprox=a;
    %Relative Error%
    presentapprox=(oldapprox+(a./oldapprox))./2;
    while abs((oldapprox-presentapprox)./oldapprox)>epsilon
        oldapprox=presentapprox;
        presentapprox=(oldapprox+(a./oldapprox))./2;
    end
    y=presentapprox;
end

