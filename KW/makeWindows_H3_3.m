clear window_P window_Q
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

H_Mat=[2	1	0	0	743	1	0	1	0	0	743	1	0
1	1	0	0	23	1	0	1	0	0	23	1	0
2	744	0	0	769	1	0	744	0	0	769	1	0
2	773	0	0	1400	1	0	773	0	0	1400	1	0
1	24	0	0	42	1	0	24	0	0	42	1	0
2	1401	0	0	1429	1	0	1401	0	0	1429	1	0
1	50	0	0	58	1	0	59	0	0	81	1	0
1	93	0	0	93	1	0	94	0	0	94	1	0
1	95	0	0	95	1	0	96	0	0	97	1	0
1	98	0	0	98	1	0	99	0	0	100	1	0
1	101	0	0	101	1	0	102	0	0	103	1	0
2	1439	0	0	1439	1	0	1440	0	0	1440	1	0
2	1441	0	0	1441	1	0	1442	0	0	1442	1	0
2	1443	0	0	1443	1	0	1445	0	0	1445	1	0
2	1446	0	0	1446	1	0	1447	0	0	1447	1	0
2	1452	0	0	1452	1	0	1453	0	0	1453	1	0
2	1454	0	0	1454	1	0	1455	0	0	1455	1	0
2	1456	0	0	1456	1	0	1457	0	0	1457	1	0
2	1458	0	0	1458	1	0	1459	0	0	1459	1	0
1	115	0	0	115	1	0	116	0	0	116	1	0
1	117	0	0	117	1	0	118	0	0	118	1	0
1	119	0	0	119	1	0	120	0	0	120	1	0
1	121	0	0	121	1	0	122	0	0	122	1	0
1	125	0	0	125	1	0	127	0	0	127	1	0
1	128	0	0	128	1	0	129	0	0	129	1	0
1	130	0	0	130	1	0	131	0	0	131	1	0
1	132	0	0	132	1	0	133	0	0	133	1	0
0	0	0	0	0	1	0	0	0	0	0	1	0
0	0	0	0	0	1	0	0	0	0	0	1	0
0	0	0	0	0	1	0	0	0	0	0	1	0
0	0	0	0	0	1	0	0	0	0	0	1	0
1	139	0	0	139	1	0	140	0	0	140	1	0
1	141	0	0	141	1	0	142	0	0	142	1	0
1	143	0	0	143	1	0	144	0	0	144	1	0
1	145	0	0	145	1	0	146	0	0	146	1	0
1	147	0	0	147	1	0	148	0	0	148	1	0
1	149	0	0	149	1	0	150	0	0	150	1	0
1	151	0	0	151	1	0	152	0	0	152	1	0
1	153	0	0	153	1	0	154	0	0	154	1	0
1	163	0	0	163	1	0	164	0	0	164	1	0
1	170	0	0	170	1	0	171	0	0	171	1	0
1	173	0	0	173	1	0	174	0	0	174	1	0
1	176	0	0	176	1	0	177	0	0	177	1	0
1	183	0	0	190	1	0	191	0	0	195	1	0
1	196	0	0	196	1	0	197	0	0	197	1	0
1	198	0	0	198	1	0	199	0	0	199	1	0
1	200	0	0	204	1	0	205	0	0	210	1	0
1	211	0	0	211	1	0	212	0	0	212	1	0
1	221	0	0	221	1	0	222	0	0	222	1	0
1	223	0	0	223	1	0	224	0	0	224	1	0
1	225	0	0	225	1	0	226	0	0	226	1	0
1	227	0	0	227	1	0	228	0	0	228	1	0
1	231	0	0	231	1	0	232	0	0	232	1	0
1	233	0	0	233	1	0	234	0	0	234	1	0
1	235	0	0	235	1	0	236	0	0	236	1	0
1	237	0	0	237	1	0	238	0	0	238	1	0
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

window_P_H3_3 = window_P;
window_Q_H3_3 = window_Q;
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

