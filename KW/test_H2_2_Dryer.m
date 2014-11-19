clc;
clear all;
% close all;

if(0)
% Power Difference from each Home
[featP_scanA_L1_H2_1, featQ_scanA_L1_H2_1, featP_scanA_L2_H2_1, featQ_scanA_L2_H2_1]= test_main_H2(1);
[featP_scanA_L1_H2_2, featQ_scanA_L1_H2_2, featP_scanA_L2_H2_2, featQ_scanA_L2_H2_2]= test_main_H2(2);
[featP_scanA_L1_H2_3, featQ_scanA_L1_H2_3, featP_scanA_L2_H2_3, featQ_scanA_L2_H2_3]= test_main_H2(3);
[featP_scanA_L1_H2_4, featQ_scanA_L1_H2_4, featP_scanA_L2_H2_4, featQ_scanA_L2_H2_4]= test_main_H2(4);

save('scanA_H2_1.mat', 'featP_scanA_L1_H2_1', 'featQ_scanA_L1_H2_1', 'featP_scanA_L2_H2_1', 'featQ_scanA_L2_H2_1')
save('scanA_H2_2.mat', 'featP_scanA_L1_H2_2', 'featQ_scanA_L1_H2_2', 'featP_scanA_L2_H2_2', 'featQ_scanA_L2_H2_2')
save('scanA_H2_3.mat', 'featP_scanA_L1_H2_3', 'featQ_scanA_L1_H2_3', 'featP_scanA_L2_H2_3', 'featQ_scanA_L2_H2_3')
save('scanA_H2_4.mat', 'featP_scanA_L1_H2_4', 'featQ_scanA_L1_H2_4', 'featP_scanA_L2_H2_4', 'featQ_scanA_L2_H2_4')
end
%%
startup()
path = pwd;
addpath(genpath(path));

% load scanA_H2_1.mat
% load scanA_H2_2.mat
load scanA_H2_3.mat
% load scanA_H2_4.mat
%%
% Phase 1
featP_scanA_L1 = featP_scanA_L1_H2_3;
featQ_scanA_L1 = featQ_scanA_L1_H2_3;

% Phase 2
featP_scanA_L2 = featP_scanA_L2_H2_3;
featQ_scanA_L2 = featQ_scanA_L2_H2_3;


%%
load window_P_H2_Dryer
load window_Q_H2_Dryer
tic
window_P = window_P_H2_Dryer;
window_Q = window_Q_H2_Dryer;
% % Euclidean Distance Based

    for j = [1]
    window_app_P = window_P{j};  % appliance 1 event 1
    window_app_Q = window_Q{j};
    if(1)  %% If 'good' appliance
        Non = length(window_app_P{1});  % window length - turn on  (P and Q have same length)
        Noff = length(window_app_P{2});  % window length - turn off        
        N = max([Non Noff]);
        k = 1;
        clear MetricP_on MetricQ_on MetricP_off MetricQ_off   
        while(k+N-1 < length(featP_scanA_L1))
            if(window_app_P{3} == 1)   % If on Phase 1
                sample = featP_scanA_L1(k:k+Non-1);
                DistP = (sum((sample - window_app_P{1}).^2));
                DistP_on = log(DistP);
                
                sample = featQ_scanA_L1(k:k+Non-1);
                DistQ = (sum((sample - window_app_Q{1}).^2));
                DistQ_on = log(DistQ);
                
                sample = featP_scanA_L1(k:k+Noff-1);
                DistP = (sum((sample - window_app_P{2}).^2));
                DistP_off = log(DistP);
                
                sample = featQ_scanA_L1(k:k+Noff-1);
                DistQ = (sum((sample - window_app_Q{2}).^2));
                DistQ_off = log(DistQ);
            else  % if on phase 2
                sample = featP_scanA_L2(k:k+Non-1);
                DistP = (sum((sample - window_app_P{1}).^2));
                DistP_on = log(DistP);
                
                sample = featQ_scanA_L2(k:k+Non-1);
                DistQ = (sum((sample - window_app_Q{1}).^2));                
                DistQ_on = log(DistQ);
                
                sample = featP_scanA_L2(k:k+Noff-1);
                DistP = (sum((sample - window_app_P{2}).^2));
                DistP_off = log(DistP);
                
                sample = featQ_scanA_L2(k:k+Noff-1);
                DistQ = (sum((sample - window_app_Q{2}).^2));                
                DistQ_off = log(DistQ);
            end
            MetricP_on(k) = DistP_on;
            MetricQ_on(k) = DistQ_on;
            
            MetricP_off(k) = DistP_off;
            MetricQ_off(k) = DistQ_off;
            k = k+1;
        end
        MetricP_all_on{j} = MetricP_on;
        MetricQ_all_on{j} = MetricQ_on;
        
        MetricP_all_off{j} = MetricP_off;
        MetricQ_all_off{j} = MetricQ_off;

        if(1)
        n = 1:length(MetricP_on);
        figure()            
        ax(1) = subplot(411);plot(n,MetricP_on);
%         title(sprintf('P Monitor: "%s"', char(idx_H2_1(i,2))))
        ax(2) = subplot(412);plot(n,MetricQ_on);
%         title(sprintf('Q Monitor: "%s"', char(idx_H2_1(i,2))))
        subplot(413);plot(window_app_P{1});
%         title(sprintf('Appliance P Window: "%s"', char(idx_H2_1(i,2))))
        subplot(414);plot(window_app_Q{1});
%         title(sprintf('Appliance Q Window: "%s"', char(idx_H2_1(i,2))))
        linkaxes(ax, 'x');
%         pause;

        figure()            
        ax(1) = subplot(411);plot(n,MetricP_off);
%         title(sprintf('P Monitor: "%s"', char(idx_H2_1(i,2))))
        ax(2) = subplot(412);plot(n,MetricQ_off);
%         title(sprintf('Q Monitor: "%s"', char(idx_H2_1(i,2))))
        subplot(413);plot(window_app_P{2});
%         title(sprintf('Appliance P Window: "%s"', char(idx_H2_1(i,2))))
        subplot(414);plot(window_app_Q{2});
%         title(sprintf('Appliance Q Window: "%s"', char(idx_H2_1(i,2))))
        linkaxes(ax, 'x');
%         pause;
        end
    end
    end

toc

MetricP_all_on_H3_3 = MetricP_all_on;
MetricQ_all_on_H3_3 = MetricQ_all_on;
MetricP_all_off_H3_3 = MetricP_all_off;
MetricQ_all_off_H3_3 = MetricQ_all_off;

        
% save('MetricP_all_on_H3_3.mat', 'MetricP_all_on_H3_3')
% save('MetricQ_all_on_H3_3.mat', 'MetricQ_all_on_H3_3')
% save('MetricP_all_off_H3_3.mat', 'MetricP_all_off_H3_3')
% save('MetricQ_all_off_H3_3.mat', 'MetricQ_all_off_H3_3')
