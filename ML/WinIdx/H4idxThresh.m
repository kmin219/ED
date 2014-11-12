close all; clear all; clc;

current = cd()

cd('/Users/Min/Documents/College Files/Projects/ED/ML/WinIdx');

H4_1 = [
1	1	0	0	2	1	0	3	0	0	3	1	0	0	0	0
1	6	0	0	6	1	0	8	0	0	8	1	0	1	5.42	5.215
1	10	0	0	10	1	0	11	0	0	11	1	0	1	2.017	2.093
1	12	0	0	12	1	0	13	0	0	13	1	0	1	3.759	4.495
1	14	0	0	14	1	0	15	0	0	15	1	0	1	3.758	4.495
1	18	0	0	18	1	0	19	0	0	19	1	0	1	4.131	4.155
1	25	0	0	25	1	0	26	0	0	26	1	0	1	2.577	0.9277
1	27	0	0	27	1	0	28	0	0	28	1	0	1	2.671	2.728
1	29	0	0	29	1	0	40	0	0	40	1	0	1	6.182	2.841
1	41	0	0	42	1	0	43	0	0	43	1	0	1	4.582	2.063
1	44	0	0	44	1	0	47	0	0	47	1	0	1	5.52	4.923
1	48	0	0	48	1	0	51	0	0	51	1	0	1	2.017	2.093
1	54	0	0	54	1	0	55	0	0	55	1	0	1	4.263	4.153
1	58	0	0	58	1	0	59	0	0	59	1	0	1	2.31	2.377
1	60	0	0	60	1	0	61	0	0	61	1	0	0	0	0
1	62	0	0	63	1	0	64	0	0	64	1	0	1	4.582	2.063
1	65	0	0	65	1	0	66	0	0	66	1	0	1	5.166	4.469
1	71	0	0	71	1	0	72	0	0	72	1	0	1	4.277	3.766
1	73	0	0	73	1	0	74	0	0	74	1	0	1	2.688	2.736
1	75	0	0	75	1	0	77	0	0	77	1	0	1	2.532	1.09
1	78	0	0	78	1	0	79	0	0	79	1	0	1	4.953	1.427
1	90	0	0	90	1	0	110	0	0	111	1	0	1	5.084	2.762
1	112	0	0	112	1	0	123	0	0	123	1	0	1	4.903	1.937
1	126	0	0	127	1	0	128	0	0	128	1	0	1	5.285	5.581
1	129	0	0	130	1	0	131	0	0	131	1	0	1	5.261	5.586
1	132	0	0	133	1	0	134	0	0	134	1	0	1	5.28	5.57
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	1	0	0	2	1	0	3	0	0	3	1	0	0	0	0
2	6	0	0	6	1	0	7	0	0	7	1	0	1	4.562	4.654
2	11	0	0	11	1	0	12	0	0	12	1	0	1	5.544	4.478
2	13	0	0	13	1	0	24	0	0	24	1	0	1	4.944	1.898
2	25	0	0	25	1	0	26	0	0	26	1	0	1	5.095	2.342
2	29	0	0	29	1	0	30	0	0	30	1	0	1	4.735	4.658
2	32	0	0	32	1	0	35	0	0	35	1	0	1	5.297	4.478
2	36	0	0	37	1	0	38	0	0	38	1	0	1	5.095	2.342
2	40	0	0	40	1	0	41	0	0	41	1	0	1	4.59	4.667
2	44	0	0	44	1	0	45	0	0	45	1	0	1	4.944	1.898
2	56	0	0	57	1	0	82	0	0	82	1	0	1	3.77	3.17
2	83	0	0	83	1	0	95	0	0	95	1	0	1	5.479	1.549
2	96	0	0	96	1	0	97	0	0	97	1	0	1	5.54	4.136
];

H4_1Labels = {32	'Stove (phase 1)'
33	'Toaster Oven'
6	'Bread Maker'
26	'Mixer'
26	'Mixer'
31	'Sandwich Maker'
20	'Kitchen Counter Lights'
21	'Kitchen Lights with Dimmer'
27	'Oven (phase 1)'
32	'Stove (phase 1)'
33	'Toaster Oven'
6	'Bread Maker'
31	'Sandwich Maker'
21	'Kitchen Lights with Dimmer'
20	'Kitchen Counter Lights'
32	'Stove (phase 1)'
33	'Toaster Oven'
31	'Sandwich Maker'
21	'Kitchen Lights with Dimmer'
20	'Kitchen Counter Lights'
27	'Oven (phase 1)'
12	'Dishwasher (phase 1)'
27	'Oven (phase 1)'
36	'Vaccum'
36	'Vaccum'
36	'Vaccum'
17	'Hairdryer'
17	'Hairdryer'
17	'Hairdryer'
32	'Stove (phase 2)'
25	'Microwave'
19	'Kettle'
27	'Oven (phase 2)'
32	'Stove (phase 2)'
25	'Microwave'
19	'Kettle'
32	'Stove (phase 2)'
25	'Microwave'
27	'Oven (phase 2)'
12	'Dishwasher (phase 2)'
27	'Oven (phase 2)'
19	'Kettle'};

