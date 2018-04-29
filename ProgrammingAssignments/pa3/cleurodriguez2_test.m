%A test script for Problem 2

format long;
%Initial guess of zero
f=@(x)x.^2-4;
cleurodriguez2(f,0,.001,400)

f=@(x)x.^2-4;
cleurodriguez2(f,1.5,.00001,100)

f=@(x)x.^2-9;
cleurodriguez2(f,-10,.001,100)