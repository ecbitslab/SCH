function [npeaks, nxshifts, nyshifts] = NearFilter( peaks, xshifts, yshifts, width, height )
%NEARFILTER Roughly applies a median filter to the shifts of
% the centroids

% Find each peak's neighborhood
np = peaks;
np(:, 1) = ceil(np(:, 1) / width);
np(:, 2) = ceil(np(:, 2) / height);

%Initialize npeaks and nshifts
%all npeaks are unique

[npeaks, ia, ic] = unique(np, 'rows');
nxshifts = zeros(size(npeaks, 1), size(xshifts, 2));
nyshifts = zeros(size(npeaks, 1), size(yshifts, 2));

% Averages all the shifts in the neighborhood
num = 0;
tot = 0;

for ii = 1:max(ic)
    [inds] = find(ic == ii);
    numElems = size(inds, 1);
    
    num = num + 1;
    tot = tot + numElems;
    
    nxshifts(ii, :) = sum(xshifts(inds, :), 1) / numElems;
    nyshifts(ii, :) = sum(yshifts(inds, :), 1) / numElems;
end

tot / num

end

