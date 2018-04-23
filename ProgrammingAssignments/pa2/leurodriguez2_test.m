%% Problem 2
%A test script for problem 2

%% Test1
disp('Running tester script for problem 2...')
disp('Running the first test...')
A=[1,3,4,5,6,3,2];
B=[4,5,6,4,2,6,3];
disp('A =')
disp(A)
disp('B =')
disp(B)
[bvals,primenums,avals]=leurodriguez2(A,B)
disp('----------------------------------------------')

%% Test 2
disp('Runing the second test...')
A=[6,59,20];
B=[4,5,7,8,4,22];
disp('A =')
disp(A)
disp('B =')
disp(B)
[bvals,primenums,avals]=leurodriguez2(A,B)
disp('----------------------------------------------')


%% Test 3
disp('Runing the third test...')
A=[3,4,5,6,4,200];
B=[3,4,5,20,4];
disp('A =')
disp(A)
disp('B =')
disp(B)
[bvals,primenums,avals]=leurodriguez2(A,B)
disp('Done running tester script!')
