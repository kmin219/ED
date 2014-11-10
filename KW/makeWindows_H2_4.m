clear window_P window_Q
H2_4_ID = [9
9
9
9
9
9
];

H_Mat=[1	8	0	0	27	1	0	8	0	0	27	1	0
2	18	0	0	52	1	0	18	0	0	52	1	0
1	35	0	0	67	1	0	35	0	0	67	1	0
2	57	0	0	111	1	0	57	0	0	111	1	0
1	68	0	0	90	1	0	68	0	0	90	1	0
2	130	0	0	164	1	0	130	0	0	164	1	0
];

for i = [1:size(H_Mat,1)]
    if(H_Mat(i,1) == 1)
        on_start_idx = fgetindex(Windows_All_L1,H_Mat(i,2),H_Mat(i,3),H_Mat(i,4));
        on_end_idx = fgetindex(Windows_All_L1,H_Mat(i,5),H_Mat(i,6),H_Mat(i,7));
        window_P{i}{1} = featP_scanA_L1(on_start_idx:on_end_idx);  % on windows
        window_Q{i}{1} = featQ_scanA_L1(on_start_idx:on_end_idx);  % on windows

        off_start_idx = fgetindex(Windows_All_L1,H_Mat(i,8),H_Mat(i,9),H_Mat(i,10));
        off_end_idx = fgetindex(Windows_All_L1,H_Mat(i,11),H_Mat(i,12),H_Mat(i,13));
        window_P{i}{2} = featP_scanA_L1(off_start_idx:off_end_idx);  % off windows
        window_Q{i}{2} = featQ_scanA_L1(off_start_idx:off_end_idx);  % off windows
        
        window_P{i}{3} = 1;  % on windows
        window_Q{i}{3} = 1;  % on windows
    end
    
    if(H_Mat(i,1) == 2)
        on_start_idx = fgetindex(Windows_All_L2,H_Mat(i,2),H_Mat(i,3),H_Mat(i,4));
        on_end_idx = fgetindex(Windows_All_L2,H_Mat(i,5),H_Mat(i,6),H_Mat(i,7));
        window_P{i}{1} = featP_scanA_L2(on_start_idx:on_end_idx);  % on windows
        window_Q{i}{1} = featQ_scanA_L2(on_start_idx:on_end_idx);  % on windows
        
        off_start_idx = fgetindex(Windows_All_L2,H_Mat(i,8),H_Mat(i,9),H_Mat(i,10));
        off_end_idx = fgetindex(Windows_All_L2,H_Mat(i,11),H_Mat(i,12),H_Mat(i,13));
        window_P{i}{2} = featP_scanA_L2(off_start_idx:off_end_idx);  % off windows
        window_Q{i}{2} = featQ_scanA_L2(off_start_idx:off_end_idx);  % on windows
        
        window_P{i}{3} = 2;  % on windows
        window_Q{i}{3} = 2;  % on windows
    end
    
     if(H_Mat(i,1) == 0)
         window_P{i} = [];
         window_Q{i} = [];
     end
end

window_P_H2_4 = window_P;
window_Q_H2_4 = window_Q;
% load w_H2_1P
% load w_H2_1Q
% 
% % Euclidean Distance Based
% for i = 1:20
%     figure()
%     subplot(211);plot(window_P{i}{1});
%     subplot(212);plot(window_Q{i}{1});
%     pause
% end

