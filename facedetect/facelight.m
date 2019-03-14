function [y]=facelight(src)
face = facepart(src);
% chin = findchin(face);
% chin2 = binary(chin);
% chin2noskin = NonSkinDelete(chin2);
y = avglight(face);