% 
% This short script will calculate the locations of our centroids based 
% upon the locations of the peaks found using pkfnd.  
% 
% The code looks at a 3x3 pixel box centered around each peak and uses an
% intensity weighted average to calculate the centroid for each frame of
% data.
%  
function [x_shifts, y_shifts] = TrackCentroids(CombData,peaks)
n = size(peaks,1); % Number of peaks detected.

nFrames = size(CombData,3); % Number of frames. 
% Gopal, we can use variablename = mmreader('videoname.fileformat') 
% followed by nFrames = variablename.NumberOfFrames to find this.  
x_shifts = zeros(n,nFrames + 1);
y_shifts = zeros(n,nFrames + 1);
%final_centroids = zeros(n,nFrames); 
% This array will be filled with the initial centroid locations in 
% the first two columns (x then y) followed by the shifted centroid 
% locations in the other columns.  Where x locations and y locations 
% alternate as the column number increases.
% 
% NOTE: This array of zeros isn't necessary. MATLAB suggested creating it, 
% instead of altering an array's size with every iteration of the loop.    
% They claim this makes the code run faster.


for ee = 1:nFrames
% This first loop runs through each frame of our data    
    
    centroids = zeros(n,2); 
    % This array is filled with the centroids of the 'ee' frame. Where x
    % and y correspond to columns 1 and 2, respectively.  
    %
    % NOTE: This array is also unnecessary for same reason as before.
    % Gopal, We'll need a line of code here to make the variable 'im' correspond  
    % to the 'ee' frame of our data.  Right now it will just calculate the
    % centroid from the same image 'nFrames' (20) times.  Something like,
    % im = variablename(ee).
    
    for ii = 1:n
    % This loop runs through each peak found in the image    
        
        colnum = peaks(ii,1); 
        % This grabs the column, or x coordinate, corresponding to each peak.
        
        rownum = peaks(ii,2);
        % This grabs the row, or y coordinate, corresponding to each peak.
        
        I_tot = 0;
        x_sum = 0;
        y_sum = 0;
        % Initializing variables.
        
        i1 = rownum - 1 + (colnum - 2) * size(CombData, 1) + (ee - 1) * ...
            size(CombData, 2) * size(CombData, 1);
        i2 = rownum - 1 + (colnum - 1) * size(CombData, 1) + (ee - 1) * ...
            size(CombData, 2) * size(CombData, 1);
        i3 = rownum - 1 + (colnum) * size(CombData, 1) + (ee - 1) * ...
            size(CombData, 2)* size(CombData, 1);
        
        I_tot = I_tot + CombData(i1);
        I_tot = I_tot + CombData(i1 + 1);
        I_tot = I_tot + CombData(i1 + 2);
        I_tot = I_tot + CombData(i2);
        I_tot = I_tot + CombData(i2 + 1);
        I_tot = I_tot + CombData(i2 + 2);
        I_tot = I_tot + CombData(i3);
        I_tot = I_tot + CombData(i3 + 1);
        I_tot = I_tot + CombData(i3 + 2);
        
        x_sum = x_sum - CombData(i1);
        x_sum = x_sum + CombData(i3);
        x_sum = x_sum - CombData(i1 + 1);
        x_sum = x_sum + CombData(i3 + 1);
        x_sum = x_sum - CombData(i1 + 2);
        x_sum = x_sum + CombData(i3 + 2);
        
        y_sum = y_sum - CombData(i1);
        y_sum = y_sum - CombData(i1 + 2);
        y_sum = y_sum - CombData(i2);
        y_sum = y_sum + CombData(i2 + 2);
        y_sum = y_sum + CombData(i3);
        y_sum = y_sum + CombData(i3 + 2);
        
        centroids(ii,1) = x_sum/I_tot + colnum; % Centroid x coordinates
        centroids(ii,2) = y_sum/I_tot + rownum; % Centroid y coordinates
    
    end
    
    if ee == 1
        x_shifts = [centroids(:,1), centroids(:,2)];
        y_shifts = [centroids(:,1), centroids(:,2)];
    elseif ee > 1
        x_shifts(:,ee + 1) = x_shifts(:,1) - centroids(:,1);
        y_shifts(:,ee + 1) = y_shifts(:,2) - centroids(:,2);
    end
end
