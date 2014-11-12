clc;clear all;
idx_H2_1 = {21	'Master Bath Fan'
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

idx_H2_2 = {16	'Kitchen Lights'
16	'Kitchen Lights'
16	'Kitchen Lights'
16	'Kitchen Lights'
17	'Kitchen Table Lights'
17	'Kitchen Table Lights'
17	'Kitchen Table Lights'
17	'Kitchen Table Lights'
31	'Stairway Lights'
31	'Stairway Lights'
31	'Stairway Lights'
31	'Stairway Lights'
15	'Hallway Lights'
15	'Hallway Lights'
15	'Hallway Lights'
15	'Hallway Lights'
12	'Front Room Lights'
12	'Front Room Lights'
12	'Front Room Lights'
12	'Front Room Lights'
19	'Laundry Room Lights'
19	'Laundry Room Lights'
20	'Living Room Lights'
20	'Living Room Lights'
26	'Office Lights'
26	'Office Lights'
3	'Bedroom 1 Lights'
3	'Bedroom 1 Lights'
3	'Bedroom 1 Lights'
1	'Bathroom 1 Lights'
1	'Bathroom 1 Lights'
4	'Bedroom 2 Lights'
4	'Bedroom 2 Lights'
2	'Bathroom 2 Lights'
2	'Bathroom 2 Lights'
34	'Tea Kettle'
34	'Tea Kettle'
34	'Tea Kettle'
34	'Tea Kettle'
23	'Master Bedroom Lights'
23	'Master Bedroom Lights'
22	'Master Bath Lights'
22	'Master Bath Lights'
24	'Master Closet Lights'
24	'Master Closet Lights'
35	'Toaster'
35	'Toaster'
35	'Toaster'
35	'Toaster'
37	'Washer'
10	'Dryer'
37	'Washer'
10	'Dryer'
};

idx_H2_3 = {27	'Outdoor Lights'
27	'Outdoor Lights'
11	'Front Hall Lights'
11	'Front Hall Lights'
11	'Front Hall Lights'
37	'Washer'
10	'Dryer'
37	'Washer'
10	'Dryer'
};

idx_H2_4 = {9	'Dishwasher'
9	'Dishwasher'
9	'Dishwasher'
9	'Dishwasher'
9	'Dishwasher'
9	'Dishwasher'
};
%%
load window_P_H2_1
load window_Q_H2_1
load window_P_H2_2
load window_Q_H2_2
load window_P_H2_3
load window_Q_H2_3
load window_P_H2_4
load window_Q_H2_4


H2_1_ID = cell2mat(idx_H2_1(:,1));
H2_2_ID = cell2mat(idx_H2_2(:,1));
H2_3_ID = cell2mat(idx_H2_3(:,1));
H2_4_ID = cell2mat(idx_H2_4(:,1));

window_P_H2_all = {};
for i = [unique(sort([H2_1_ID;H2_2_ID;H2_3_ID;H2_4_ID]))']
    temp = {};
    idx_H1 = find(H2_1_ID == i);
    temp = [temp window_P_H2_1(idx_H1)];
    
    idx_H2 = find(H2_2_ID == i);
    temp = [temp window_P_H2_2(idx_H2)];
    
    idx_H3 = find(H2_3_ID == i);
    temp = [temp window_P_H2_3(idx_H3)];
    
    idx_H4 = find(H2_4_ID == i);
    temp = [temp window_P_H2_4(idx_H4)];    
    
    window_P_H2_all{i} = temp;
end

window_Q_H2_all = {};
for i = [unique(sort([H2_1_ID;H2_2_ID;H2_3_ID;H2_4_ID]))']
    temp = {};
    idx_H1 = find(H2_1_ID == i);
    temp = [temp window_Q_H2_1(idx_H1)];
    
    idx_H2 = find(H2_2_ID == i);
    temp = [temp window_Q_H2_2(idx_H2)];
    
    idx_H3 = find(H2_3_ID == i);
    temp = [temp window_Q_H2_3(idx_H3)];
    
    idx_H4 = find(H2_4_ID == i);
    temp = [temp window_Q_H2_4(idx_H4)];    
    
    window_Q_H2_all{i} = temp;
    i
end


%% Histogram of all windows - H2
% clear all
load window_P_H2_all.mat
load window_Q_H2_all.mat
window_P = window_P_H2_all;
window_Q = window_Q_H2_all;
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
Labels = {sort([H2_1_ID;H2_2_ID;H2_3_ID;H2_4_ID]')};
set(gca, 'XTick', 1:121, 'XTickLabel', Labels);

ax(2) = subplot(212);bar(MetricQ);
linkaxes(ax, 'x');
set(gca, 'XTick', 1:121, 'XTickLabel', Labels);

%% Plot window shapes
Labels = unique(sort([H2_1_ID;H2_2_ID;H2_3_ID;H2_4_ID]))';
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
Labels = unique(sort([H2_1_ID;H2_2_ID;H2_3_ID;H2_4_ID]))';
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
