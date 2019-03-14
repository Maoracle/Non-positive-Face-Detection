%函数功能：通过OTSU算法得到二值化的最优阈值
%输入灰度图像，输出二值化图片

function [imgdst]=Otsuthresh(imgscr)

thresh=graythresh(imgscr);
imgdst=im2bw(imgscr,thresh);