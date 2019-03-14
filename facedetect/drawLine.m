function [imgdst] = drawLine(img,y1,x1,y2,x2) %ÊäÈëÎªÔ­Í¼,x1,y1,x2,y2
a = polyfit([x1,x2],[y1,y2],1);
for x = x1:x2
    y = ceil(a(1)*x + a(2));
    img(x,y) = 0;
end
for y = y1:y2
    x = ceil((y-a(2))/a(1));
    img(x,y) = 0;
end
imgdst = img;

    