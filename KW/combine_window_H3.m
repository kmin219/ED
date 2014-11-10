clc;clear all;
H3_1_ID = [1
1
1
1
2
2
2
2
3
3
3
3
4
4
4
4
5
5
5
6
6
6
6
7
7
7
7
8
8
8
9
9
9
9
10
10
10
10
];

H3_2_ID = [13
13
13
13
15
15
15
15
16
16
16
16
17
17
18
18
18
18
19
19
19
19
20
20
21
21
21
21
22
22
22
22
23
23
23
23
24
24
24
];

H3_3_ID = [37
12
12
37
12
12
11
14
14
14
14
25
25
25
25
26
26
26
26
29
29
29
29
28
28
28
28
27
27
27
27
30
30
30
30
32
32
32
32
31
31
31
31
33
35
35
33
35
36
36
36
36
34
34
34
34
];

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
clear all
load window_P_H3_all.mat
load window_Q_H3_all.mat
window_P = window_P_H3_all;
window_Q = window_Q_H3_all;
% Euclidean Distance Based
count = 1;
for i = 1:length(window_P_H3_all)
    if(~isempty(window_P{i}))
        disp(i)
        N = length(window_P_H3_all{i});
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



