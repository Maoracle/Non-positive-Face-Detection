%对人脸部分进行光照补偿 src为原图，face为原图对应的肤色检测二值图
function [imgdist] = facepartCompensation(src,face)
[a,b,c] = size(src);
