close all; clear all; clc;

current = cd()

cd('/Users/Min/Documents/College Files/Projects/ED/ML/WinIdx');

H1_1 = [1	1	0	0	4	1	0	18	0	0	19	1	0	1	5.814	5.73
1	28	0	0	28	1	0	29	0	0	29	1	0	1	5.54	1.049
1	46	0	0	46	1	0	47	0	0	47	1	0	1	6.016	4.651
1	48	0	0	48	1	0	49	0	-144	49	1	0	1	6.304	5.468
2	1	0	0	1	1	0	2	0	0	2	1	0	1	6.568	5.667
];

H1_1Labels = {38	'Washer'
35	'Toaster'
32	'Portable Vacuum'
8	'Central Vacuum'
16	'Dryer'};

H1_2 = [1	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
1	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
1	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
1	5	0	0	5	1	0	6	0	0	6	1	0	1	0.4915	-0.01735
1	7	0	0	7	1	0	8	0	0	8	1	0	1	1.001	-0.199
1	9	0	0	9	1	0	10	0	0	10	1	0	1	1.001	-1.046
1	11	0	0	11	1	0	12	0	0	12	1	0	1	1.605	2.338
1	13	0	0	13	1	0	14	0	0	14	1	0	1	1.772	1.635
1	15	0	0	15	1	0	16	0	0	16	1	0	1	1.813	2.721
1	24	0	0	24	1	0	26	0	0	26	1	0	1	1.962	3.353
1	27	0	0	27	1	0	28	0	0	28	1	0	1	1.935	3.137
1	29	0	0	29	1	0	30	0	0	30	1	0	1	1.975	3.357
1	31	0	0	31	1	0	32	0	0	32	1	0	1	1.867	0.4285
1	33	0	0	33	1	0	34	0	0	34	1	0	1	1.867	0.3868
1	35	0	0	35	1	0	36	0	0	36	1	0	1	1.785	0.5275
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	1	0	0	1	1	0	2	0	0	2	1	0	1	2.844	2.584
2	3	0	0	3	1	0	4	0	0	4	1	0	1	2.932	2.684
2	5	0	0	5	1	0	6	0	0	6	1	0	1	2.346	2.865
2	7	0	0	7	1	0	8	0	0	8	1	0	1	3.458	2.021
2	9	0	0	9	1	0	10	0	0	10	1	0	1	3.472	1.671
2	11	0	0	11	1	0	12	0	0	12	1	0	1	3.202	1.676
2	13	0	0	13	1	0	14	0	0	14	1	0	1	1.636	3.004
2	15	0	0	15	1	0	16	0	0	16	1	0	1	1.637	2.875
2	17	0	0	17	1	0	18	0	0	18	1	0	1	1.637	3.521
2	19	0	0	19	1	0	20	0	0	20	1	0	1	0.9941	2.998
2	21	0	0	21	1	0	22	0	0	22	1	0	1	1.225	2.432
2	23	0	0	23	1	0	24	0	0	24	1	0	1	1.225	2.998
2	26	0	0	26	1	0	27	0	0	27	1	0	1	1.679	0.4211
2	28	0	0	28	1	0	29	0	0	29	1	0	1	1.71	0.4231
2	30	0	0	30	1	0	31	0	0	31	1	0	1	2.148	0.4325
2	32	0	0	32	1	0	33	0	0	33	1	0	1	2.157	0.3035
2	34	0	0	34	1	0	35	0	0	35	1	0	1	1.987	1.092
2	36	0	-5	37	1	5	38	0	-5	38	1	5	1	0.8268	3.258
2	39	0	-5	39	1	5	40	0	-5	40	1	5	1	0.8268	3.04
2	41	0	-5	41	1	5	42	0	-5	42	1	5	1	0.7079	3.258
2	43	0	0	43	1	0	44	0	0	44	1	0	1	2.247	0.8195
2	45	0	0	45	1	0	46	0	0	46	1	0	1	2.063	0.9218
2	47	0	0	47	1	0	48	0	0	48	1	0	1	2.259	1.316
2	49	0	0	49	1	0	50	0	0	50	1	0	1	3.194	0.8834
2	51	0	0	51	1	0	52	0	0	52	1	0	1	3.336	0.8891
2	53	0	0	53	1	0	54	0	0	54	1	0	1	3.336	0.8283
2	55	0	0	55	1	0	56	0	0	56	1	0	1	3.567	4.805
2	57	0	0	57	1	0	58	0	0	58	1	0	1	3.564	4.621
2	59	0	0	59	1	0	60	0	0	60	1	0	1	3.48	4.803
2	61	0	0	61	1	0	62	0	0	62	1	0	1	1.672	0
2	63	0	0	63	1	0	64	0	0	64	1	0	1	2.133	0
2	65	0	0	65	1	0	66	0	0	66	1	0	1	2.152	0
2	67	0	0	67	1	0	68	0	0	68	1	0	1	1.628	2.531
2	69	0	0	69	1	0	70	0	0	70	1	0	1	1.781	2.53
2	71	0	0	71	1	0	72	0	0	72	1	0	1	1.794	1.985
2	73	0	0	73	1	0	74	0	0	74	1	0	1	2.142	0
2	75	0	0	75	1	0	76	0	0	76	1	0	1	2.142	0
2	77	0	0	77	1	0	78	0	0	78	1	0	1	1.982	0
2	79	0	0	79	1	0	80	0	0	80	1	0	1	1.32	0
2	81	0	0	81	1	0	82	0	0	82	1	0	1	1.564	0
2	83	0	0	83	1	0	84	0	0	84	1	0	1	1.564	0
2	85	0	0	85	1	0	86	0	0	86	1	0	0	0	0
2	87	0	0	87	1	0	88	0	0	88	1	0	0	0	0
2	89	0	0	89	1	0	90	0	0	90	1	0	0	0	0
2	91	0	0	91	1	0	92	0	0	92	1	0	0	0	0
2	93	0	0	93	1	0	94	0	0	94	1	0	0	0	0
2	95	0	0	95	1	0	96	0	0	96	1	0	0	0	0
];

