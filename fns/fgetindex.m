function [ idx ] = fgetindex(Clusters,  clusNumber, minmax, offset )
if(minmax==1)
    idx = max(find(Clusters(:,3) == clusNumber));
    idx = Clusters(idx,1);
    idx = idx+offset;
else
    idx = min(find(Clusters(:,3) == clusNumber));
    idx = Clusters(idx,1);
    idx = idx+offset;
end
end

% end_idx = fgetindex(Windows_All_L1,2,1,0);
% max(find(Windows_All_L1(:,3) == 2))