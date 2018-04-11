%A function that returns a column vector containing the first n Fibonacci
%numbers.
%For Loop Solution

function y = fib_forloop(n)
f1=1;
f2=1;
fibnew=f1+f2;
fibs=[f1;f2;fibnew];

for i=3:1:n-1
f1=f2;
f2=fibnew;
fibnew=f1+f2;
fibs=[fibs;fibnew];
end

y=fibs;
end

