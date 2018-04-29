%Problem 2 - A script that produces a plot of S versus t over the interval
%t=0 to t=10 where S is the subtrate concentration as defined by The
%Michaelis-Menten model which decribes the kinetics of enzyme medicated
%reactions.

tvals=0:.01:10;
svals=[];
for t=0:.01:10
    f=@(s) 8-.7.*(t)+2.5.*log10(8./s)-s;
    y=cleurodriguez2(f,.5,.0001,200);
    svals=[svals y];
end
disp('Plotting...')
plot(tvals,svals,'.m')
title('The Subtrate Concentration vs. Time as Defined by The Michaelis-Mentin model')
ylabel('Subtrate Concentration - S')
xlabel('Time - t')