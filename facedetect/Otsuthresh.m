%�������ܣ�ͨ��OTSU�㷨�õ���ֵ����������ֵ
%����Ҷ�ͼ�������ֵ��ͼƬ

function [imgdst]=Otsuthresh(imgscr)

thresh=graythresh(imgscr);
imgdst=im2bw(imgscr,thresh);