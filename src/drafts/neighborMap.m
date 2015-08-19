% This function creates a cell that contains an array of all the neighbors
% of each centroid. So map{2} contains an array with all the neighbors of
% the second centroid

% Note: mat must be organized in ascending x-values
function [map] = neighborMap(mat, range)
    tic
    
    %-------
    % This function finds the neighbors for a single centroid.
    % 
    % index - the index of the centroid in mat
    
    function [neighbors] = findNeighbors(index)
        row = mat(1,:); % The row in mat
        x = row(1); % The x position of the centroid
        y = row(2); % The y position of the centroid
        
        xLow = find(mat(:,1) > x - range, 1, 'first'); %Finds the first x in the bounds
        xHigh = find(mat(:,1) < x + range, 1, 'first'); %Finds the last x in the bounds
        
        yrow = mat(xLow:xHigh,2) > y - range & mat(xLow:xHigh,2) < y + range;
        
        neighbors = find(yrow) + (xLow - 1);
    end

   
    ind = num2cell(1:size(mat, 1)); % A cell, this is used for an index in cellfun
    
    map = cellfun(@findNeighbors, ind, 'UniformOutput', 0);
    toc
end