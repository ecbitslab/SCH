function [x_shifts, y_shifts, peaks] = SchlierenFromVideo(filename,thresh,sz)
    vid = VideoReader(filename);
    data = read(vid);
    
    frameSkip = 5;
    data = FastCombData(data(:,:,:,frameSkip:size(data,4)));
    peaks = ActivePkfnd(data(:,:,frameSkip), thresh, sz);
    [x_shifts, y_shifts] = TrackCentroids(data, peaks);
end
