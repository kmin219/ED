clc;clear all;
idx_H3_1 = {1	'Back Porch Lights'
1	'Back Porch Lights'
1	'Back Porch Lights'
1	'Back Porch Lights'
2	'Bedroom 1 LCD TV'
2	'Bedroom 1 LCD TV'
2	'Bedroom 1 LCD TV'
2	'Bedroom 1 LCD TV'
3	'Bedroom 1 Lights'
3	'Bedroom 1 Lights'
3	'Bedroom 1 Lights'
3	'Bedroom 1 Lights'
4	'Bedroom 2 Lights'
4	'Bedroom 2 Lights'
4	'Bedroom 2 Lights'
4	'Bedroom 2 Lights'
5	'Bonus Room Blueray/DVD'
5	'Bonus Room Blueray/DVD'
5	'Bonus Room Blueray/DVD'
6	'Bonus Room LED TV'
6	'Bonus Room LED TV'
6	'Bonus Room LED TV'
6	'Bonus Room LED TV'
7	'Bonus Room Lights'
7	'Bonus Room Lights'
7	'Bonus Room Lights'
7	'Bonus Room Lights'
8	'Bonus Room Wii'
8	'Bonus Room Wii'
8	'Bonus Room Wii'
9	'Computer'
9	'Computer'
9	'Computer'
9	'Computer'
10	'Dining Room Lights'
10	'Dining Room Lights'
10	'Dining Room Lights'
10	'Dining Room Lights'
};

idx_H3_2 = {13	'Foyer Lights'
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

idx_H3_3 = {37	'Washer'
12	'Dryer'
12	'Dryer'
37	'Washer'
12	'Dryer'
12	'Dryer'
11	'Dishwasher'
14	'Front Porch Lights'
14	'Front Porch Lights'
14	'Front Porch Lights'
14	'Front Porch Lights'
25	'Master Bath Fan'
25	'Master Bath Fan'
25	'Master Bath Fan'
25	'Master Bath Fan'
26	'Master Bath Lights'
26	'Master Bath Lights'
26	'Master Bath Lights'
26	'Master Bath Lights'
29	'Master LCD TV/DVR'
29	'Master LCD TV/DVR'
29	'Master LCD TV/DVR'
29	'Master LCD TV/DVR'
28	'Master Closet Lights'
28	'Master Closet Lights'
28	'Master Closet Lights'
28	'Master Closet Lights'
27	'Master Blueray/DVD'
27	'Master Blueray/DVD'
27	'Master Blueray/DVD'
27	'Master Blueray/DVD'
30	'Master Lights'
30	'Master Lights'
30	'Master Lights'
30	'Master Lights'
32	'Office Lights'
32	'Office Lights'
32	'Office Lights'
32	'Office Lights'
31	'Microwave'
31	'Microwave'
31	'Microwave'
31	'Microwave'
33	'Oven'
35	'Toaster'
35	'Toaster'
33	'Oven'
35	'Toaster'
36	'Upstairs Hallway Lights'
36	'Upstairs Hallway Lights'
36	'Upstairs Hallway Lights'
36	'Upstairs Hallway Lights'
34	'Powder Room Lights'
34	'Powder Room Lights'
34	'Powder Room Lights'
34	'Powder Room Lights'
};
    
H3_1_ID = cell2mat(idx_H3_1(:,1));
H3_2_ID = cell2mat(idx_H3_2(:,1));
H3_3_ID = cell2mat(idx_H3_3(:,1));

load window_P_H3_1
load window_Q_H3_1
load window_P_H3_2
load window_Q_H3_2
load window_P_H3_3
load window_Q_H3_3

% unique(sort([H3_1_ID;H3_2_ID;H3_3_ID]))'

window_P_H3_all = {};
for i = [unique(sort([H3_1_ID;H3_2_ID;H3_3_ID]))']
    temp = {};
    idx_H1 = find(H3_1_ID == i);
    temp = [temp window_P_H3_1(idx_H1)];
    
    idx_H2 = find(H3_2_ID == i);
    temp = [temp window_P_H3_2(idx_H2)];
    
    idx_H3 = find(H3_3_ID == i);
    temp = [temp window_P_H3_3(idx_H3)];
    
    window_P_H3_all{i} = temp;
end

window_Q_H3_all = {};
for i = [unique(sort([H3_1_ID;H3_2_ID;H3_3_ID]))']
    temp = {};
    idx_H1 = find(H3_1_ID == i);
    temp = [temp window_Q_H3_1(idx_H1)];
    
    idx_H2 = find(H3_2_ID == i);
    temp = [temp window_Q_H3_2(idx_H2)];
    
    idx_H3 = find(H3_3_ID == i);
    temp = [temp window_Q_H3_3(idx_H3)];
    
    window_Q_H3_all{i} = temp;
end

%% Histogram of all windows - H3
% clear all
load window_P_H3_all.mat
load window_Q_H3_all.mat
window_P = window_P_H3_all;
window_Q = window_Q_H3_all;
% Euclidean Distance Based - Plot the maximum power consumption (approx.)
count = 1;
for i = 1:length(window_P)
    for j = [1:1:length(window_P{i})]
        window_app_P = window_P{i}{j};  % appliance i event j
        window_app_Q = window_Q{i}{j};
        if(~isempty(window_app_P{1}))
            tempP = window_app_P{1};  % on window
            DistP = max(tempP);
            
            tempQ = window_app_Q{1};   % on window
            DistQ = max(tempQ);
                
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


ax(1) = subplot(211);bar(MetricP);
Labels = {sort([H3_1_ID;H3_2_ID;H3_3_ID]')};
set(gca, 'XTick', 1:121, 'XTickLabel', Labels);

ax(2) = subplot(212);bar(MetricQ);
linkaxes(ax, 'x');
set(gca, 'XTick', 1:121, 'XTickLabel', Labels);


%%
Labels = unique(sort([H3_1_ID;H3_2_ID;H3_3_ID]))';
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