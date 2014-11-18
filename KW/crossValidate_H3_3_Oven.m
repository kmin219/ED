LoadData();
main_H3_3_Dryer();
idx_H3_3= {33	'Oven'
    33	'Oven'
    33	'Oven'
    33	'Oven'
    33	'Oven'
    33	'Oven'
    33	'Oven'
    33	'Oven'
};
idx = cell2mat(idx_H3_3(:,1));


load window_P_H3_Oven
load window_Q_H3_Oven
window_P = window_P_H3_Oven;
window_Q = window_Q_H3_Oven;
% Euclidean Distance Based
for i = [1:length(window_P)]
    if(~isempty(window_P{i}))
        disp(i)
        N = length(window_P{i}{1});  % P and Q windows are the same length
        k = 1;
        while(k+N-1 < length(featP_scanA_L1))
            if(window_P{i}{3} == 1)  % If phase 1
                sample = featP_scanA_L1(k:k+N-1);
                DistP = (sum((sample - window_P{i}{1}).^2));
                DistP = log(DistP);
                sample = featQ_scanA_L1(k:k+N-1);
                DistQ = (sum((sample - window_Q{i}{1}).^2));
                DistQ = log(DistQ);
            else  % If phase 2
                sample = featP_scanA_L2(k:k+N-1);
                DistP = (sum((sample - window_P{i}{1}).^2));
                DistP = log(DistP);
                sample = featQ_scanA_L2(k:k+N-1);          
                DistQ = (sum((sample - window_Q{i}{1}).^2));                
                DistQ = log(DistQ);            
            end
            MetricP(k) = DistP;
            MetricQ(k) = DistQ;
            k = k+1;
        end
        MetricP_all{i} = MetricP;
        MetricQ_all{i} = MetricQ;

        n = 1:length(MetricP);
        figure()
        MetricP(find(MetricP>log((sum(window_P{i}{1}.^2))))) = log((sum(window_P{i}{1}.^2)));
        MetricP(find(MetricP == -inf)) = 0;

        MetricQ(find(MetricQ>log((sum(window_Q{i}{1}.^2))))) = log((sum(window_Q{i}{1}.^2)));
        MetricQ(find(MetricQ == -inf)) = 0;

        ax(1) = subplot(411);plot(n,MetricP) ;
        title(sprintf('P Monitor: "%s"', char(idx_H3_3(i,2))))
        ax(2) = subplot(412);plot(n,MetricQ);
        title(sprintf('Q Monitor: "%s"', char(idx_H3_3(i,2))))
        subplot(413);plot(window_P{i}{1});
        title(sprintf('Appliance P Window: "%s"', char(idx_H3_3(i,2))))
        subplot(414);plot(window_Q{i}{1});
        title(sprintf('Appliance Q Window: "%s"', char(idx_H3_3(i,2))))
        linkaxes(ax, 'x');
        pause;
    end
end


