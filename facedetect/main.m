clc
clear all
close all

Files=dir(strcat('E:\\biyesheji\\facelib\\tanpaper\\','*.jpg'));%找到E盘的图片
LengthFiles=length(Files);%计算一共有多少张图片

%array(8,20)={0};%创建数组存放平均值和方差
%array=cell2mat(array);

for k=1:LengthFiles
img=imread(strcat('E:\biyesheji\facelib\tanpaper\',Files(k).name));%一张张图片读取
%pImg=rgbcompensation(img);
gaosi_dst=skindetect(img);%高斯模型肤色分割
imwrite(gaosi_dst,['E:\biyesheji\facelib\tanpaper1\',num2str(k),'.jpg']);%保存
%com_img=nolinetransaction(img)
%gdyuzhi_dst=gdyuzhi(com_img);%Qtsu肤色分割
%imwrite(gaosi_dst,['E:\biyesheji\facelib\finaltest\','img_',num2str(k),'.jpg']);%保存
%img_dst=NonSkinDelete(img);
%imwrite(img_dst,['E:\biyesheji\facelib\finaltest\','imgdst_',num2str(k),'.jpg']);%保存
end

%gdyuzhi_dst=gdyuzhi(img);%固定阈值分割法
%imwrite(gdyuzhi_dst,['E:\biyesheji\facelib\testlib\','ima_',num2str(k),'.jpg']);%保存

%{
img_Ycbcr=rgb2ycbcr(img);
img_Y=img_Ycbcr(:,:,1);
img_CB=img_Ycbcr(:,:,2);
img_CR=img_Ycbcr(:,:,3);
[height,width,depth]=size(img);

total=0;%每一次读入一幅新图片变刷新所有值为0
ave_Y=double(0);
ave_CB=double(0);
ave_CR=double(0);
varience_Y=double(0);
varience_CB=double(0);
varience_CR=double(0);
aveY=double(0);
varienceY=double(0);

for i=1:height
    for j=1:width
        if qtsu_dst(i,j)==1
            ave_Y=ave_Y+double(img_Y(i,j));
            ave_CB=ave_CB+double(img_CB(i,j));
            ave_CR=ave_CR+double(img_CR(i,j));
            total=total+1;
        else
            aveY=aveY+double(img_Y(i,j));
        end
    end
end
ave_Y=ave_Y/total;
ave_CB=ave_CB/total;
ave_CR=ave_CR/total;
aveY=aveY/(height*width-total);%平均值

for i=1:height
    for j=1:width
        if qtsu_dst(i,j)==1
            varience_Y=varience_Y+(double(img_Y(i,j))-ave_Y)*(double(img_Y(i,j))-ave_Y);
            varience_CB=varience_CB+(double(img_CB(i,j))-ave_CB)*(double(img_CB(i,j))-ave_CB);
            varience_CR=varience_CR+(double(img_CR(i,j))-ave_CR)*(double(img_CR(i,j))-ave_CR);
        else
            varienceY=varienceY+(double(img_Y(i,j))-aveY)*(double(img_Y(i,j))-aveY);
        end
    end
end
varience_Y=sqrt(varience_Y/total);
varience_CB=sqrt(varience_CB/total);
varience_CR=sqrt(varience_CR/total);
varienceY=sqrt(varienceY/(height*width-total));

array(1,k)=ave_Y;
array(2,k)=ave_CB;
array(3,k)=ave_CR;
array(4,k)=varience_Y;
array(5,k)=varience_CB;
array(6,k)=varience_CR;
array(7,k)=aveY;
array(8,k)=varienceY;

end
%}