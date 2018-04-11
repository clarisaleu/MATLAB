%A function that returns the graph of population levels for a logistic
%population of n generations given a constant of k and constant n.

function y=logistic_sequence(k,n)
if n < 0 
disp('Sorry, n must be positive. Try again!')
end
if n>0
counter=0;
%Time period

t=[0:n];
pold=.5;
popvals=[pold];

while(counter<n)
    counter=counter+1;
    pnew=k.*pold.*(1-pold);
    pold=pnew;
    popvals=[popvals;pnew];
end

plot(t,popvals,'om')
str=sprintf('Population Levels for a Logistic Population, Growth Rate k= %f', k);
title(str)
xlabel('Generations')
ylabel('Percent of Carrying Capacity')

end
end



