sadata=load('density.txt');
W=sadata(1,:);
A=sadata(2,:);

linreg=linrega(W,A);
expmodelbasee=expmodelwithe(W,A);
expmodelbaseten=expmodelbase10(W,A);

plot(W,A,'*',x,expmodelbasee);
axis([50 100 0 5])
title('Weight vs. SA');
%legend('Data','Exponential Regression Line');
xlabel('Weight, kg');
ylabel('SA, m^2');