clc;clear all;close all;
cd('C:\Users\Kyungwoo.ECE-Santoso2\Google Drive\Data Mining\Project')
unixSub = readtable('SampleSubmission.csv');
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

%% Test
eventOn = 200000;
eventOff = 200002;
%% H1_1
unixTest = unixTest_H1_1;
for i=1 % for # of appliances
    idxStart = min(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    idxEnd = max(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    unixH1 = unixSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unixSub, eventOn(i,j), eventOff(i,j));
        unixSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%% H1_2
unixTest = unixTest_H1_2;
for i=1 % for # of appliances
    idxStart = min(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    idxEnd = max(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    unixH1 = unixSub.TimeStamp(idxStart:idxEnd);
    [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unixSub, eventOn, eventOff);
    unixSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
end

%% H1_3
unixTest = unixTest_H1_3;
for i=1 % for # of appliances
    idxStart = min(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    idxEnd = max(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    unixH1 = unixSub.TimeStamp(idxStart:idxEnd);
    [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unixSub, eventOn, eventOff);
    unixSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
end

%% H1_4
unixTest = unixTest_H1_4;
for i=1 % for # of appliances
    idxStart = min(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    idxEnd = max(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    unixH1 = unixSub.TimeStamp(idxStart:idxEnd);
    [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unixSub, eventOn, eventOff);
    unixSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
end
