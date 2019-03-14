function [avg] = avgcb(src)
ycbcr=rgb2ycbcr(src);
cb = ycbcr(:,:,2);

cb=cb(:);
p=cb>16;
cb=cb(p);
avg = mean(cb);