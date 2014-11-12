clc;
clear all;
close all;

startup()
path = pwd;
addpath(genpath(path));

% Power Difference from each Home
[~, ~, ~, ~, unixTest_H1_1]= test_main_H1(1);
[~, ~, ~, ~, unixTest_H1_2]= test_main_H1(2);
[~, ~, ~, ~, unixTest_H1_3]= test_main_H1(3);
[~, ~, ~, ~, unixTest_H1_4]= test_main_H1(4);

[~, ~, ~, ~, unixTest_H2_1]= test_main_H2(1);
[~, ~, ~, ~, unixTest_H2_2]= test_main_H2(2);
[~, ~, ~, ~, unixTest_H2_3]= test_main_H2(3);
[~, ~, ~, ~, unixTest_H2_4]= test_main_H2(4);

[~, ~, ~, ~, unixTest_H3_1]= test_main_H3(1);
[~, ~, ~, ~, unixTest_H3_2]= test_main_H3(2);
[~, ~, ~, ~, unixTest_H3_3]= test_main_H3(3);
[~, ~, ~, ~, unixTest_H3_4]= test_main_H3(4);

[~, ~, ~, ~, unixTest_H4_1]= test_main_H4(1);
[~, ~, ~, ~, unixTest_H4_2]= test_main_H4(2);
[~, ~, ~, ~, unixTest_H4_3]= test_main_H4(3);
[~, ~, ~, ~, unixTest_H4_4]= test_main_H4(4);

save('unixTest_H1_1.mat', 'unixTest_H1_1')
save('unixTest_H1_2.mat', 'unixTest_H1_2')
save('unixTest_H1_3.mat', 'unixTest_H1_3')
save('unixTest_H1_4.mat', 'unixTest_H1_4')

save('unixTest_H2_1.mat', 'unixTest_H2_1')
save('unixTest_H2_2.mat', 'unixTest_H2_2')
save('unixTest_H2_3.mat', 'unixTest_H2_3')
save('unixTest_H2_4.mat', 'unixTest_H2_4')

save('unixTest_H3_1.mat', 'unixTest_H3_1')
save('unixTest_H3_2.mat', 'unixTest_H3_2')
save('unixTest_H3_3.mat', 'unixTest_H3_3')
save('unixTest_H3_4.mat', 'unixTest_H3_4')

save('unixTest_H4_1.mat', 'unixTest_H4_1')
save('unixTest_H4_2.mat', 'unixTest_H4_2')
save('unixTest_H4_3.mat', 'unixTest_H4_3')
save('unixTest_H4_4.mat', 'unixTest_H4_4')
