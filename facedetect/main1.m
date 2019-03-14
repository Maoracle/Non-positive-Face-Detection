clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��������ͼ��
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
img_detect=im2bw(img_cr,thresh);%����������OTSU����

global a b c;
[a,b,c]=size(Ycbcr);

%img_detect=skindetect(Ycbcr);%�򵥵ĸ�˹��ɫģ��
fenge=img_detect;
figure,
imshow(fenge);
%imwrite(fenge,'gaosimodel.jpg');

SE = strel('square',5); 
%imf=imdilate(img_detect,SE);
imf=imopen(img_detect,SE);         %�����㣨���ȸ�ʴ�����ͣ���������ɢ�� 
opendeal=imf;
figure,
imshow(opendeal);
imf=imdilate(imf,SE);
%figure,imshow(Ibwopen); 
%Ibwoc=imclose(Ibwopen,SE);      %�����㣬ȥ�����ڿ�������������ȱ�� 
%figure,imshow(Ibwoc); 
imf=imfill(imf,'holes');      %���׶� 
figure,imshow(imf);
%%%%%%%%%%%%%%%%%%%%%%%���������ȥ���ֽš��첲�ȷ���������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%img_Del=imf+img_Canny;
img_Delete=NonSkinDelete(imf);

%%%%%%%%%%%%%%%%%%%%%%%%%%���������������ȥ��һЩ�����е����ɫ��������һ��б�ߵ�%%%%%%%%%%%%%%%%%%%%%%%%%%
%


%%%%%%%%%%%%%%%%%%%%%%%%%%���ݷ�ɫ����ĳ��������ȥһЩ����������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[L2,num2]=bwlabel(B1,8);     %��ͨ������ 
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
        Img_dst=Img_dst+bwselect(B1,y,x,8);%%%�����㳤�����0.8��2����������
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%���������ͨ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�����������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[L4 num3]=bwlabel(img_Delete,8);     %��ͨ������
for i=1:num3
    [r,c] = find(L4==i);  
    left(i)=min(c);
    right(i)=max(c);
    up(i)=min(r);
    down(i)=max(r);
end

hold on;
for i=1:num3
    if(down(i)>(up(i)+(right(i)-left(i))*1.2))     %�������������
       down(i)=up(i)+(right(i)-left(i))*1.2;
    end
    x=[left(i);left(i);right(i);right(i);left(i)];
    y=[up(i);down(i);down(i);up(i);up(i)];
    plot(x,y);      %����
end
hold off;