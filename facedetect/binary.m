function[dist] = binary(src)%��ͼ����ж�ֵ��
thresh = graythresh(src);
dist = im2bw(src,thresh);