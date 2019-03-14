function [hairpart] = hairPart(facepart)

[a,b,c] = size(facepart);
R = facepart(:,:,1);
G = facepart(:,:,2);
B = facepart(:,:,3);

for p = 1:b
    for q = 1:a
        if(R(q,p) < 90 && G(q,p) < 90 && B(q,p) < 90)
            R(q,p) = 255;
            G(q,p) = 255;
            B(q,p) = 255;
        else
            R(q,p) = 0;
            G(q,p) = 0;
            B(q,p) = 0;
        end
    end
end
hairpart = cat(3,R,G,B);
    