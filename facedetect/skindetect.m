%函数功能：利用单高斯模型进行肤色分割
%输入RGB彩色图，输出分割后的二值化图片

function [imgdst]=skindetect(imgsrc)
%img_ycbcr=rgb2ycbcr(imgsrc);

img_ycgcr=rgb2ycgcr(imgsrc);
[a,b,c]=size(img_ycgcr);
cg=double(img_ycgcr(:,:,2));
cr=double(img_ycgcr(:,:,3));
imgdst=zeros(a,b);
for p=1:a
    for q=1:b
        w=[cg(p,q),cr(p,q)];
        %m=[117.4316 133.6699];
        %m=[117.4316 135.5599];%最佳
        %m=[117.4316 130.5599];失效
        %m=[110.4316 135.5599];
        %m=[110.4316 140.5599];
        %m=[117.4316 140.4499];
        %m=[117.4316 148.5599];yuan
        %m=[117.4316 156.6699];
        %n=[260.1301 12.1430;12.1430 150.4574];
        %n=[299.4574 12.1430;12.1430 160.1301];%yuan
        
       m=[117.4361 156.5599];
        %m=[116.0192 148.7319];
        n=[160.1301 12.1430;12.1430 299.4574];
        %n=[34.2329 -17.6796;-17.6796 76.4414];
        
        imgdst(p,q)=exp((-0.5)*(w-m)*n^(-1)*(w-m)');%算某象素点的概
    end
end 
imgdst=Otsuthresh(imgdst);
