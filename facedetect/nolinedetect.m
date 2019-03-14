function [bwycbcr]=nolinedetect(imgrgb)

%将RGB色彩空间转换为Ycbcr色彩空间
imgrgb3=rgb2ycbcr(imgrgb);
y=imgrgb3(:,:,1);
cb=imgrgb3(:,:,2);
cr=imgrgb3(:,:,3);
%==================================
%在Ycbcr色彩空间中分割肤色区域
cb=double(cb);
cr=double(cr);
y=double(y);
[m,n,d]=size(imgrgb3);
bwycbcr=zeros(m,n);
for i=1:m
    for j=1:n
        if y(i,j)<125
            cb1=108+(125-y(i,j))*10/109;
            cr1=154-(125-y(i,j))*10/109;
            wcb=23+(y(i,j)-16)*23.97/109;
            wcr=20+(y(i,j)-16)*18.76/109;
            cb1=(cb(i,j)-cb1)*46.97/wcb+cb1;
            cr1=(cr(i,j)-cr1)*38.76/wcr+cr1;
        elseif y(i,j)>188
            cb1=108+(y(i,j)-188)*10/47;
            cr1=154+(y(i,j)-188)*22/47;
            wcb=14+(235-y(i,j))*32.97/47;
            wcr=10+(235-y(i,j))*28.76/47;
            cb1=(cb(i,j)-cb1)*46.97/wcb+cb1;
            cr1=(cr(i,j)-cr1)*38.76/wcr+cr1;
        else
            cb1=cb(i,j);
            cr1=cr(i,j);
        end
        x1=[-0.819 0.574]*[cb1-109.38;cr1-152.02];
        y1=[-0.574 -0.819]*[cb1-109.38;cr1-152.02];
        if (x1-1.60).^2/644.6521+(y1-2.41).^2/196.8409<=1
            bwycbcr(i,j)=1;
        else bwycbcr(i,j)=0;
        end
    end 
end