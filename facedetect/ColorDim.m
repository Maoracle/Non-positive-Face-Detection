%求颜色空间分量
function [c1, c2, c3]=ColorDim(imgsrc)
%img = rgb2ycgcr(imgsrc);
%img = rgb2ycbcr(imgsrc);
c1 = double(imgsrc(:,:,1));
c2 = double(imgsrc(:,:,2));
c3 = double(imgsrc(:,:,3));
plot3(x,y,z,'b.','MarkerSize',0.5);