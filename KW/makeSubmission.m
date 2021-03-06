% clc;clear all;close all;
startup()
%% m.file locations
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));

tableSub = readtable('SampleSubmission.csv');
load unixTest_H1_1
load unixTest_H1_2
load unixTest_H1_3
load unixTest_H1_4

load unixTest_H2_1
load unixTest_H2_2
load unixTest_H2_3
load unixTest_H2_4

load unixTest_H3_1
load unixTest_H3_2
load unixTest_H3_3
load unixTest_H3_4

load unixTest_H4_1
load unixTest_H4_2
load unixTest_H4_3
load unixTest_H4_4

load testH3_1
load testH3_2
load testH3_3
load testH3_4

% load H3_1pairs
% load H3_2pairs
% load H3_3pairs
% load H3_4pairs
load H2pairs % Home 2
%% Test
eventOn = 200000;
eventOff = 200002;
%%
H3_1 = [
11	307996	333813
33	271416	278170
];


H3_2 = [37	264080	310715
12	287047	295452
12	312244	320124
];

H3_3 = [37	274943	316198
12	297745	305543
12	318964	326397
];

H3_4 = [37	264360	303163
12	289070	296991
12	308153	319859
];

%%
H3_2 = [
    31,242476,243192;31,245721,246438]

H3_3 = [
    31,207181,207896;31,253288,254004;31,256590,257307;31,418242,418598]

H3_4 = [31,242616,243345;31,245717,246013;31,336823,337606]

%% +microwave
H3_1 = [
11	307996	333813
33	271416	278170
];


H3_2 = [37	264080	310715
12	287047	295452
12	312244	320124
31,242476,243192;31,245721,246438
];

H3_3 = [37	274943	316198
12	297745	305543
12	318964	326397
31,207181,207896;31,253288,254004;31,256590,257307;31,418242,418598
];

H3_4 = [37	264360	303163
12	289070	296991
12	308153	319859
31,242616,243345;31,245717,246013;31,336823,337606
];


%% H3_1
unixTest = unixTest_H3_1;
for i=[1:size(H3_1,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_1(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_1(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_1(i,2), H3_1(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
%     end
end

%% H3_2
unixTest = unixTest_H3_2;
for i=[1:size(H3_2,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_2(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_2(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_2(i,2), H3_2(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
%     end
end
%% H3_3
unixTest = unixTest_H3_3;
for i=[1:size(H3_3,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_3(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_3(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_3(i,2), H3_3(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%% H3_4
unixTest = unixTest_H3_4;
for i=[1:size(H3_4,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_4(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_4(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_4(i,2), H3_4(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%%
writetable(tableSub,'SubTry.csv')