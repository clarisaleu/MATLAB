function dydt=vdp1(t,y)

f=@(t,y,z)z;
g=@(t,y,z)(T-(1200-mf.*t).*g-cd.*(z).^2)./(1200-mf.*t);



dydt=[y(2);(28000-(1200-20.*t)).*9.81-.05.*y(2).^2)./(1200-20.*t)]