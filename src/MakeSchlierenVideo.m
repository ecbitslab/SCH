function MakeSchlierenVideo(title,frmrate,peaks,shifts,condense,map,p)
    if p == 0
        p = .1;
    end
    
    if condense == 0;
        condense = .1; 
    end
    
    mx = max(max(abs(shifts(:,3:size(shifts,2)))));
    VidObj = VideoWriter(title);
    set(VidObj,'FrameRate',frmrate);
    open(VidObj);
    for ee=3:size(shifts,2)
        hi = round(max(peaks)/(10*condense));
        frame = zeros(hi(1),hi(2)); 
        for row = 1:1:size(peaks);
            frame(round(peaks(row,1)/(10*condense)),round(peaks(row,2)/ ...
                (10*condense))) = shifts(row, ee);
        end
        
        imagesc(frame);colormap(map)
        caxis([-mx-.01, mx+.01]);
        colorbar;
        im = getframe;
        writeVideo(VidObj,im);
        pause(p);
    end
    close(VidObj);
end