%A function that returns a column vector containing the first n Fibonacci
%numbers.
%Recursive Solution

function y=fib_recur(n)

if(n==0)
    y=0;
else
    y=[fib_recur(n-1);fib(n)];

end

function y=fib(n)
if n<3
    y(1:n)=1;
else
    y(n)=fib(n-2)+fib(n-1);
end

y=y(n);

end

end









