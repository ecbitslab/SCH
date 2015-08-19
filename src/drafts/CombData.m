function [ComData] = CombData(data) 
NFrames = size(data,4);
ComData = zeros(size(data,1),size(data,2), size(data, 4));
for ii = 1:NFrames
    GrayData = double(rgb2gray(data(:,:,:,ii)));
    ComData(:, :, ii) = GrayData;
end