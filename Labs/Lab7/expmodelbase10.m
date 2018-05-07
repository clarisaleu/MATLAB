function [y,r] = expmodelbase10(x,y)
if length(x)~=length(y)
    disp('Please enter two arrays of the same size.')
else
    w=log10(x);
    z=log10(y);
    n=length(x);
    zbar=mean(z);
    wbar=mean(w);
    %Perform least squares regress on (w,z) pairs
    m=(n*sum(w.*z)-sum(w)*sum(z))/(n*sum(w.*w)-(sum(w))^2);
    b=(zbar-m*wbar);
    a=10.^(zbar-m*wbar);
    r=sqrt((sum((z-zbar).^2)-sum((z-m*w-b).^2))/(sum((z-zbar).^2)));
    y=a.*x.^(m);
end
end