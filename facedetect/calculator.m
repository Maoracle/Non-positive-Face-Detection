function [a1,b1,c1,x1,y1,s1]=calculator(a,b,c,x,y,s)
%计算归一化参数
global h i j k l m
a1=a/h; %长轴
b1=b/i; %短轴
c1=c-j; %椭圆倾角
x1=(x-k)/k; %质心x
y1=(y-l)/l; %质心y
s1=s/m; %椭圆面积
