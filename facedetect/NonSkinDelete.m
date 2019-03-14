function [Img_dst]=NonSkinDelete(Img_src)
%ȥ������������
SE=strel('square',5);
%Img_dst=imopen(Img_dst,SE);
Img_src=imdilate(Img_src,SE);

[L,num]=bwlabel(Img_src,8);     %��ͨ������ 
B=zeros(size(Img_src));
for i=1:num
    Area(i)=bwarea(L==i);%����ÿ��Ƥ����������
end
for i=1:num
    [r,c] = find(L==i) ;
    left(i)=min(c);
    right(i)=max(c);
    up(i)=min(r);
    down(i)=max(r);
end
for i=1:num 
    %����������������
    Rect_Area(i)=(down(i)-up(i))*(right(i)-left(i));
end
%���������������
Ratio=Area./Rect_Area;
for i=1:num 
   if Ratio(i)>=0.5%����Ӧ���������ʴ���0.5����������
       [x,y]=find(L==i);%��i�����������ֵ
       B=B+bwselect(Img_src,y,x,8);%������ʴ���0.5Ƥ�������������   
   end      
end

%%%%%%%%%%%%%%%%%%%%%%%%%%�������������һ����ȥһЩ��С�ķ���������%%%%%%%%%%%%%%%%%%%%%%%%%%
[L1,num1]=bwlabel(B,8);     %��ͨ������
Img_dst=zeros(size(B));
for i=1:num1
    Area(i)=bwarea(L1==i);%����ÿ��Ƥ����������
end
maxarea=max(Area);%ȡ���ֵ
q=Area/maxarea;%ÿ�����������������������ı�ֵ   
for i=1:num1 
   if q(i)>=0.3%����Ӧ����������ֵ����0.3����������
       [x,y]=find(L1==i);%��i�����������ֵ
       Img_dst=Img_dst+bwselect(B,y,x,8);%�������ֵ����0.3Ƥ�������������   
   end      
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%���������ͨ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%L3=bwlabel(Img_dst);
%states=regionprops(L3);
%Ar=cat(1,states.Area);
%ind=find(Ar==max(Ar));
%Img_dst(find(L3~=ind))=0;
Img_dst=imfill(Img_dst,'holes');