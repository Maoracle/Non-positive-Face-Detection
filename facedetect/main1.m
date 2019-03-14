clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 读入待检测图像
Src= imread('ghforward.jpg');
Dst=Src;
figure,
imshow(Src);

%img_gray=rgb2gray(Src);
%img_Canny=edge(img_gray,'canny');

%Ycbcr=nonlinerTrans(Src);
%Src1=lightcompensation(Src);
%figure,
%imshow(Src);
Ycbcr=rgb2ycbcr(Src);
%figure,     
%imshow(Ycbcr);
img_cr=Ycbcr(:,:,3);
thresh=graythresh(img_cr);
img_detect=im2bw(img_cr,thresh);%这三步就是OTSU方法

global a b c;
[a,b,c]=size(Ycbcr);

%img_detect=skindetect(Ycbcr);%简单的高斯肤色模型
fenge=img_detect;
figure,
imshow(fenge);
%imwrite(fenge,'gaosimodel.jpg');

SE = strel('square',5); 
%imf=imdilate(img_detect,SE);
imf=imopen(img_detect,SE);         %开运算（即先腐蚀再膨胀），消除杂散点 
opendeal=imf;
figure,
imshow(opendeal);
imf=imdilate(imf,SE);
%figure,imshow(Ibwopen); 
%Ibwoc=imclose(Ibwopen,SE);      %闭运算，去掉由于开运算引入的许多缺口 
%figure,imshow(Ibwoc); 
imf=imfill(imf,'holes');      %填充孔洞 
figure,imshow(imf);
%%%%%%%%%%%%%%%%%%%%%%%根据填充率去除手脚、胳膊等非人脸区域%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%img_Del=imf+img_Canny;
img_Delete=NonSkinDelete(imf);

%%%%%%%%%%%%%%%%%%%%%%%%%%根据区域填充率来去除一些背景中的类肤色区域，例如一条斜线等%%%%%%%%%%%%%%%%%%%%%%%%%%
%


%%%%%%%%%%%%%%%%%%%%%%%%%%根据肤色区域的长宽比来除去一些非人脸区域%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[L2,num2]=bwlabel(B1,8);     %连通区域标记 
Img_dst=zeros(size(B1));
for i=1:num2
    [r,c] = find(L2==i);  
    left(i)=min(c);
    right(i)=max(c);
    up(i)=min(r);
    down(i)=max(r);
end
for i=1:num2
    if ((down(i)-up(i))/(right(i)-left(i)))>0.8 &&((down(i)-up(i))/(right(i)-left(i)))<2
        [x,y]=find(L2==i);
        Img_dst=Img_dst+bwselect(B1,y,x,8);%%%把满足长宽比在0.8到2的区域留下
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%保留最大联通区域%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L3=bwlabel(img_Delete);
states=regionprops(L3);
Ar=cat(1,states.Area);
ind=find(Ar==max(Ar));
img_Delete(find(L3~=ind))=0;
figure,
imshow(img_Delete);

Ie=imerode(img_Delete,SE);
Iout=img_Delete-Ie;
%figure,imshow(Iout);
im2=imfill(Iout,'holes');
%figure,imshow(im2);
im3=bwperim(im2);
figure,imshow(im3);
%[row,col]=find(im3);

figure,
imshow(Dst);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%把人脸框出来%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[L4 num3]=bwlabel(img_Delete,8);     %连通区域标记
for i=1:num3
    [r,c] = find(L4==i);  
    left(i)=min(c);
    right(i)=max(c);
    up(i)=min(r);
    down(i)=max(r);
end

hold on;
for i=1:num3
    if(down(i)>(up(i)+(right(i)-left(i))*1.2))     %人脸长宽比限制
       down(i)=up(i)+(right(i)-left(i))*1.2;
    end
    x=[left(i);left(i);right(i);right(i);left(i)];
    y=[up(i);down(i);down(i);up(i);up(i)];
    plot(x,y);      %画框
end
hold off;