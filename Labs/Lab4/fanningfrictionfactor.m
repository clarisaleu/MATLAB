%A function that returns the fanning friction factor given by the von
%Karman equation. Inputs a Reynolds constant R which is between 2,500 annd
%1,000,000
function y = fanningfrictionfactor(R)
if R>1000000 || R<25000
    disp('Sorry hoss, R is between 2500 and 1,000,000. Try again...')
else
    func=@(x) 4.*log10(R.*sqrt(x))-4-(1./sqrt(x));
    x=linspace(.001,.01);
    err=.000005;
    roots=[];
    fannum=falseposition(func,0.001,.01,1000,err);
    if length(fannum)==0
        disp('Error. No Fanning friction factor correponds to that Reynolds number.');
    else
        y=fannum;
    end
end
