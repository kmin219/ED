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

% load testH3_1
% load testH3_2
% load testH3_3
% load testH3_4

load H3_1pairs
load H3_2pairs
load H3_3pairs
load H3_4pairs


%% 
unixH1= tableSub.TimeStamp(find(strcmp(tableSub.House,'H1') & tableSub.Appliance == 1 ));
unixH2= tableSub.TimeStamp(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == 1 ));
unixH3= tableSub.TimeStamp(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == 1 ));
unixH4= tableSub.TimeStamp(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == 1 ));

unixH1_1 = unixH1(1:442);
unixH1_2 = unixH1(443:884);
unixH1_3 = unixH1(885:1325);
unixH1_4 = unixH1(1326:length(unixH1));

unixH2_1 = unixH2(1:438);
unixH2_2 = unixH2(439:921);
unixH2_3 = unixH2(922:1399);
unixH2_4 = unixH2(1400:length(unixH2));

unixH3_1 = unixH3(1:284);
unixH3_2 = unixH3(285:654);
unixH3_3 = unixH3(655:1016);
unixH3_4 = unixH3(1017:length(unixH3));

unixH4_1 = unixH4(1:309);
unixH4_2 = unixH4(310:644);
unixH4_3 = unixH4(645:length(unixH4));

figure()
plot(unixH1_1)

figure()
plot(unixH1_2)

figure()
plot(unixH1_3)

figure()
plot(unixH1_4)

figure()
plot(unixH2_1)

figure()
plot(unixH2_2)

figure()
plot(unixH2_3)

figure()
plot(unixH2_4)

figure()
plot(unixH3_1)

figure()
plot(unixH3_2)

figure()
plot(unixH3_3)

figure()
plot(unixH3_4)

figure()
plot(unixH4_1)

figure()
plot(unixH4_2)

figure()
plot(unixH4_3)

% figure()
% plot(unixH1)
% 
% figure()
% plot(unixH2)
% 
% figure()
% plot(unixH3)
% 
% figure()
% plot(unixH4)
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