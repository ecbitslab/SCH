function [  ] = aviToBMP( inFilename , outFilename)
%AVITOBMP Summary of this function goes here
%   Detailed explanation goes here

obj = VideoReader(inFilename);

vid = read(obj);
nFrame = size(vid,4); 

for k = 1 : nFrame
    newname = strcat(outFilename, num2str(k),'.bmp');
    imwrite(vid(:,:,:,k), newname);  
end  

end

