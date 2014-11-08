function [ idx ] = FgetIndex(clusters,clusNumber, minMax, offset )
    if(minMax == 1)
        idx = max(find(clusters(:,3) == clusNumber));
        idx = clusters(idx,1);
        idx = idx+offset;
    else
        idx = min(find(clusters(:,3) == clusNumber));
        idx = clusters(idx,1);
        idx = idx+offset;
    end
end