function[noface] = deleteNofacePixel(face)
[a,b,c] = size(face);
for p =1:a
    for q =1:b
        if(p<b*0.20)
            face(p,q)=0;
        end
        if(p>b*0.80)
            face(p,q)=0;
        end
        if(q<a*0.20)
            face(p,q)=0;
        end
        if(q>a*0.80)
            face(p,q)=0;
        end
    end
end
noface = face;