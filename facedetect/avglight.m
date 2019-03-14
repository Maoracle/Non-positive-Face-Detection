function [avg]=avglight(src)
%[a,b,c]=size(src);
ycbcr=rgb2ycbcr(src);
Y = ycbcr(:,:,1);
%sum = 0;
%pixels = 0;
% i=0;
% for p=1:a
%     for q = 1:b
%         if (Y(p,q) > 16)
%             %pixels = pixels + 1;
%             %sum = sum(sum,Y(p,q));
%             a[i] = Y(p,q);
%             i = i+1;
%         end
%     end
% end
% avg = mean(a);
% %avg = double(sum)/double(pixels);
Y=Y(:);
p= Y>16;
Y=Y(p);
avg=mean(Y);