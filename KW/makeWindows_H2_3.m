clear window_P window_Q
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

H_Mat=[2	1	0	0	1	1	0	2	0	0	2	1	0	0	0	0
2	5	0	0	5	1	0	6	0	0	6	1	0	1	2.71	1.148
2	7	0	0	7	1	0	8	0	0	8	1	0	1	7.062	5.531
2	9	0	0	9	1	0	13	0	0	13	1	0	1	5.968	5.143
2	16	0	0	16	1	0	17	0	0	17	1	0	1	6.334	5.729
2	33	0	0	317	1	0	33	0	0	317	1	0	0	0	0
2	318	0	0	357	1	0	318	0	0	357	1	0	0	0	0
2	368	0	0	652	1	0	368	0	0	652	1	0	0	0	0
2	1717	0	0	1750	1	0	1717	0	0	1750	1	0	0	0	0
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
     
     window_P{i}{4} = H_Mat(i,14);  % on/off
     window_P{i}{5} = H_Mat(i,15);  % P threshold
     
     window_Q{i}{4} = H_Mat(i,14);  % on/off
     window_Q{i}{6} = H_Mat(i,16);  % Q threshold     
end

window_P_H2_3 = window_P;
window_Q_H2_3 = window_Q;
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

