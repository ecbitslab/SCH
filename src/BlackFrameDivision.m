function [ outData ] = BlackFrameDivision( avgBlackFrameFilename, data )
%BLACKFRAMEDIVISION Summary of this function goes here
%   Detailed explanation goes here

avgBlackFrame = load(avgBlackFrameFilename);
avgBlackFrame = FastCombData(avgBlackFrame.avgFrame);

outData = data;

for ii = 1:size(data,3)
    outData(:,:,ii) = data(:,:,ii) ./ avgBlackFrame;
end
clear avgBlackFrame

end

