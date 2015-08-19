function [ mat_med ] = applyMedianFilter(mat, range)
%APPLYMEDIANFILTER Applies a Median filter to mat
%   mat: the matrix to put the median filter onto
%   range: the farthest a neighbor can be

nbm = neighborMap(mat, range);
mat_med = MedianFilter(mat, nbm);

delete(nbm);

end

