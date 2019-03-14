function [Img_dst]=NonSkinDelete(Img_src)
%去除非人脸区域
SE=strel('square',5);
%Img_dst=imopen(Img_dst,SE);
Img_src=imdilate(Img_src,SE);

[L,num]=bwlabel(Img_src,8);     %连通区域标记 
B=zeros(size(Img_src));
for i=1:num
    Area(i)=bwarea(L==i);%计算每个皮肤区域的面积
end
for i=1:num
    [r,c] = find(L==i) ;
    left(i)=min(c);
    right(i)=max(c);
    up(i)=min(r);
    down(i)=max(r);
end
for i=1:num 
    %计算各矩形区域面积
    Rect_Area(i)=(down(i)-up(i))*(right(i)-left(i));
end
%计算各区域的填充率
Ratio=Area./Rect_Area;
for i=1:num 
   if Ratio(i)>=0.5%若相应区域的填充率大于0.5则保留该区域
       [x,y]=find(L==i);%第i块区域的坐标值
       B=B+bwselect(Img_src,y,x,8);%把填充率大于0.5皮肤区域叠加起来   
   end      
end

%%%%%%%%%%%%%%%%%%%%%%%%%%根据面积比来进一步除去一些较小的非人脸区域%%%%%%%%%%%%%%%%%%%%%%%%%%
[L1,num1]=bwlabel(B,8);     %连通区域标记
Img_dst=zeros(size(B));
for i=1:num1
    Area(i)=bwarea(L1==i);%计算每个皮肤区域的面积
end
maxarea=max(Area);%取最大值
q=Area/maxarea;%每块区域的面积与最大区域面积的比值   
for i=1:num1 
   if q(i)>=0.3%若相应区域的面积比值大于0.3则保留该区域
       [x,y]=find(L1==i);%第i块区域的坐标值
       Img_dst=Img_dst+bwselect(B,y,x,8);%把面积比值大于0.3皮肤区域叠加起来   
   end      
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%保留最大联通区域%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%L3=bwlabel(Img_dst);
%states=regionprops(L3);
%Ar=cat(1,states.Area);
%ind=find(Ar==max(Ar));
%Img_dst(find(L3~=ind))=0;
Img_dst=imfill(Img_dst,'holes');