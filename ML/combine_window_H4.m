

load window_P_H4_1
load window_Q_H4_1
load window_P_H4_2
load window_Q_H4_2

load('H4idx.mat')

H4_1_ID = cell2mat(H4_1Labels(:,1));
H4_2_ID = cell2mat(H4_2Labels(:,1));


window_P_H4_all = {};
for i = [unique(sort([H4_1_ID;H4_2_ID]))']
    temp = {};
    idx_H1 = find(H4_1_ID == i);
    temp = [temp window_P_H4_1(idx_H1)];
   
    idx_H2 = find(H4_2_ID == i);
    temp = [temp window_P_H4_2(idx_H2)];

    window_P_H4_all{i} = temp;
end

window_Q_H4_all = {};
for i = [unique(sort([H4_1_ID;H4_2_ID]))']
    temp = {};
    idx_H1 = find(H4_1_ID == i);
    temp = [temp window_Q_H4_1(idx_H1)];

    idx_H2 = find(H4_2_ID == i);
    temp = [temp window_Q_H4_2(idx_H2)];
 
    window_Q_H4_all{i} = temp;
end


%% Histogram of all windows - H4
% clear all
% load window_P_H4_all.mat
% load window_Q_H4_all.mat
% window_P = window_P_H4_all;
% window_Q = window_Q_H4_all;
% % Euclidean Distance Based
% count = 1;
% for i = 1:length(window_P_H4_all)
%     if(~isempty(window_P{i}))
%         disp(i)
%         N = length(window_P_H4_all{i});
%         for k = [1:N]
%             if(~isempty(window_P{i}{k}))
%                 tempP = window_P{i}{k}{1};  % on window
%                 DistP = max(tempP);
%             
%                 tempQ = window_Q{i}{k}{1};   % on window
%                 DistQ = max(tempQ);
%                 
%                 MetricP(count) = DistP;
%                 MetricQ(count) = DistQ;
%                 count = count+1;
%             else   % If there are no windows, fill with 0's
%                 MetricP(count) = 0;
%                 MetricQ(count) = 0;
%                 count = count+1;
%             end
%         end
%     end
% end
% ax(1) = subplot(211);bar(MetricP);
% ax(2) = subplot(212);bar(MetricQ);
% linkaxes(ax, 'x');
% 
% 
% 
