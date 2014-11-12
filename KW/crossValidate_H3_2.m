LoadData();
main_H3_2();
idx_H3_2= {13	'Foyer Lights'
13	'Foyer Lights'
13	'Foyer Lights'
13	'Foyer Lights'
15	'Garage Door Opener'
15	'Garage Door Opener'
15	'Garage Door Opener'
15	'Garage Door Opener'
16	'Garage Lights'
16	'Garage Lights'
16	'Garage Lights'
16	'Garage Lights'
17	'Garbage Disposal'
17	'Garbage Disposal'
18	'Guest Bath Fan'
18	'Guest Bath Fan'
18	'Guest Bath Fan'
18	'Guest Bath Fan'
19	'Guest Bath Lights'
19	'Guest Bath Lights'
19	'Guest Bath Lights'
19	'Guest Bath Lights'
20	'Hair Dryer'
20	'Hair Dryer'
21	'Kitchen Lights'
21	'Kitchen Lights'
21	'Kitchen Lights'
21	'Kitchen Lights'
22	'Laundry Room Lights'
22	'Laundry Room Lights'
22	'Laundry Room Lights'
22	'Laundry Room Lights'
23	'Living Room Audio-DVR-TV'
23	'Living Room Audio-DVR-TV'
23	'Living Room Audio-DVR-TV'
23	'Living Room Audio-DVR-TV'
24	'Living Room Lights'
24	'Living Room Lights'
24	'Living Room Lights'
};
idx = cell2mat(idx_H3_2(:,1));


load window_P_H3_2
load window_Q_H3_2
window_P = window_P_H3_2;
window_Q = window_Q_H3_2;
% Euclidean Distance Based
for i = [1:length(window_P)]
    if(~isempty(window_P{i}))
        disp(i)
        N = length(window_P{i}{1});  % P and Q windows are the same length
        k = 1;
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
        title(sprintf('P Monitor: "%s"', char(idx_H3_2(i,2))))
        ax(2) = subplot(412);plot(n,MetricQ);
        title(sprintf('Q Monitor: "%s"', char(idx_H3_2(i,2))))
        subplot(413);plot(window_P{i}{1});
        title(sprintf('Appliance P Window: "%s"', char(idx_H3_2(i,2))))
        subplot(414);plot(window_Q{i}{1});
        title(sprintf('Appliance Q Window: "%s"', char(idx_H3_2(i,2))))
        linkaxes(ax, 'x');
        pause;
    end
end

% for i = 1:length(window_Q)
%     plot(window_Q{i}{1})
%     pause
% end

% MetricP2 = MetricP;
% figure()
% plot(MetricP2)
% figure()
% MetricP(find(MetricP>(sum(window_P{i}{1}.^2)))) = (sum(window_P{i}{1}.^2));
% plot(MetricP)
