LoadData();
main_H2_1();
idx_H2_1= {21	'Master Bath Fan'
21	'Master Bath Fan'
21	'Master Bath Fan'
21	'Master Bath Fan'
14	'Hair Dryer'
14	'Hair Dryer'
32	'Straightening Iron'
32	'Straightening Iron'
13	'Garbage Disposal'
13	'Garbage Disposal'
13	'Garbage Disposal'
13	'Garbage Disposal'
25	'Microwave'
25	'Microwave'
25	'Microwave'
25	'Microwave'
30	'Refrigerator'
30	'Refrigerator'
30	'Refrigerator'
28	'Phone Charger'
28	'Phone Charger'
28	'Phone Charger'
28	'Phone Charger'
36	'Vacuum'
36	'Vacuum'
36	'Vacuum'
36	'Vacuum'
8	'Dining Room Lights'
8	'Dining Room Lights'
8	'Dining Room Lights'
8	'Dining Room Lights'
18	'Laptop Charger'
18	'Laptop Charger'
18	'Laptop Charger'
18	'Laptop Charger'
7	'Crockpot'
7	'Crockpot'
7	'Crockpot'
5	'Coffee Maker'
5	'Coffee Maker'
5	'Coffee Maker'
5	'Coffee Maker'
33	'TV/DVR'
33	'TV/DVR'
33	'TV/DVR'
6	'Computer'
6	'Computer'
6	'Computer'
6	'Computer'
29	'Printer'
29	'Printer'
29	'Printer'
29	'Printer'
};
idx = cell2mat(idx_H2_1(:,1));


load window_P_H2_1
load window_Q_H2_1
window_P = window_P_H2_1;
window_Q = window_Q_H2_1;
% Euclidean Distance Based
for i = [1:length(window_P)]
    if(~isempty(window_P{i}))
        disp(i)
        N = length(window_P{i}{1});  % P and Q windows are the same length
        k = 1;
        clear MetricP MetricQ
        while(k+N-1 < length(featP_scanA_L1))
            if(window_P{i}{3} == 1)
                sample = featP_scanA_L1(k:k+N-1);
%                 DistP = sqrt(sum((sample - window_P{i}{1}).^2));
                DistP = (sum((sample - window_P{i}{1}).^2));
                DistP = log(DistP);
%                 DistP = (sum((sample - window_P{i}{1}).^2));
                sample = featQ_scanA_L1(k:k+N-1);
%                 DistQ = sqrt(sum((sample - window_Q{i}{1}).^2));
                DistQ = (sum((sample - window_Q{i}{1}).^2));
                DistQ = log(DistQ);
%                 DistQ = (sum((sample - window_Q{i}{1}).^2));
            else
                sample = featP_scanA_L2(k:k+N-1);
%                 DistP = sqrt(sum((sample - window_P{i}{1}).^2));
                DistP = (sum((sample - window_P{i}{1}).^2));
                DistP = log(DistP);
%                 DistP = (sum((sample - window_P{i}{1}).^2));
                sample = featQ_scanA_L2(k:k+N-1);
%                 DistQ = sqrt(sum((sample - window_Q{i}{1}).^2));                
                DistQ = (sum((sample - window_Q{i}{1}).^2));                
                DistQ = log(DistQ);
%                 DistQ = (sum((sample - window_Q{i}{1}).^2));                
            end
            MetricP(k) = DistP;
            MetricQ(k) = DistQ;
            k = k+1;
        end
        MetricP_all{i} = MetricP;
        MetricQ_all{i} = MetricQ;
        disp(length(MetricP))
        n = 1:length(MetricP);
        figure()
%         MetricP(find(MetricP>sqrt(sum(window_P{i}{1}.^2)))) = sqrt(sum(window_P{i}{1}.^2));
%         MetricP(find(MetricP>log(sqrt(sum(window_P{i}{1}.^2))))) = log(sqrt(sum(window_P{i}{1}.^2)));
        MetricP(find(MetricP>log((sum(window_P{i}{1}.^2))))) = log((sum(window_P{i}{1}.^2)));
        MetricP(find(MetricP == -inf)) = 0;
%         MetricQ(find(MetricQ>sqrt(sum(window_Q{i}{1}.^2)))) = sqrt(sum(window_Q{i}{1}.^2));
%         MetricQ(find(MetricQ>log(sqrt(sum(window_Q{i}{1}.^2))))) = log(sqrt(sum(window_Q{i}{1}.^2)));
        MetricQ(find(MetricQ>log((sum(window_Q{i}{1}.^2))))) = log((sum(window_Q{i}{1}.^2)));
        MetricQ(find(MetricQ == -inf)) = 0;
%         MetricP(find(MetricP>(sum(window_P{i}{1}.^2)))) = (sum(window_P{i}{1}.^2));
%         MetricQ(find(MetricQ>(sum(window_Q{i}{1}.^2)))) = (sum(window_Q{i}{1}.^2));

%         MetricP(find(MetricP>sqrt(sum(abs(window_P{i}{1}))))) = sqrt(sum(window_P{i}{1}.^2));
%         MetricQ(find(MetricQ>sqrt(sum(abs(window_Q{i}{1}))))) = sqrt(sum(window_Q{i}{1}.^2));
        ax(1) = subplot(411);plot(n,MetricP) ;
        title(sprintf('P Monitor: "%s"', char(idx_H2_1(i,2))))
        ax(2) = subplot(412);plot(n,MetricQ);
        title(sprintf('Q Monitor: "%s"', char(idx_H2_1(i,2))))
        subplot(413);plot(window_P{i}{1});
        title(sprintf('Appliance P Window: "%s"', char(idx_H2_1(i,2))))
        subplot(414);plot(window_Q{i}{1});
        title(sprintf('Appliance Q Window: "%s"', char(idx_H2_1(i,2))))
        linkaxes(ax, 'x');
        pause;
    end
end

% MetricP2 = MetricP;
% figure()
% plot(MetricP2)
% figure()
% MetricP(find(MetricP>(sum(window_P{i}{1}.^2)))) = (sum(window_P{i}{1}.^2));
% plot(MetricP)
