%function [] = ellipseFit(imgsrc)
imgsrc = imread('01.jpg');
F=@(p,x)p(1)*x(:,1).^2+p(2)*x(:,1).*x(:,2)+p(3)*x(:,2).^2+p(4)*x(:,1)+p(5)*x(:,2)+p(6);
BW = edge(imgsrc,'canny');
[Lin,num]=bwlabel(BW,8);
Up=find(Lin==1);
Upx=Up(:,0);
Upy=Up(:,1);
p0=[1 1 1 1 1 1];

p=nlinfit(Up,zeros(size(Up,1),1),F,p0);
plot(Upx,Upy,'ro');
hold on;
xmin=min(Upx);
xmax=max(Upx);
ymin=min(Upy);
ymax=max(Upy);
ezplot(@(x,y)F(p,[x,y]),[-1+xmin,1+xmax,-1+ymin,1+ymax]);
title('曲线拟合');
legend('样本点','拟合曲线')