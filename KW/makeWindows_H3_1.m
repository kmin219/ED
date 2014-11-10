clear window_P window_Q
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

H_Mat=[2	1	0	0	1	1	0	3	0	0	3	1	0
2	4	0	0	4	1	0	5	0	0	5	1	0
2	6	0	0	6	1	0	7	0	0	7	1	0
2	8	0	0	8	1	0	9	0	0	9	1	0
2	13	0	-50	13	1	20	17	0	0	17	1	0
2	19	0	-50	19	1	20	21	0	0	21	1	0
2	22	0	-50	22	1	20	27	0	0	27	1	0
2	28	0	-50	28	1	20	33	0	0	33	1	0
2	34	0	0	34	1	0	35	0	0	35	1	0
2	36	0	0	36	1	0	37	0	0	37	1	0
2	38	0	0	38	1	0	39	0	0	39	1	0
2	43	0	0	43	1	0	45	0	0	45	1	0
1	3	0	0	3	1	0	4	0	0	4	1	0
1	5	0	0	5	1	0	6	0	0	6	1	0
1	7	0	0	7	1	0	8	0	0	8	1	0
1	9	0	0	9	1	0	10	0	0	10	1	0
0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0
2	58	0	0	59	1	0	60	0	0	60	1	0
2	62	0	0	63	1	0	64	0	0	64	1	0
2	66	0	0	67	1	0	68	0	0	68	1	0
2	69	0	0	70	1	0	71	0	0	71	1	0
1	11	0	0	11	1	0	13	0	0	13	1	0
1	14	0	0	14	1	0	15	0	0	15	1	0
1	16	0	0	16	1	0	17	0	0	17	1	0
1	18	0	0	18	1	0	19	0	0	19	1	0
0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0
1	20	0	0	23	1	0	29	0	0	29	1	0
1	35	0	0	39	1	0	44	0	0	44	1	0
1	45	0	0	49	1	0	55	0	0	55	1	0
1	56	0	0	58	1	0	64	0	0	64	1	0
2	79	0	0	79	1	0	80	0	0	80	1	0
2	81	0	0	81	1	0	83	0	0	83	1	0
2	84	0	0	84	1	0	85	0	0	85	1	0
2	88	0	0	88	1	0	89	0	0	89	1	0
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

window_P_H3_1 = window_P;
window_Q_H3_1 = window_Q;
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

