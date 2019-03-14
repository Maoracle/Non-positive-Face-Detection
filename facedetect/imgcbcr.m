function [] = imgcbcr(src)
ycbcr = rgb2ycbcr(src);
y = ycbcr(:,:,1);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);
[a,b,c] = size(src);
s=[];t=[];z=[];
for p=1:a
    for q=1:b
        k = cb(p,q);
        s=[s;p];
        t=[t;q];
        z=[z;k];
    end
end
plot3(s,t,z,'o');

% p = y>140;
% outcb = cb(p);
% outcr = cr(p);

        
    