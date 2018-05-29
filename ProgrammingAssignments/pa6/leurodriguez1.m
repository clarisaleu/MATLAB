%% Programming Assignment #6 - Problem #1
%% Created By: Clarisa Leu-Rodriguez

%A function that inputs an anonymous function f, lower bound a, and an upper
%bound b and returns the approximate integral of f on [a,b] using a 3-point
%gaussian quadracture formula.

function y=leurodriguez1(f,a,b)
%If the lower and upper bounds (a or b) aren't equal to -1 or 1, convert the bounds to -1 and 1 &
%convert f to g according to the formula.
if a~=-1 || b~=1
    %New bounds & converted function
    c=(b-a)/2;d=(b+a)/2;
    g=@(x)f(c*x+d)*c;
    f=g;
end
    %Return the appoximate integral using the 3-point gaussian quadracture
    %formula.
    y=(5/9).*f(-sqrt(3/5))+(8/9).*f(0)+(5/9).*f(sqrt(3/5));
end