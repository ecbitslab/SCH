function indices = IndexMatrix(peaks,height)
peakcount = size(peaks,2);
indices = zeros(peakcount,9);

for ii = 1:peakcount;
    
    %obtain indices for reference
    colnum = peaks(ii,1);
    rownum = peaks(ii,2);
    indices(ii,1) = rownum - 1 + (colnum - 2) * height;
    indices(ii,2) = rownum - 1 + (colnum - 1) * height;
    indices(ii,3) = rownum - 1 + (colnum) * height;
    indices(ii,4) = indices(ii,1) + 1;
    indices(ii,5) = indices(ii,2) + 1;
    indices(ii,6) = indices(ii,3) + 1;
    indices(ii,7) = indices(ii,1) + 2;
    indices(ii,8) = indices(ii,2) + 2;
    indices(ii,9) = indices(ii,3) + 2;
end
end