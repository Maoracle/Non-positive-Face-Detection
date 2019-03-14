function[dist] = binary(src)%对图像进行二值化
thresh = graythresh(src);
dist = im2bw(src,thresh);