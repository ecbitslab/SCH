function [ outVid ] = toSchlierenVideo(peaks, shifts)
%TOSCHLIERENVIDEO Summary of this function goes here
%   Detailed explanation goes here

% locate coordinates of 'highest' peak pixel 
hi = round(max(peaks));
numFrames = size(shifts,2) - 2;

% Initialize Video
outVid = zeros(hi(1),hi(2),numFrames);

for frameNum=1:numFrames
    % run through each centroid and place its shift value in outVid
    for row = 1:size(peaks)
        x = round(peaks(row,1));
        y = round(peaks(row,2));
        outVid(x,y,frameNum) = shifts(row, frameNum + 2);
    end
end
end

