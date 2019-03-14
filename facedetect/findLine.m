function [uppart,facepart,neckpart]= findLine(imgsrc,face,facebinary) %facebinary是边缘平滑后的肤色区域二值图
BW=edge(facebinary,'canny');
[Lin,num] = bwlabel(BW,8);
[x,y] = find(Lin == 1);
% a= 0;
% for i =1 : length(x)
%     p = x == x(i);
%     n= y(p);
%     %map = containers.Map(a,x(i));
%     %a = n(length(n))-n(1);
%     if(n(length(n))-n(1)>a)
%         a = n(length(n))-n(1);
%         b = x(i);
%     end
% end
h = max(y)-min(y);
line = (max(x)-min(x))*4/5+min(x)-10;

[a,b,c] = size(face);
R = face(:,:,1);
G = face(:,:,2);
B = face(:,:,3);
for p = 1:b
    for q = 1:a
        if(q<line)
            R(q,p) = 0;
            G(q,p) = 0;
            B(q,p) = 0;
        end
    end
end
neckpart=cat(3,R,G,B);
[a,b,c] = size(face);
R = face(:,:,1);
G = face(:,:,2);
B = face(:,:,3);
for p = 1:b
    for q = 1:a
        if(q>=line)
            R(q,p) = 0;
            G(q,p) = 0;
            B(q,p) = 0;
        end
    end
end
facepart = cat(3,R,G,B);
%bfacepart = binary(bfacepart);
R = imgsrc(:,:,1);
G = imgsrc(:,:,2);
B = imgsrc(:,:,3);
for p = 1:b
    for q = 1:a
        if(q>=line)
            R(q,p) = 0;
            G(q,p) = 0;
            B(q,p) = 0;
        end
    end
end
uppart=cat(3,R,G,B);
