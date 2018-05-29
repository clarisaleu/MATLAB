%% Programming Assignment #6 - Problem #2
%% Created By: Clarisa Leu-Rodriguez

%A function that accepts a row vector of x values and returns a matrix
%containing: a row vector of C(x) values computed using the Gaussian
%quadracture function from part 1, a row vector of values of C(x) computed
%using the trapezoid rule with 10 subdivisions, a row vector of C(x) values
%computed using the build in integral() function, and a row vector
%containing the run time needed to complete the computation for each
%method. 

function [quad,trap,exact,times] = leurodriguez2(x)

f=@(t)cos(t.^2);

tic
row1=[leurodriguez1(f,0,x(1))];
for i=2:1:length(x)
row1=[row1 leurodriguez1(f,0,x(i))];
end
quad=row1;
time1=toc;

tic
row2=[trapint(f,0,x(1),10)];
for j=2:1:length(x)
row2=[row2 trapint(f,0,x(j),10)];
end
trap=row2;
time2=toc;

tic
row3=[integral(f,0,x(1))];
for k=2:1:length(x)
row3=[row3 integral(f,0,x(i))];
end
exact=row3;
time3=toc;

times=[time1 time2 time3];

end
