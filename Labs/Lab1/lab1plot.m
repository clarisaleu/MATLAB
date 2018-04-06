%Varying A changes the maximum amplitude of the spring (where you start
%it) & Varying omega changes the period of oscillation


c=2;

%Vary The Amplitude
y2=c.*exp(-k.*t).*sin(omega.*t+phi);
plot(t,y2,'--xg');hold on;

%Varying Omega
y3=A.*exp(-k.*t).*sin(c.*t+phi);
plot(t,y3,'-*c');

title({'Varying {\omega} & A - Unforced Oscillating Systems';'y=Ae^{-kt}sin({\omega}t+{\phi})'})
legend('y=10e^{-0.25t}sin(2.5t+1.5)','y=2e^{-0.25t}sin(2.5t+1.5)','y=10e^{-0.25t}sin(2t+1.5)')

