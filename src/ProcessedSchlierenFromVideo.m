function [postVidX, postVidY] = ProcessedSchlierenFromVideo(filename, thresh, sz, nheight, nwidth)
    %PROCESSEDSCHLIERENFROMVIDEO Summary of this function goes here
    %   Detailed explanation goes here
    % Read data from video
    vid = VideoReader(filename);
    data = read(vid);
    
    % Do all proccessing on Raw Video
    data = PreProcess(data);
    
    % Find Peaks and Shifts
    pks = ActivePkfnd(data(:,:,1), thresh, sz);
    [xs, ys] = TrackCentroids(data, pks);
    clear data;
    
    % Do all proccessing on peaks and shifts
    [peaks, x_shifts, y_shifts] = Proccess(pks, xs, ys, nwidth, nheight);
    clear pks xs ys;
    
    % Create Both Videos
    outVidX = toSchlierenVideo(peaks, x_shifts);
    outVidY = toSchlierenVideo(peaks, y_shifts);
    clear peaks x_shifts y_shifts;
    
    % Do all post processing to video
    [postVidX, postVidY] = PostProcess(outVidX, outVidY);

    end

function [outData] = PreProcess(data)
    % Used to modify the raw video
    outData = FastCombData(data);
end

function [outPeaks, outXs, outYs] = Proccess(peaks, xs, ys, boxWidth, boxHeight)
    % To be used for any modifications to the shift data
    if(boxWidth == 1 && boxHeight == 1)
        outXs = xs;
        outYs = ys;
        outPeaks = peaks;
        return
    end
    [outPeaks, outXs, outYs] = NearFilter(peaks,xs,ys,boxWidth,boxHeight);
end

function [outVidX, outVidY] = PostProcess(vidX,vidY)
    % To be used to change the video created from the shift data.
    % Do Nothing
    outVidX = vidX;
    outVidY = vidY;
end