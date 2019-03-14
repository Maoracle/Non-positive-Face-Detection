function [imgdst] = decreaseLight(src)
ycbcr = rgb2ycbcr(src);
[a,b,c] = size(ycbcr);
y = ycbcr(:,:,1);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);
for p=1:a
    for q = 1:b
        if(y(p,q)>140)
            y(p,q)=125;
            %cb(p,q)=cb(p,q)-30;
            %cr(p,q)=cr(p,q)-30;
        end
    end
end
newycbcr = cat(3,y,cb,cr);
imgdst = ycbcr2rgb(newycbcr);