H1_2Labels = {6	'Backyard Light'
6	'Backyard Light'
6	'Backyard Light'
5	'BR2 Lights'
5	'BR2 Lights'
5	'BR2 Lights'
4	'BR2 Closet Light'
4	'BR2 Closet Light'
4	'BR2 Closet Light'
25	'Master BA Lights'
25	'Master BA Lights'
25	'Master BA Lights'
24	'Master BA Heat Lamp'
24	'Master BA Heat Lamp'
24	'Master BA Heat Lamp'
7	'Balcony Lights'
7	'Balcony Lights'
7	'Balcony Lights'
10	'Dining Room Lights'
10	'Dining Room Lights'
10	'Dining Room Lights'
13	'Downstairs Bathroom Fan Lights'
29	'Outside Front Door Lights'
29	'Outside Front Door Lights'
29	'Outside Front Door Lights'
34	'Stairway Lights'
34	'Stairway Lights'
34	'Stairway Lights'
30	'Outside Over Garage Lights'
30	'Outside Over Garage Lights'
30	'Outside Over Garage Lights'
15	'Downstairs Hallway Lights'
15	'Downstairs Hallway Lights'
15	'Downstairs Hallway Lights'
14	'Downstairs Bathroom Lights'
14	'Downstairs Bathroom Lights'
14	'Downstairs Bathroom Lights'
12	'Downstairs Bathroom Fan'
12	'Downstairs Bathroom Fan'
12	'Downstairs Bathroom Fan'
13	'Downstairs Bathroom Fan Lights'
13	'Downstairs Bathroom Fan Lights'
3	'BR1 Lights'
3	'BR1 Lights'
3	'BR1 Lights'
1	'BR1 Closet Light'
1	'BR1 Closet Light'
1	'BR1 Closet Light'
18	'GR Lights'
18	'GR Lights'
18	'GR Lights'
22	'Kitchen Lights'
22	'Kitchen Lights'
22	'Kitchen Lights'
23	'Kitchen Under Cabinet Lights'
23	'Kitchen Under Cabinet Lights'
23	'Kitchen Under Cabinet Lights'
31	'Over Sink Light'
31	'Over Sink Light'
31	'Over Sink Light'
33	'Powder Rm Lights'
33	'Powder Rm Lights'
33	'Powder Rm Lights'
37	'Upstairs Hallway Lights'
37	'Upstairs Hallway Lights'
37	'Upstairs Hallway Lights'
26	'Master BR Entry Lights'
26	'Master BR Entry Lights'
26	'Master BR Entry Lights'
27	'Master BR Lights'
27	'Master BR Lights'
27	'Master BR Lights'
28	'Master BR Walk-in Closet Lights'
28	'Master BR Walk-in Closet Lights'
28	'Master BR Walk-in Closet Lights'};

