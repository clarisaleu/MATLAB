%Problem 1
%A function to plot the graph of an unforced oscillating system over time.


function y = leurodriguez1(A,k,w,phi)
%A,k>0.
if A<0 || k<0
    disp('A and k are positive constants. Try again!')
end

if A>0 && k>0
   
%t=0 to t=10pi/w. 
t = linspace(0,10*pi/w,200); 
y = A.*exp(-k.*t).*sin(w*t+phi);

%Display
plot(t,y,'-.dm');
title({'Problem #1 Graph - Unforced Oscillating Systems';'y=Ae^{-kt}sin({\omega}t+{\phi})'})
xlabel('t - Time (seconds)')
ylabel('y - Height (cm)')
legend('y=Ae^{-kt}sin(wt+phi)')

end

end






