%Values of A ranging from 1 to 4 with a step size of 0.001
avals=1:.001:4;

%% Open-Iterative Method - Modified Secant Method
disp('Open-Iterative Method - Modified Secant Method:')
tic
c02=secant(1.285);
air=secant(1.4);
nblgas=secant(1.667);
toc

%Plot
figure(4)
disp('Plotting using the modified secant method...')
plot(avals,c02,'.r');hold on;
plot(avals,air,'.b');hold on;
plot(avals,nblgas,'.m');hold off;
title('Modified Secant Method: Normalized Area of a de Laval Nozzlve vs. the Mach Number for Different Gases')
legend('C02','Air','Noble Gasses')
legend('Location','north','Orientation','horizontal')
xlabel('Normalized Area - A')
ylabel('Mach Number - M')
axis ([0 4.25 0 3.75])

%% Bracketing-Method
disp('Bracketing Method - Bisection:')
tic
c02bi=bisection(1.285);
airbi=bisection(1.4);
nblgasbi=bisection(1.667);
toc


%Plot
figure(2)
disp('Plotting using the bisection method...')
plot(avals,c02,'.r');hold on;
plot(avals,air,'.b');hold on;
plot(avals,nblgas,'.m');hold off;
title('Bisection Method: Normalized Area of a de Laval Nozzlve vs. the Mach Number for Different Gases')
legend('C02','Air','Noble Gasses')
legend('Location','north','Orientation','horizontal')
xlabel('Normalized Area - A')
ylabel('Mach Number - M')
axis ([0 4.25 0 3.75])

