function centroids = CentroidLocator(frame,peaks,indices)  
peakcount = size(peaks,1);
centroids = zeros(peakcount,2);
for ii = 1:peakcount
    colnum = peaks(ii,1);
    rownum = peaks(ii,2);

    % 3x3 total intensity 
    I_tot = frame(sum(indices(ii,:)));
    
    % x weighted intensity
    x_sum = sum(indices(ii,[3,6,9]));
    x_sum = x_sum - sum(indices(ii,[1,4,7]));
    
    % y weighted intensity
    y_sum = sum(indices(ii,[1,2,3]));
    y_sum = y_sum - sum(indices(ii,[7,8,9]));
    
    % centroid locations
    centroids(ii,1) = x_sum/I_tot + colnum; % centroid x coordinate
    centroids(ii,2) = y_sum/I_tot + rownum; % centroid y coordinate
end
end