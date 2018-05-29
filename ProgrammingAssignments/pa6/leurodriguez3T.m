%% A test script for Programming Assignment #6 Problem #3

disp('Running tester script for Problem 3...')
space=sprintf(' ');
disp(space)
h=.01; %Step-size

%Testing 3 functions: f1, f2, & f3
f1=@(x)x.^2;
f1Prime=@(x) 2.*x;
f2=@(x)cos(x);
f2Prime=@(x)-sin(x);
f3=@(x)x.^3;
f3Prime=@(x)3.*(x.^2);

%% Test 1
disp('Running test 1...')
figure(1)
leurodriguez3(f1,-3,4);hold on;
x=-3:h:4;
f1Plot=f1Prime(x);
plot(x,f1Plot);hold off;
legend('F','Approximate Derivative of F','Exact Derivative of F')

%% Test 2
disp('Running test 1...')
figure(2)
leurodriguez3(f2,-10,10);hold on;
x=-10:h:10;
f2Plot=f2Prime(x);
plot(x,f2Plot);hold off;
legend('F','Approximate Derivative of F','Exact Derivative of F')

%% Test 3
disp('Running test 3...')
figure(3)
leurodriguez3(f3,-3,3); hold on;
x=-3:h:3;
f3Plot=f3Prime(x);
plot(x,f3Plot); hold off;
legend('F','Approximate Derivative of F','Exact Derivative of F')
