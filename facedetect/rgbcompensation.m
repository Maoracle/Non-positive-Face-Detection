%light compensation function
function [Dst]=rgbcompensation(Src)
%Src=imread('fyjforward.jpg');
%基于白平衡的RGB补偿法
YCbCr=rgb2ycbcr(Src);
Y=YCbCr( :,:,1);
Dim=size(Y);
BuffLen=Dim(1)*Dim(2);
BaRatio=0.05;
PixSum=BuffLen*0.05;
[count,level]=imhist(Y);
Sum=0;
Threshold=0;
for i=256:-1:1
    Sum=Sum+count(i);
    if Sum>PixSum
        Threshold=i;
        break;
    end
end
AvgR=double(0);
AvgG=double(0);
AvgB=double(0);
R=double(Src(:,:,1));
G=double(Src(:,:,2));
B=double(Src(:,:,3));
Pixsum=0;
for i=1:BuffLen
    if Y(i)>Threshold 
        Pixsum=Pixsum+1;
        AvgR=AvgR+R(i);
        AvgG=AvgG+G(i);
        AvgB=AvgB+B(i);
    end
end
RRatio=(Pixsum*255)/AvgR;
GRatio=(PixSum*255)/AvgG;
BRatio=(PixSum*255)/AvgB;
for i=1:BuffLen
    if Y(i)>Threshold 
        R(i)=255;
        G(i)=255;
        B(i)=255;
    else
        R(i)=R(i)*RRatio;
        G(i)=G(i)*GRatio;
        B(i)=B(i)*BRatio;
    end
end
%im(:,:,1)=R;
%im(:,:,2)=G;
%im(:,:,3)=B;

im=cat(3,R,G,B);
Dst=uint8(im);

%imshow(uint8(im));
%R1=double(im(:,:,1));
%G1=double(im(:,:,2));
%B1=double(im(:,:,3)); 









        