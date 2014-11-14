% clc;clear all;close all;
startup()
%% m.file locations
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));

tableSub = readtable('SampleSubmission.csv');

load unixTest_H2_1
load unixTest_H2_2
load unixTest_H2_3
load unixTest_H2_4
load H2pairs % Home 2

%% +microwave
H2_1 = [1,316302,518807;3,446059,518800;16,235319,235996;16,295608,315095;16,397885,497154;23,367564,518799;34,467448,518798];
H2_2 = [3,413681,414109;16,215261,238782;16,271086,279741;16,283291,386413;16,390358,391753;16,392149,420104;16,450461,513596;23,410264,518800;24,269623,518801];
H2_3 = [1,499839,500419;3,209871,213994;3,214289,289934;3,425518,426406;3,473254,502252;16,223067,245646;16,274449,278062;16,301426,307935;16,323999,328155;16,406737,503196;34,315225,453492];
H2_4 = [1,510893,512567;3,394559,407604;3,504767,512967;16,270842,275524;16,351455,366901;16,372753,377366;16,385555,388688;16,395994,409226;23,323408,518799];


%% H2_1
unixTest = unixTest_H2_1;
for i=[1:size(H2_1,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_1(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_1(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_1(i,2), H2_1(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
%     end
end

%% H2_2
unixTest = unixTest_H2_2;
for i=[1:size(H2_2,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_2(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_2(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_2(i,2), H2_2(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
%     end
end
%% H2_3
unixTest = unixTest_H2_3;
for i=[1:size(H2_3,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_3(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_3(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_3(i,2), H2_3(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%% H2_4
unixTest = unixTest_H2_4;
for i=[1:size(H2_4,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_4(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_4(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_4(i,2), H2_4(i,3));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%%
writetable(tableSub,'SubTry.csv')