H4_2 = [
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	1	0	0	1	1	0	2	0	0	2	1	0	1	3.566	1.763
1	3	0	0	3	1	0	4	0	0	4	1	0	1	3.574	1.817
1	5	0	0	5	1	0	6	0	0	6	1	0	1	3.528	1.042
1	7	0	0	7	1	0	8	0	0	8	1	0	1	3.302	1.817
1	9	0	0	9	1	0	12	0	0	12	1	0	1	3.246	1.017
1	13	0	0	14	1	0	15	0	0	15	1	0	1	4.174	2.034
1	16	0	0	16	1	0	17	0	0	17	1	0	1	3.528	1.042
1	18	0	0	18	1	0	19	0	0	19	1	0	1	3.877	1.611
1	20	0	0	20	1	0	21	0	0	21	1	0	1	4.165	1.961
1	23	0	0	23	0	0	24	0	0	24	1	0	0	0	0
1	27	0	0	27	1	0	28	0	0	28	1	0	0	0	0
1	30	0	0	30	1	0	31	0	0	31	1	0	0	0	0
1	35	0	0	35	1	0	39	0	0	40	1	0	1	5.867	5.227
1	41	0	0	41	1	0	44	0	0	45	1	0	1	5.803	5.24
1	46	0	0	46	1	0	49	0	0	50	1	-36	1	5.706	5.133
1	55	0	0	55	1	0	56	0	0	56	1	0	1	2.247	0.9108
1	57	0	0	57	1	0	58	0	0	58	1	0	1	2.259	1.287
1	59	0	0	59	1	0	60	0	0	60	1	0	1	1.926	1.324
1	63	0	0	63	1	0	64	0	0	64	1	0	1	2.271	1.609
1	65	0	0	65	1	0	66	0	0	66	1	0	1	2.483	1.824
1	67	0	0	67	1	0	68	0	0	68	1	0	1	2.47	1.824
1	72	0	0	72	1	0	73	0	0	73	1	0	1	1.293	0.3303
1	74	0	0	74	1	0	75	0	0	75	1	0	1	1.745	0.08679
1	76	0	0	76	1	0	77	0	0	77	1	0	1	1.745	0.3372
1	88	0	0	89	1	0	92	0	0	92	1	0	1	3.346	2.225
1	99	0	0	99	1	10	100	0	0	100	1	0	1	2.703	2.73
1	101	0	0	101	1	10	103	0	0	103	1	0	1	3.133	2.377
1	104	0	0	104	1	0	105	0	0	105	1	0	1	1.71	1.947
1	106	0	0	106	1	0	107	0	0	107	1	0	1	2.036	1.46
1	108	0	0	108	1	0	109	0	0	109	1	0	1	1.971	1.943
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	1	0	0	1	1	0	2	0	0	2	1	0	1	0.1922	0.1439
2	3	0	0	3	1	0	4	0	0	4	1	0	1	0.4889	0.4019
2	5	0	0	5	1	0	6	0	0	6	1	0	1	0.7014	-0.2777
2	7	0	0	7	1	0	8	0	0	8	1	0	1	0.4432	0.4019
2	9	0	0	9	1	0	10	0	0	10	1	0	1	0.7239	0.1605
2	11	0	0	11	1	0	12	0	0	12	1	0	1	0.4889	0.02875
2	13	0	0	13	1	0	14	0	0	14	1	0	1	3.429	0.977
2	15	0	0	15	1	0	16	0	0	16	1	0	1	3.43	1.051
2	17	0	0	17	1	0	18	0	0	18	1	0	1	2.229	0.1461
2	19	0	0	19	1	0	20	0	0	20	1	0	1	3.429	0.9775
2	21	0	0	21	1	0	24	0	0	24	1	0	1	2.285	0.2581
2	25	0	0	25	1	0	26	0	0	26	1	0	1	5.149	2.279
2	27	0	0	27	1	0	28	0	0	28	1	0	1	2.285	0.2581
2	29	0	0	30	1	0	31	0	0	31	1	0	1	5.878	2.603
2	32	0	0	33	1	0	34	0	0	34	1	0	1	5.878	2.603
2	37	0	0	37	1	0	38	0	0	38	1	0	1	4.397	4.73
2	39	0	0	39	1	0	40	0	0	40	1	0	1	4.398	4.91
2	47	0	0	47	1	0	48	0	0	48	1	0	1	2.951	2.711
2	49	0	0	49	1	0	50	0	0	50	1	0	1	2.753	2.482
2	51	0	0	51	1	0	52	0	0	52	1	0	1	2.953	2.712
2	53	0	0	53	1	0	54	0	0	54	1	0	1	4.548	4.911
2	57	0	0	57	1	0	58	0	0	58	1	0	1	2.396	2.195
2	59	0	0	59	1	0	60	0	0	60	1	0	1	2.396	1.856
2	61	0	0	61	1	0	62	0	0	62	1	0	1	2.255	2.195
2	63	0	0	63	1	0	64	0	0	64	1	0	1	2.57	2.744
2	65	0	0	65	1	0	66	0	0	66	1	0	1	2.249	2.461
2	67	0	0	67	1	0	68	0	0	68	1	0	1	2.57	2.744
2	72	0	0	72	1	0	73	0	0	73	1	0	1	2.115	2.45
];

