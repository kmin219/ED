clear window_P window_Q
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

H_Mat=[1	1	0	0	1	1	0	2	0	0	2	1	0
1	3	0	0	3	1	0	4	0	0	4	1	0
1	5	0	0	5	1	0	6	0	0	6	1	0
1	7	0	0	7	1	0	8	0	0	8	1	0
2	1	0	0	1	1	0	2	0	0	2	1	0
2	3	0	0	3	1	0	4	0	0	4	1	0
2	5	0	0	5	1	0	7	0	0	7	1	0
2	8	0	0	8	1	0	9	0	0	9	1	0
1	9	0	0	9	1	0	10	0	0	10	1	0
1	11	0	0	11	1	0	12	0	0	12	1	0
1	13	0	0	13	1	0	14	0	0	14	1	0
1	15	0	0	15	1	0	16	0	0	16	1	0
2	10	0	0	10	1	0	11	0	0	11	1	0
2	12	0	0	12	1	0	13	0	0	13	1	0
2	14	0	0	14	1	0	15	0	0	15	1	0
2	16	0	0	16	1	0	17	0	0	17	1	0
2	18	0	0	18	1	0	19	0	0	19	1	0
2	20	0	0	20	1	0	21	0	0	21	1	0
2	24	0	0	24	1	0	25	0	0	25	1	0
2	26	0	0	26	1	0	27	0	0	27	1	0
2	28	0	0	28	1	0	29	0	0	29	1	0
2	30	0	0	30	1	0	31	0	0	31	1	0
2	37	0	0	37	1	0	38	0	0	38	1	0
2	41	0	0	41	1	0	42	0	0	42	1	0
2	47	0	0	47	1	0	48	0	0	48	1	0
2	51	0	0	51	1	0	52	0	0	52	1	0
1	17	0	0	17	1	0	18	0	0	18	1	0
1	19	0	0	19	1	0	20	0	0	20	1	0
1	23	0	0	23	1	0	24	0	0	24	1	0
1	25	0	0	25	1	0	26	0	0	26	1	0
1	29	0	0	29	1	0	30	0	0	30	1	0
2	54	0	0	54	1	0	55	0	0	55	1	0
2	58	0	0	58	1	0	59	0	0	59	1	0
1	35	0	0	35	1	0	36	0	0	36	1	0
1	39	0	0	39	1	0	40	0	0	40	1	0
1	45	0	0	45	1	0	46	0	0	46	1	0
1	51	0	0	51	1	0	52	0	0	52	1	0
1	53	0	0	53	1	0	54	0	0	54	1	0
1	55	0	0	55	1	0	56	0	0	56	1	0
1	57	0	0	57	1	0	58	0	0	58	1	0
1	61	0	0	61	1	0	62	0	0	62	1	0
1	65	0	0	65	1	0	66	0	0	66	1	0
1	69	0	0	69	1	0	70	0	0	70	1	0
2	90	0	0	90	1	0	91	0	0	91	1	0
2	94	0	0	94	1	0	95	0	0	95	1	0
2	98	0	0	98	1	0	99	0	0	99	1	0
2	100	0	0	100	1	0	103	0	0	103	1	0
2	106	0	0	106	1	0	107	0	0	107	1	0
2	112	0	0	112	1	0	115	0	0	115	1	0
2	116	0	0	451	1	0	116	0	0	451	1	0
2	452	0	0	466	1	0	452	0	0	466	1	0
2	467	0	0	863	1	0	467	0	0	863	1	0
2	864	0	0	914	1	0	864	0	0	914	1	0
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

window_P_H2_2 = window_P;
window_Q_H2_2 = window_Q;
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

