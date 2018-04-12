%A function that returns the Fibonacci estimate of the golden ratio that is
% has a relative error less than epsilon.

function y = goldenratiofibapprox(epsilon)
if epsilon <0
disp('Sorry hoss, epsilon is greater than zero. Try again!')
end
if epsilon >0
        f1=1;f2=1;
        fibnew=f1+f2;
        fibs=[f1;f2;fibnew];
        goldenratio=f2/f1;
   while(abs(goldenratio-sum(fibs))<epsilon)
        f1=f2;
        f2=fibnew;
        fibnew=f1+f2;
        fibs=[fibs;fibnew];
end
end

y=sum(fibs);
end
