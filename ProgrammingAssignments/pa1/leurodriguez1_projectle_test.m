%A script to test problem number 2

disp('Now runninig test for problem 2...')

test1=leurodriguez1_projectile(5,50);
test2=leurodriguez1_projectile(3,20);
test3=leurodriguez1_projectile(300,90);
test4=leurodriguez1_projectile(400,900);

disp('The required angle of trajectory (in mrad) to travel 5m at an initial velocity of 50m/s is:')
disp(test1)
disp('The required angle of trajectory (in mrad) to travel 3m at an initial velocity of 20m/s is:')
disp(test2)
disp('The required angle of trajectory (in mrad) to travel 300m at an initial velocity of 90m/s is:')
disp(test3)
disp('The required angle of trajectory (in mrad) to travel 400m at an initial velocity of 900m/s is:')
disp(test4)

