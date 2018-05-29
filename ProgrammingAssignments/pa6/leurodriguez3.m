%% Programming Assignment #6 - Problem #1
%% Created By: Clarisa Leu-Rodriguez

%A function that accepts an anonymous function f, lower bound a, and upper
%bound b and plots the function and it's derivative on [a,b] using the high
%accuracy backward and forward looking differentation formula.

function y=leurodriguez3(f,a,b)
h=.01;
xVals=a:h:b;
fPlot=f(xVals);
fPrime=[];

%Use the forward looking formula for all values of x except for the last
%point
for i=1:1:(length(xVals)-2)
fPrimeEst=(-f(xVals(i+2))+4*f(xVals(i+1))-3*f(xVals(i)))/(2*h);
fPrime=[fPrime fPrimeEst];
end

%Use the backward looking for the last point
for j=length(xVals)-1:1:length(xVals)
fPrimeEst=(3*f(xVals(j))-4*f(xVals(j-1))+f(xVals(j-2)))/(2*h);
fPrime=[fPrime fPrimeEst];
end

%Plot
plot(xVals,fPlot,xVals,fPrime);
title('Problem #3 - Using the High Accuracy Forward & Backward Looking Differentation Formula');
xlabel('x');
ylabel('y');
legend('F','Approximate Derivative of F')
y=fPrime;

end