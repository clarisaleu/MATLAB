function dydt=vdp1(t,y)

dydt=[y(2);(28000-(1200-20*t)*9.81-.05*y(2)^2)/(1200-20*t)]
end