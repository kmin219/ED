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

H_Mat=[1	1	0	0	1	1	0	2	0	0	2	1	0	1	2.985	6.143
1	3	0	0	3	1	0	4	0	0	4	1	0	1	3.603	4.947
1	5	0	0	5	1	0	6	0	0	6	1	0	1	3.566	4.928
1	7	0	0	7	1	0	8	0	0	8	1	0	1	2.961	6.143
1	9	0	0	10	1	0	11	0	0	11	1	0	1	9.112	4.28
1	15	0	0	15	1	0	16	0	0	16	1	0	1	10.14	3.349
1	20	0	0	20	1	0	21	0	0	21	1	0	0	0	0
1	22	0	0	22	1	0	23	0	0	23	1	0	0	0	0
2	1	0	0	2	1	0	3	0	0	3	1	0	1	10.32	10.42
2	4	0	0	5	1	0	7	0	0	7	1	0	1	9.809	10.42
2	8	0	0	9	1	0	10	0	0	10	1	0	1	10.18	10.07
2	11	0	0	12	1	0	13	0	0	13	1	0	1	10.37	9.528
2	16	0	0	16	1	0	17	0	0	17	1	0	1	10.93	10.76
2	18	0	0	18	1	0	19	0	0	19	1	0	1	10.52	9.757
2	20	0	0	20	1	0	21	0	0	21	1	0	1	10.53	9.926
2	22	0	0	22	1	0	23	0	0	23	1	0	1	10.92	10.76
2	25	0	0	25	1	0	26	0	0	26	1	0	1	5.479	0
2	32	0	0	32	1	0	33	0	0	33	1	0	1	6.011	0
2	34	0	0	34	1	0	35	0	0	35	1	0	1	6.068	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	24	0	0	24	1	0	25	0	0	25	1	0	1	10.1	8.467
1	26	0	0	27	1	0	28	0	0	28	1	0	1	9.761	8.051
1	29	0	0	29	1	0	30	0	0	30	1	0	1	9.026	8.442
1	31	0	0	31	1	0	32	0	0	32	1	0	1	9.161	7.808
2	37	0	0	37	1	0	38	0	0	38	1	0	1	6.371	5.177
2	39	0	0	39	1	0	40	0	0	40	1	0	1	5.504	4.31
2	41	0	0	41	1	0	42	0	0	42	1	0	1	6.241	4.794
2	43	0	0	43	1	0	44	0	0	44	1	0	1	6.392	5.14
2	45	0	0	45	1	0	46	0	0	46	1	0	1	9.286	6.991
2	47	0	0	47	1	0	48	0	0	48	1	0	1	8.307	6.403
2	49	0	0	50	1	0	51	0	0	51	1	0	1	8.81	6.269
2	52	0	0	52	1	0	53	0	0	53	1	0	1	9.612	7.262
1	33	0	0	33	1	0	34	0	0	34	1	0	1	6.574	0
1	35	0	0	35	1	0	36	0	0	36	1	0	1	6.398	0
1	39	0	0	39	1	0	40	0	0	40	1	0	1	9.149	0
1	41	0	0	44	1	0	45	0	0	45	1	0	1	9.121	6.155
1	46	0	0	47	1	0	48	0	0	48	1	0	1	9.121	6.155
1	49	0	0	51	1	0	52	0	0	52	1	0	1	8.716	6.23
1	53	0	0	54	1	0	55	0	0	55	1	0	1	9.266	6.512
2	62	0	0	63	1	0	64	0	0	64	1	0	1	5.943	3.861
2	68	0	0	69	1	0	70	0	0	70	1	0	1	5.957	3.864
2	71	0	0	72	1	0	73	0	0	73	1	0	1	6.288	3.71
2	74	0	0	74	1	0	76	0	0	76	1	0	1	4.491	4.154
2	77	0	0	77	1	0	81	0	0	81	1	0	0	0	0
2	82	0	0	82	1	0	86	0	0	86	1	0	1	3.807	3.815
2	87	0	0	87	1	0	90	0	0	90	1	0	1	4.432	4.149
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
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
        
        window_P{i}{3} = 1;  % phase
        window_Q{i}{3} = 1;  % phase
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
        
        window_P{i}{3} = 2;  % phase
        window_Q{i}{3} = 2;  % phase
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

window_P_H2_1 = window_P;
window_Q_H2_1 = window_Q;
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

