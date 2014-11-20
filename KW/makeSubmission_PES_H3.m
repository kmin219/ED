clc;clear all;close all;
startup()
%% m.file locations
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));

tableSub = readtable('SampleSubmission.csv');

load unixTest_H3_1
load unixTest_H3_2
load unixTest_H3_3
load unixTest_H3_4

%%
H3_1 = [
33	271459 276145 72 69
];


H3_2 = [
12 312152 319983 116 72
12 286960 295313 116 72
31 242476 243192 80 70
31 245721 246438 80 70
];


H3_3 = [
12 297654 305408 116 72
12 318890 326262 116 72
31 207181 207896 80 70
31 253288 254004 80 70
31 256590 257307 80 70
31 418242 418598 80 70
];


H3_4 = [
    12 288997  296849 116 72
    12 308052  319716 116 72
    31 242616 243345 80 70
    31 245717 246013 80 70
    31 336823 337606 80 70
];

%% H3_1
unixTest = unixTest_H3_1;
for i=[1:size(H3_1,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_1(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_1(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_1(i,2), H3_1(i,3), H3_1(i,4), H3_1(i,5));
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
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_2(i,2), H3_2(i,3), H3_2(i,4), H3_2(i,5));
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
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_3(i,2), H3_3(i,3), H3_3(i,4), H3_3(i,5));
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
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H3_4(i,2), H3_4(i,3), H3_4(i,4), H3_4(i,5));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%%
writetable(tableSub,'SubTry.csv')