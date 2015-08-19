function [ComData] = FastCombData(data) 
ComData = .299 * data(:,:,1,:) + .587 * data(:,:,2,:) + .114 * ...
    data(:,:,3,:);
ComData = double(squeeze(ComData));
end