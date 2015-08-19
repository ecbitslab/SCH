function SchlierenImageOLD(centroids,shifts,condense,map)

    if condense == 0;
        condense = .1; 
    end
    hi = round(max(centroids)/(10*condense));
    frame = zeros(hi(1),hi(2)); 
    for row = 1:1:size(centroids);
        frame(round(centroids(row,1)/(10*condense)),round(centroids(row,2)/ ...
            (10*condense))) = shifts(row);
    end
    
    imagesc(frame);colormap(map)
    colorbar;
end