function [ frame ] = toSchlierenImage(peaks,shifts,frameNum)
%Example of use:
% xs, ys, pk are shifts from peakfnd
% [nxs, nys, npk] = NearFilter(pk, xs, ys, 20, 20);
% frame = toSchlierenImage(npk, nxs, 100);
% sframe = imresize(frame, 20, 'nearest');
% imagesc(frame); colormap('hot');

% locate coordinates of 'highest' peak pixel 
hi = round(max(peaks));
% initialize frame. frame is matrix in which the shifts will be placed
frame = zeros(hi(1),hi(2)); 
% run through each centroid and place its shift value in frame
for row = 1:size(peaks)
    x = round(peaks(row,1));
    y = round(peaks(row,2));
    frame(x,y) = shifts(row, frameNum + 2);
end

end

