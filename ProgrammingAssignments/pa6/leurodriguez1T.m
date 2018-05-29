%% A test script for Programming Assignment #6 Problem #1

disp('Running tester script for Problem 1...')
space=sprintf(' ');
disp(space)

%Testing 3 functions: f1, f2, & f3
f1=@(x)x.^2-3.*x;
f2=@(x)sin(x)+3.*x.^2;
f3=@(x)cos(x)+5.*x;

%% Test 1
disp('Running test 1...')
fIntEst1=leurodriguez1(f1,-1,1);
fInt1=integral(f1,-1,1);
err1=abs(fIntEst1-fInt1)/fInt1;

%Display
str1=sprintf('The numerical integral of f(x)=x^2-3x using the 3-point Gaussian Quadracture Method on the interval from  x=-1 to x=1 is %f.',fIntEst1); 
str2=sprintf('The exact integral is %f & the true error is %f.',fInt1,err1);
disp(str1)
disp(str2)
disp(space)

%% Test 2
disp('Running test 2...')
fIntEst2=leurodriguez1(f2,2,20);
fInt2=integral(f2,2,20);
err2=abs(fIntEst2-fInt2)/fInt2;

%Display
str1=sprintf('The numerical integral of f(x)=sin(x)+3x^2 using the 3-point Gaussian Quadracture Method on the interval from  x=2 to x=20 is %f.',fIntEst2); 
str2=sprintf('The exact integral is %f & the true error is %f.',fInt2,err2);
disp(str1)
disp(str2)
disp(space)

%% Test 3 
disp('Running test 3...')
fIntEst3=leurodriguez1(f3,-40,2);
fInt3=integral(f3,-40,2);
err3=abs(fIntEst3-fInt3)/fInt3;

%Display
str1=sprintf('The numerical integral of f(x)=cos(x)+5x using the 3-point Gaussian Quadracture Method on the interval from  x=-40 to x=2 is %f.',fIntEst3); 
str2=sprintf('The exact integral is %f & the true error is %f.',fInt3,err3);
disp(str1)
disp(str2)
disp(space)