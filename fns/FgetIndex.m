function [ idx ] = FgetIndex(windowData, clusNumber, minMax, offset )
    if(minMax == 1)
        idx = max(find(windowData(:,3) == clusNumber));
        idx = windowData(idx,1);
        idx = idx+offset;
    else
        idx = min(find(windowData(:,3) == clusNumber));
        idx = windowData(idx,1);
        idx = idx+offset;
    end
end