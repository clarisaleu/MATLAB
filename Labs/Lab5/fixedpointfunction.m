%A function that returns the tension of a cable given an initial guess t0
%and an error
function y = fixedpointfunction(t0,err)
t1=t0.*cosh(500./t0)-100;
vals=[t1];
maxit=500;
j=1;

while abs(t1-t0)>err && j<maxit
    t0=t1;
    j=j+1;
    t1=t0.*cosh(500./t0)-100;
    vals=[vals t1]
end

y=vals(length(vals))
end
