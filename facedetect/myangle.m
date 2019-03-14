function [x,y] = myangle(a,b)
len = length(a);
for i = 1:len
    for j = 1:i - 1
        for m = i + 1:len
            if (j == i || m == i)
                continue
            end
            x1 = a(m) - a(i);
            y1 = b(m) - b(i);
            x2 = a(j) - a(i);
            y2 = b(j) - b(i);
            ang_direct = 180 + rad2deg(atan2(y1, x1));
            angle = rad2deg(acos((x1*x2 + y1*y2)/(sqrt(x1^2 + y1^2) + sqrt(x2^2 + y2^2))));
            if ((100 < ang_direct) && (ang_direct < 180) && (90 < angle) && (angle< 170))
                break
            end
        end
    end
end
x = a(i);
y = b(i);


                