H1_3 = [1	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
];

H1_3Labels = {11	'Dishwasher (Phase 1)'
11	'Dishwasher (Phase 2)'};

H1_4 = [1	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
1	5	0	-5	5	1	5	6	0	-5	6	1	5	1	1.05	0.3865
1	7	0	-5	7	1	5	8	0	-5	8	1	5	1	1.274	0.475
1	9	0	-5	9	1	5	11	0	0	11	1	0	1	1.24	0.6699
1	13	0	0	14	1	0	15	0	0	16	1	0	1	4.664	3.23
1	17	0	0	20	1	0	21	0	0	22	1	0	1	4.23	2.978
1	23	0	0	24	1	0	25	0	0	26	1	0	1	4.44	3.229
1	27	0	0	28	1	0	0	0	0	0	1	0	1	4.87	3.244
1	47	0	0	47	1	0	48	0	0	48	1	0	1	4.38	3.441
1	50	0	0	50	1	0	52	0	0	52	1	0	1	3.216	1.627
1	53	0	0	53	1	0	54	0	0	54	1	0	1	3.255	1.164
1	55	0	0	55	1	0	56	0	0	56	1	0	1	3.258	1.183
1	83	0	0	83	1	0	87	0	0	87	1	0	1	4.551	2.442
1	92	0	0	92	1	0	98	0	0	98	1	-35	1	4.379	2.02
1	99	0	0	99	1	0	105	0	0	105	1	-35	1	4.24	1.533
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	1	0	0	1	1	0	2	0	0	2	1	0	1	3.662	0
2	3	0	0	3	1	0	4	0	0	4	1	0	1	3.498	0
2	5	0	0	5	1	0	6	0	0	6	1	0	1	3.662	0
2	7	0	0	7	1	0	8	0	0	8	1	0	1	2.949	0
2	9	0	0	9	1	0	10	0	0	12	1	0	1	3.696	0
2	13	0	0	13	1	0	14	0	0	16	1	0	1	3.564	0
2	19	0	0	21	1	0	22	0	0	24	1	0	1	5.812	0
2	28	0	0	30	1	0	25	0	0	27	1	0	1	5.812	0
];

H1_4Labels = {2	'BR1 DVD'
2	'BR1 DVD'
2	'BR1 DVD'
2	'BR1 DVD'
20	'Garage Door Opener'
20	'Garage Door Opener'
20	'Garage Door Opener'
20	'Garage Door Opener'
17	'GR LCD TV'
17	'GR LCD TV'
17	'GR LCD TV'
17	'GR LCD TV'
19	'GR PS4'
19	'GR PS4'
19	'GR PS4'
36	'Trash Compactor'
21	'Garage Lights'
21	'Garage Lights'
21	'Garage Lights'
21	'Garage Lights'
21	'Garage Lights'
21	'Garage Lights'
9	'Coffee Maker'
9	'Coffee Maker'
36	'Trash Compactor'
36	'Trash Compactor'};

H1_5 = [1	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
2	0	0	0	0	1	0	0	0	0	0	1	0	0	0	0
];

H1_5Labels = {11	'Dishwasher (Phase 1)'
11	'Dishwasher (Phase 2)'};

H1_6 = [1	1	0	0	1	1	0	2	0	0	2	1	0	1	3.879	2.722
1	3	0	0	3	1	0	4	0	0	4	1	0	1	3.772	2.708
1	5	0	0	5	1	0	6	0	0	6	1	0	1	3.879	2.725
];

H1_6Labels = {35	'Toaster'
35	'Toaster'
35	'Toaster'};

save('H1idx.mat')
cd(current)