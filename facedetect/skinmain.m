function [imdst]=skinmain(srcimg)
%com = rgbcompensation(srcimg);
skin = skindetect(srcimg);
face = NonSkinDelete(skin);
fpart = facepart(srcimg,face);
[uppart,faceregion,neckregion]=findLine(srcimg,fpart,face);
%[uppart,buppart,neckpart]=findLine(srcimg,fpart,face);
%chinpart=findchin(neckregion);
%bchinregion = binary(chinpart);
%bfaceregion = binary(faceregion);
%bwhole = bchinregion+bfaceregion;
%brealface = deleteneck(bwhole);
%imdst=NonSkinDelete(brealface);
imdst =binary(faceregion);
imdst = NonSkinDelete(imdst);