%Problem 1 - A script implementing the fixed point method of finding a root
%for e^-x=x.

prompt='Hey hoss make an initial guess: ';
x0=input(prompt);
x1=exp(-x0);
vals=[x1];
prompt2='Cool hoss, how many iterations?'
counter=input(prompt2)

while counter>0
    x0=x1;
    x1=exp(-x0);
    vals=[vals x1]
    counter=counter-1;
end

disp(vals);


