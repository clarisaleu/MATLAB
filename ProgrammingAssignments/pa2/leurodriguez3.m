%% Problem 3

%% Main Function
%A function that inputs an initial growth rate k1, a final growth rate k2,
%and a step size h. Returns a plot of the range of k values between k1 and
%k2 vs the different long term population levels of a logistic population
%occuring between 80 and 120 generations.

function y = leurodriguez3(k1,k2,h)
disp('Running leurodriguez3.m...')
popvals=[logistic(k1,120)];
counter=k1;
kcur=k1;
kvals=k1:h:k2;
counter=k1+h;

while counter<k2
    counter=counter+h;
    kcur=counter;
    pcur=logistic(kcur,120);
    popvals=[popvals;pcur];
end
plotgraph(kvals,popvals);
end

%% A subfunction that returns the population carrying capacity of a population over 80 to 120 generations with a growth rate k in a vector
function y = logistic(k,n)
pold=.5;
popvals=[pold];
counter=0;
while(counter<n)
    counter=counter+1;
    pnew=k.*pold.*(1-pold);
    pold=pnew;
    popvals=[popvals pnew];
end
res = popvals(80:120);
y=res;
end

%% A subfunction to plot the graph
function y = plotgraph(kvals,popvals)
disp('Plotting...')
disp('Almost done...')
plot(kvals,popvals,'.')
title('Population Levels For Logistic Populations')
xlabel('Growth Rate Constant -  k')
ylabel('Percent of Carrying Capacity of Population from generations 80 to 120')
end

