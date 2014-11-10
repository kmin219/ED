clear window_P window_Q
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

H_Mat=[1	1	0	0	1	1	0	2	0	0	2	1	0
1	3	0	0	3	1	0	4	0	0	4	1	0
1	5	0	0	5	1	0	6	0	0	6	1	0
1	7	0	0	7	1	0	8	0	0	8	1	0
2	7	0	0	8	1	0	9	0	0	10	1	0
2	11	0	0	12	1	0	13	0	0	14	1	0
2	15	0	0	17	1	0	18	0	0	19	1	0
2	20	0	0	22	1	0	23	0	0	24	1	0
1	15	0	0	15	1	0	16	0	0	16	1	0
1	17	0	0	17	1	0	18	0	0	18	1	0
1	19	0	0	19	1	0	20	0	0	20	1	0
1	21	0	0	21	1	0	22	0	0	22	1	0
2	36	0	0	36	0	50	38	0	0	38	1	0
2	41	0	0	41	0	50	43	0	0	43	1	0
1	36	0	0	36	1	0	37	0	0	37	1	0
1	38	0	0	38	1	0	39	0	0	39	1	0
1	40	0	0	40	1	0	41	0	0	41	1	0
1	42	0	0	42	1	0	43	0	0	43	1	0
1	50	0	0	50	1	0	51	0	0	51	1	0
1	52	0	0	52	1	0	53	0	0	53	1	0
1	56	0	0	56	1	0	57	0	0	57	1	0
1	58	0	0	58	1	0	59	0	0	59	1	0
1	62	0	0	62	1	0	63	0	0	63	1	0
1	66	0	0	66	1	0	67	0	0	67	1	0
2	53	0	0	53	1	0	54	0	0	54	1	0
2	55	0	0	55	1	0	56	0	0	56	1	0
2	59	0	0	59	1	0	60	0	0	60	1	0
2	62	0	0	62	1	0	63	0	0	63	1	0
1	70	0	0	70	1	0	71	0	0	71	1	0
1	74	0	0	74	1	0	75	0	0	75	1	0
1	76	0	0	76	1	0	77	0	0	77	1	0
1	78	0	0	78	1	0	79	0	0	79	1	0
2	75	0	0	75	1	0	76	0	0	76	1	0
2	77	0	0	77	1	0	78	0	0	78	1	0
2	79	0	0	79	1	0	80	0	0	80	1	0
2	81	0	0	81	1	0	83	0	0	83	1	0
2	94	0	0	94	1	0	95	0	0	95	1	0
2	96	0	0	96	1	0	97	0	0	97	1	0
2	98	0	0	98	1	0	99	0	0	99	1	0
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

window_P_H3_2 = window_P;
window_Q_H3_2 = window_Q;
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