H4_2Labels = {8	'Computer Desk Lamp'
8	'Computer Desk Lamp'
8	'Computer Desk Lamp'
14	'Entry light'
14	'Entry light'
14	'Entry light'
24	'Livingroom Lamp 2'
24	'Livingroom Lamp 2'
24	'Livingroom Lamp 2'
30	'Room Baseboard Heater (Phase 1)'
30	'Room Baseboard Heater (Phase 1)'
10	'Den Baseboard Heater (Phase 1)'
30	'Room Baseboard Heater (Phase 1)'
10	'Den Baseboard Heater (Phase 1)'
15	'Forced-air Heater (Phase 1)'
10	'Den Baseboard Heater (Phase 1)'
15	'Forced-air Heater (Phase 1)'
15	'Forced-air Heater (Phase 1)'
23	'Livingroom Lamp 1'
23	'Livingroom Lamp 1'
23	'Livingroom Lamp 1'
28	'PC'
28	'PC'
28	'PC'
11	'Den Overhead Light'
11	'Den Overhead Light'
11	'Den Overhead Light'
22	'LivingRoom overhead halogen'
22	'LivingRoom overhead halogen'
22	'LivingRoom overhead halogen'
9	'Deck Light'
9	'Deck Light'
9	'Deck Light'
16	'HP Elitebook Laptop'
16	'HP Elitebook Laptop'
16	'HP Elitebook Laptop'
2	'Apple Macbook Pro 15'
2	'Apple Macbook Pro 15'
2	'Apple Macbook Pro 15'
1	'Apple Macbook Pro 13'
1	'Apple Macbook Pro 13'
5	'Bose iPhone Dock'
5	'Bose iPhone Dock'
5	'Bose iPhone Dock'
7	'Closet Light'
7	'Closet Light'
7	'Closet Light'
18	'Hallway overhead Light'
18	'Hallway overhead Light'
18	'Hallway overhead Light'
4	'Bedroom Lamps 2'
3	'Bedroom Lamp 1'
4	'Bedroom Lamps 2'
3	'Bedroom Lamp 1'
4	'Bedroom Lamps 2'
3	'Bedroom Lamp 1'
30	'Room Baseboard Heater (Phase 2)'
30	'Room Baseboard Heater (Phase 2)'
10	'Den Baseboard Heater (Phase 2)'
30	'Room Baseboard Heater (Phase 2)'
10	'Den Baseboard Heater (Phase 2)'
15	'Forced-air Heater (Phase 2)'
10	'Den Baseboard Heater (Phase 2)'
15	'Forced-air Heater (Phase 2)'
15	'Forced-air Heater (Phase 2)'
13	'Electric Furnace'
13	'Electric Furnace'
29	'PS3'
29	'PS3'
29	'PS3'
13	'Electric Furnace'
35	'Toilet Halogen'
35	'Toilet Halogen'
35	'Toilet Halogen'
34	'Toilet Exhaust'
34	'Toilet Exhaust'
34	'Toilet Exhaust'
1	'Apple Macbook Pro 13'};

save('H4idx.mat')
cd(current)