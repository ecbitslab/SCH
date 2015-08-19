function [] = showVideo(vid, p, map)
%SHOWVIDEO Summary of this function goes here
%   Detailed explanation goes here

if p == 0
    p = .1;
end

c = max(abs(vid(:)));

for ee=1:size(vid,3)
    imagesc(vid(:,:,ee));
    colormap(map);
    caxis([-c, c]);
    colorbar();
    pause(p);
end

end

