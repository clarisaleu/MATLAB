function trapsum = trapint(f,a,b,n)
%Quick and dirty implmentation of the trapezoidal integration routine.
%f is the function and [a,b] is the interval. n is the number of
%subintervals to use.
dx=(b-a)/n;

%Note that linspace breaks things into n equally spaced points. This would
%generate only n-1 subintervals. So, we have to boost the value up by 1.
xrange=linspace(a,b,n+1);
trapsum=0;
for i=1:n
    trapsum=trapsum+dx*((f(xrange(i+1))+f(xrange(i)))/2);
end


end

