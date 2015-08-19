function [ x_shifts, y_shifts ] = track_peaks(vid, th, sz, active)
% TRACK_PEEKS Returns a matrix with the postion of the centroids and their
% shifts.
% INPUTS
% im - the image you are processing

vid = CombData(vid);

if active
    peaks = active_pkfnd(vid(:,:,0) , th, sz);
else
    peaks = pkfind(vid(:,:,0) , th, sz);
end

[x_shifts, y_shifts] = track_centroids(c_data, peaks);

end

