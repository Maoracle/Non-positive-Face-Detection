
function y = SingleGaussOtsu(imgsrc)

img_ycbcr=rgb2ycbcr(imgsrc);
[a,b,c]=size(img_ycbcr);
cb=double(img_ycbcr(:,:,2));
cr=double(img_ycbcr(:,:,3));
imgdst=zeros(a,b);
for p=1:a
    for q=1:b
        w=[cb(p,q),cr(p,q)];
        m=[117.4361 156.5599];
        n=[160.1301 12.1430;12.1430 299.4574];
%         m=[104.4977 156.9277];
%         n=[77.6869 -51.4659;-51.4659 81.9345];
        %n=[260.1301 12.1430;12.1430 150.4574];
        imgdst(p,q)=exp((-0.5)*(w-m)*n^(-1)*(w-m)');%ËãÄ³ÏóËØµãµÄ¸Å
%         if(imgdst(p,q)<0.5)
%             imgdst(p,q)=0;
%         else imgdst(p,q)=1;
%         end
    end
end
y = Otsuthresh(imgdst);


