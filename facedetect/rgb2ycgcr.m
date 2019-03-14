function ycgcr = rgb2ycgcr(rgb)
% function ycgcr = rgb2ycgcr(rgb)
% convert rgb image to ycgcr image
% Inputs:
%   rgb    - rgb image
%
% Outputs:
%   ycgcr  - ycgcr image

% reshape image to 2d matrix
rgb = im2double(rgb);
[m, n, p] = size(rgb);
rgb_2d = reshape(rgb, m*n, p);
% convert parameters
origT = [65.481 128.553 24.966;...
     -81.085 112 -30.915; ...
     112 -93.768 -18.214];
origOffset = [16; 128; 128];
origOffset_2d = repmat(origOffset, 1, m*n);
% rgb to ycgcr
ycgcr = origOffset_2d + origT*rgb_2d';
ycgcr = ycgcr';
ycgcr = reshape(ycgcr, m, n, p);
ycgcr = uint8(ycgcr);
end

 
 