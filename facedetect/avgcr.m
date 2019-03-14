function [avg] = avgcr(src)
ycbcr=rgb2ycbcr(src);
cr = ycbcr(:,:,3);

cr=cr(:);
p=cr>16;
cr=cr(p);
avg = mean(cr);