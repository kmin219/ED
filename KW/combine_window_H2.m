clc;clear all;
H2_1_ID = [21
21
21
21
14
14
32
32
13
13
13
13
25
25
25
25
30
30
30
28
28
28
28
36
36
36
36
8
8
8
8
18
18
18
18
7
7
7
5
5
5
5
33
33
33
6
6
6
6
29
29
29
29
];

H2_2_ID = [16
16
16
16
17
17
17
17
31
31
31
31
15
15
15
15
12
12
12
12
19
19
20
20
26
26
3
3
3
1
1
4
4
2
2
34
34
34
34
23
23
22
22
24
24
35
35
35
35
37
10
37
10
];

H2_3_ID = [27
27
11
11
11
37
10
37
10
];

H2_4_ID = [9
9
9
9
9
9
];

load window_P_H2_1
load window_Q_H2_1
load window_P_H2_2
load window_Q_H2_2
load window_P_H2_3
load window_Q_H2_3
load window_P_H2_4
load window_Q_H2_4


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
clear all
load window_P_H2_all.mat
load window_Q_H2_all.mat
window_P = window_P_H2_all;
window_Q = window_Q_H2_all;
% Euclidean Distance Based
count = 1;
for i = 1:length(window_P_H2_all)
    if(~isempty(window_P{i}))
        disp(i)
        N = length(window_P_H2_all{i});
        for k = [1:N]
            if(~isempty(window_P{i}{k}))
                tempP = window_P{i}{k}{1};  % on window
                DistP = max(tempP);
            
                tempQ = window_Q{i}{k}{1};   % on window
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
end
ax(1) = subplot(211);bar(MetricP);
ax(2) = subplot(212);bar(MetricQ);
linkaxes(ax, 'x');



