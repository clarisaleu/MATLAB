%% Problem 2

%% Main Function
%A function that inputs two row arrays, A & B, & returns a row vector
%containing: Row vector returned = [bvals, primes, avals] bvals = The
%number of elements in B > mean of A primenums = A row vector that contains
%the prime numbers larger than or equal to the minimum of the elements of A
%& less than the maximum of the elements in B avals = Sum of the prime
%numbers greater than the mean of A or less than or equal to the max of B

function [bvals,primenums,avals]=leurodriguez2(A,B)
disp('Running leurodriguez2.m...')

%Delegated to subfunction
bvals=part1(A,B);


%Part 2 and 3
vals=primes(max(B));
j=1;
res=[];
res2=[];
counter=length(vals);
while counter>0
    if vals(j)>=min(A)
        res=[res vals(j)];
    end
    if vals(j)>mean(A)
        res2=[res2 vals(j)];
    end
    counter=counter-1;
    j=j+1;
end

disp('Almost done hoss...')
summed=sum(res2);
primenums=res;
avals=summed;

%Call Display
display(bvals,primenums,avals)
end

%% A subfunction for Part 1
function y = part1(A,B)
j=1;n=0;
counter=length(B);
while counter>0
    if B(j)>mean(A)
        n=n+1;
    end
    j=j+1;
    counter=counter-1;
end
y=n;
end

%% A subfunction for display
function y=display(bvals,primenums,avals)
string1='Values of Array B greater than the mean of the elements of A: ';
string2='Prime numbers larger than or equal to the minimum of the elements of A & less than the maximum of the elements of B: ';
string3='Sum of prime numbers greater than the mean of A or less than or equal to the max of B: ';

disp(string1)
disp(bvals)
disp(string2)
disp(primenums)
disp(string3)
disp(avals)
disp('Row Vector:')
disp([bvals,primenums,avals])

end
