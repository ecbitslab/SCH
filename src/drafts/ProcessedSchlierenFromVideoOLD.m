function [ x_shifts, y_shifts, peaks ] = ProcessedSchlierenFromVideo(filename, avgBlackFrameFilename, thresh, sz, nheight, nwidth)
%PROCESSEDSCHLIERENFROMVIDEO Summary of this function goes here
%   Detailed explanation goes here

vid = VideoReader(filename);
data = read(vid);
data = FastCombData(data);

avgBlackFrame = load(avgBlackFrameFilename);
avgBlackFrame = avgBlackFrame.avgFrame;

for ii = 1:size(data,3)
    data(:,:,ii) = data(:,:,ii) ./ avgBlackFrame;
end
clear avgBlackFrame

pks = ActivePkfnd(data(:,:,1), thresh, sz);
[xs, ys] = TrackCentroids(data, pks);

[x_shifts, y_shifts, peaks] = NearFilter(pks, xs, ys, nwidth, nheight);

end

