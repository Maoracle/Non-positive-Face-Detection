function [imgdst] = adaptImgcbcr(src)
ycbcr = rgb2ycbcr(src);
[a,b,c] = size(ycbcr);
y = ycbcr(:,:,1);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);
acb = avgcb(src);
cbde = acb - 135;
acr = avgcr(src);
crde = acr - 125;
for p=1:a
    for q=1:b
        cb(p,q) = cb(p,q) - cbde;
        cr(p,q) = cr(p,q) - crde;
    end
end
newycbcr = cat(3,y,cb,cr);
imgdst = ycbcr2rgb(newycbcr);