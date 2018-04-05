%What effect does A have on the graph? What about k and omega?

%Varying  A changes the maximum amplitude of the spring (where you start
%it)
c=2;
y2=c.*exp(-k.*t).*sin(omega.*t+phi);

plot(t,y,'color','r');hold on;
plot(t,y2,'color','b');

%Varying omega changes the period of oscillation
y3=A.*exp(-k.*t).*sin(c.*t+phi);
plot(t,y3,'color','m');

title('Lab #1 Graph - Unforced Oscillating Systems')
xlabel('x')
ylabel('y')
axis([0 6*pi./c -10 10])

