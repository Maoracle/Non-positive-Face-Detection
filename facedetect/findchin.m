function [imdst] = findchin(face)
[a,b,c]=size(face);
ybr = rgb2ycbcr(face);
Y = ybr(:,:,1);
R = face(:,:,1);
G = face(:,:,2);
B = face(:,:,3);
L = avglight(face);
for p = 1:a
    for q = 1:b
        if(Y(p,q)<=110)
            R(p,q) =0;
            G(p,q) =0;
            B(p,q) =0;
        end
    end
end
imdst=cat(3,R,G,B);
