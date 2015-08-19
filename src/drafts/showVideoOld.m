function [] = showVideo(vid, p, map)
%SHOWVIDEO Summary of this function goes here
%   Detailed explanation goes here

if p == 0
    p = .1;
end

for ee=1:size(vid,3)
    imagesc(vid(:,:,ee));
    colormap(map);
    caxis([-.05, .05]);
    colorbar();
    pause(p);
end

end

