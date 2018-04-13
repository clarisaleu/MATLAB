%A function that returns the Fibonacci estimate of the golden ratio that
% has a relative error less than epsilon.

function y = goldenratiofibapprox(epsilon)
if epsilon <0
disp('Sorry hoss, epsilon is greater than zero. Try again!')
else
        f1=2;f2=3;
        fibnew=f1+f2;
        goldenratioold=1;
        goldenrationew=2;
 while(abs((goldenrationew-goldenratioold)./(goldenrationew))>epsilon)
        f1=f2;
        f2=fibnew;
        fibnew=f1+f2;
        goldenratioold=goldenrationew;
        goldenrationew=f2/f1;
 end
y=goldenrationew;
end
end
