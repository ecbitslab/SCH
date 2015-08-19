%% Denoises our data of shifts
% This code checks for any shift above a designated threshold.  For each 
% potentially spurious data point we construct a 2 or 3 data point box 
% around the potentially spurious shift.  We then take the mean and std of
% the data in the box and compare this to our point of interest.  If the
% poi has a value larger than a chosen parameter, then we convert it to the
% mean if not we leave it alone.
% 
% 

function [cmat] = MedianFilter(mat,range)
% mat is the array of shifts and centroid locations given by
% track_centroids
%
% range is related to the number of points taken for each mean
%
%
cmat = sortrows(mat);
nfrm = size(cmat,2); %number of frames in data set
pts = size(cmat,1);
for ii = 3:nfrm
    for jj = 1:pts % runs through each data point
        x = cmat(jj,1); % x and y coordinates of a point
        y = cmat(jj,2);
        xrow = cmat(:,1) < x+range & cmat(:,1) > x-range; 
        yrow = cmat(:,2) < y+range & cmat(:,2) > y-range;
%         if jj <= 500
%         xrow = cmat(jj:jj+500,1) < x+range & cmat(jj:jj+500,1) > x-range; 
%         yrow = cmat(jj:jj+500,2) < y+range & cmat(jj:jj+500,2) > y-range;
%         elseif jj > 500 && jj < pts - 500
%             xrow = cmat(jj-500:jj+500,1) < x+range & cmat(jj-500:jj+500,1) > x-range; 
%             yrow = cmat(jj-500:jj+500,2) < y+range & cmat(jj-500:jj+500,2) > y-range;
%         elseif jj >= pts - 500
%             xrow = cmat(jj-500:pts,1) < x+range & cmat(jj-500:pts,1) > x-range; 
%             yrow = cmat(jj-500:pts,2) < y+range & cmat(jj-500:pts,2) > y-range;
%         end
        inbounds = xrow & yrow; % logical index that has the box of points
%                                 surrounding the poi
        [locs ~] = find(inbounds);
        cmat(jj,ii) = mean(mat(locs,ii)); %changes value of point to mean
    end
end
end