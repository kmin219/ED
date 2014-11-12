function output = DetEvents(distP, distQ, threshP, threshQ)
%     function will scan distance domain of P and Q and output a vector of
%     1's and 0's.  
% 
%     1's correspond to times when both distP and distQ
%     both drop below the threshold, indicating appliance On or Off.  
%     0's  correspond to no event detected.

winWdth = 1;            %   window width
sldIncr = 1;            %   sliding increment
scale = 1.1;            %   add margin to output

%  When winWdth is > 1, uncomment line below to replace k
    % k = (size(distP,2) - winWdth)/sldIncr;  % Number of windows
    
k = size(distP,2)/sldIncr;              %   Number of windows
output = zeros(1, k);                   %   preallocate output    

for i = 1:k
    winP = distP(i:i + winWdth - 1);
    winQ = distQ(i:i + winWdth - 1);
    
    if (min(winP) < threshP*scale && min(winQ) < threshQ*scale)
        output(i) = 1;
    else
        output(i) = 0;
    end
    
end

output = padarray(output, [0 winWdth-1],'both');   %    pad output (does nothing if winWdth = 1)

end
