%Problem 2 - A function that inputs two constants [A & B], a range of
%x-values [x1,x2], a range of y-values [y1,y2], and an error tolerance.
%Returns an nx2 matrix whose rows are all of the solutions found for (x,y)
%based on Problem 1 from PA4.

function y = leurodriguez2(A,B,rangeX,rangeY,errtol)
lowerX=rangeX(1);
upperX=rangeX(2);
lowerY=rangeY(1);
upperY=rangeY(2);
roots=[];

for i=lowerX:.1:upperX
    for j=lowerY:.1:upperY
        res=leurodriguez1(A,B,[i,j],errtol);
        if(isinf(res)==1)
            res=[];
        end
        res=round(res);
        roots=[roots;res];
    end
end

disp('All Solutions (x,y) Found Rounded to the Nearest Whole Number:')
y=unique(roots,'rows')

end
