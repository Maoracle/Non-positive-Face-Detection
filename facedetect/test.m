function [Dst]=test(imgsrc)

src = rgbcompensation(imgsrc);
Dst = skindetect(src);
Dst = NonSkinDelete(Dst);
%imshow(Dst);

