req=(50*40)/(90);
to=(req)*160*(10^-9);
i=@(t)1.6*10^(-3).*exp(-t./to);
pow=@(t)40000.*(1.6*10^(-3).*exp(-t./to)).^2
q=integral(pow,0,Inf);
disp(q)
perc