function output = FindEvents(metPdata, metQdata, winP, winQ)

numApp = length(metPdata);
output = cell(1,numApp);

for i = 1:numApp                 % no. appliances in H3
    if(~isempty(metPdata{i}))    % neglect empty cells
        disp(i);
        
        for j = 1:length(metPdata{i}) % no. windows for app. i
            
            threshP = winP{i}{j}{5};
            threshQ = winQ{i}{j}{6};

            MetricP = metPdata{i}{j};
            MetricQ = metQdata{i}{j};

            output{i}{j} = DetEvents(MetricP, MetricQ, threshP, threshQ);
        end
    end
end
end
