%Lab 7 Script
vdata=load('velocity.txt');
x=vdata(1,:);
y=vdata(2,:);
w=log10(x);
z=log10(y);
wbar=mean(w);
zbar=mean(z);
n=size(vdata);
n=n(2);

m=(n*sum(w.*z)-sum(w)*sum(z))/(n*sum(w.*w)-(sum(w))^2);
b=zbar-m*wbar;
a=10.^(b)
r=sqrt((sum((z-zbar).^2)-sum((z-m*w-b).^2))/(sum((z-zbar).^2)));

expreg=expmodelbase10(x,y);
plot(x,y,'*',x,expreg);
title('Velocity vs Time');
legend('Data','Exponential Regression Line');
xlabel('Velocity, m/s');
ylabel('Time, s');