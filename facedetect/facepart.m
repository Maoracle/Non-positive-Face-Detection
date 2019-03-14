%use the skinpart to cut face region of the image  
function [imdst]=facepart(src,face)
%com = rgbcompensation(src);
%detect = skindetect(com);
%skin = NonSkinDelete(detect);
[a,b,c]=size(src);
imdst=src;
R = imdst(:,:,1);
G = imdst(:,:,2);
B = imdst(:,:,3);
for p=1:a
    for q=1:b
        if(face(p,q)==0)
            %imdst(p,q)=0;
            R(p,q)=0;
            G(p,q)=0;
            B(p,q)=0;
        end 
    end
end
imdst=cat(3,R,G,B);
