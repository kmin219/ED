clc;clear all;clc;

load H1idx.mat

%%
load window_P_H1_1
load window_Q_H1_1

load window_P_H1_2
load window_Q_H1_2

load window_P_H1_3
load window_Q_H1_3

load window_P_H1_4
load window_Q_H1_4

load window_P_H1_5
load window_Q_H1_5

load window_P_H1_6
load window_Q_H1_6

H1_1_ID = cell2mat(H1_1Labels(:,1));
H1_2_ID = cell2mat(H1_2Labels(:,1));
H1_3_ID = cell2mat(H1_3Labels(:,1));
H1_4_ID = cell2mat(H1_4Labels(:,1));
H1_5_ID = cell2mat(H1_5Labels(:,1));
H1_6_ID = cell2mat(H1_6Labels(:,1));


%%

window_P_H1_all = {};
for i = [unique(sort([H1_1_ID;H1_2_ID;H1_3_ID;H1_4_ID;H1_5_ID;H1_6_ID]))']
    temp = {};
    idx_H1 = find(H1_1_ID == i);
    temp = [temp window_P_H1_1(idx_H1)];
    
    idx_H2 = find(H1_2_ID == i);
    temp = [temp window_P_H1_2(idx_H2)];
    
    idx_H3 = find(H1_3_ID == i);
    temp = [temp window_P_H1_3(idx_H3)];
    
    idx_H4 = find(H1_4_ID == i);
    temp = [temp window_P_H1_4(idx_H4)];
    
    idx_H5 = find(H1_5_ID == i);
    temp = [temp window_P_H1_5(idx_H5)];
    
    idx_H6 = find(H1_6_ID == i);
    temp = [temp window_P_H1_6(idx_H6)];
    
    window_P_H1_all{i} = temp;
end

window_Q_H1_all = {};
for i = [unique(sort([H1_1_ID;H1_2_ID;H1_3_ID;H1_4_ID;H1_5_ID;H1_6_ID]))']
    temp = {};
    idx_H1 = find(H1_1_ID == i);
    temp = [temp window_Q_H1_1(idx_H1)];
    
    idx_H2 = find(H1_2_ID == i);
    temp = [temp window_Q_H1_2(idx_H2)];
    
    idx_H3 = find(H1_3_ID == i);
    temp = [temp window_Q_H1_3(idx_H3)];
    
    idx_H4 = find(H1_4_ID == i);
    temp = [temp window_Q_H1_4(idx_H4)];
    
    idx_H5 = find(H1_5_ID == i);
    temp = [temp window_Q_H1_5(idx_H5)];
    
    idx_H6 = find(H1_6_ID == i);
    temp = [temp window_Q_H1_6(idx_H6)]; 
    
    window_Q_H1_all{i} = temp;
    i
end

save('winH1All.mat', 'window_P_H1_all', 'window_Q_H1_all')

%% Histogram of all windows - H1
%run only after running top code - visualization only
% clear all
load window_P_H1_all.mat
load window_Q_H1_all.mat
window_P = window_P_H1_all;
window_Q = window_Q_H1_all;
% Euclidean Distance Based - Plot the maximum power consumption (approx.)

count = 1;
for i = 1:length(window_P)
    for j = [1:length(window_P{i})]
        window_app_P = window_P{i}{j};  % appliance 1 event 1
        window_app_Q = window_Q{i}{j};        
        if(window_app_P{4})  %% If 'good' appliance
                tempP = window_P{i}{j}{2};  % off window
                DistP = abs(min(tempP));
            
                tempQ = window_Q{i}{j}{2};   % off window
                DistQ = abs(min(tempQ));
                
                MetricP(count) = DistP;
                MetricQ(count) = DistQ;
                count = count+1;
                
            else   % If there are no windows, fill with 0's
                MetricP(count) = 0;
                MetricQ(count) = 0;
                count = count+1;
        end
    end
end
% Plot off - window histograms
ax(1) = subplot(211);bar(MetricP);
Labels = {sort([H1_1_ID;H1_2_ID;H1_3_ID;H1_4_ID]')};
set(gca, 'XTick', 1:121, 'XTickLabel', Labels);

ax(2) = subplot(212);bar(MetricQ);
linkaxes(ax, 'x');
set(gca, 'XTick', 1:121, 'XTickLabel', Labels);

%% Plot window shapes
Labels = unique(sort([H1_1_ID;H1_2_ID;H1_3_ID;H1_4_ID]))';
figure()
for i = 1:length(window_P)
    if(~isempty(window_P{i}{1}))
        i
        ax(1) = subplot(211);plot(window_P{i}{1}{1});
        title(sprintf('Appliance P Window: "%d"', Labels(i)))
        ax(2) = subplot(212);plot(window_Q{i}{1}{1});
        title(sprintf('Appliance Q Window: "%d"', Labels(i)))
        %     title(sprintf('Appliance Q Window: "%d"', Labels{1}(i)))    
        linkaxes(ax, 'x');
        pause
    end
end
%%
Labels = unique(sort([H1_1_ID;H1_2_ID;H1_3_ID;H1_4_ID]))';
figure()
for i = 1:length(window_P)
    if(~isempty(window_P{i}{1}))
        i
        ax(1) = subplot(211);plot(window_P{i}{1}{2});
        title(sprintf('Appliance P Window: "%d"', Labels(i)))
        ax(2) = subplot(212);plot(window_Q{i}{1}{2});
        title(sprintf('Appliance Q Window: "%d"', Labels(i)))
        %     title(sprintf('Appliance Q Window: "%d"', Labels{1}(i)))    
        linkaxes(ax, 'x');
        pause
    end
end
