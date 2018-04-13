%Problem 2
%A function to find the required angle of projection in milliradians to launch
%a projectile x meters at an initial velocity v0 (meters/second).

function z = leurodriguez1_projectile(x,v0)
%x,v0>0
if v0<0 || x<0
    disp('The initial velocity and distance to travel must be positive. Try again!')
end

if v0>0 && x>0
theta=asin(((x.*9.81)./(v0.^2))).*.5;
z=theta.*10.^(3);
end

end



