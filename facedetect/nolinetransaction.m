function [Dst]=nolinetransaction(Scr)
%Scr=imread('fyjdown.jpg');
%自适应非线性变换
img_ycbcr=rgb2ycbcr(Scr);
img_y=img_ycbcr(:,:,1);
Dim=size(img_y);
Num=Dim(1)*Dim(2);
Pixsum=0.05*Num;
sum=0;
Sum=0;
[count,level]=imhist(img_y);
for i=1:256
    sum=sum+count(i);
    if sum>Pixsum
        B=i-1;
        break;
    end
end
for i=256:-1:1
    Sum=Sum+count(i);
    if Sum>Pixsum
        E=i+1;
        break;
    end
end
for i=1:Dim(1)
    for j=1:Dim(2)
        if img_y(i,j)<B
            img_y(i,j)=0;
        elseif img_y(i,j)>=B && img_y(i,j)<=E
            img_y(i,j)=255*(log(double(img_y(i,j))-log(B)))/(log(E)-log(B));
        else
            img_y(i,j)=255;
        end
    end
end
Dst=img_ycbcr;

    