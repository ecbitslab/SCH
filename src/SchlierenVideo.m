function SchlierenVideo(peaks,shifts,condense,map,p)
    if p == 0
        p = .1;
    end
    
    if condense == 0;
        condense = .1; 
    end
    
    mx = max(max(abs(shifts(:,3:size(shifts,2)))));
    for ee=3:size(shifts,2)
        hi = round(max(peaks)/(10*condense)); 
        for row = 1:1:size(peaks);
            frame(round(peaks(row,1)/(10*condense)),round(peaks(row,2)/ ...
                (10*condense))) = shifts(row, ee);
        end
    
        imagesc(frame);colormap(map)
        caxis([-.05, .05]);
        colorbar;
        
        pause(p);
    end
end