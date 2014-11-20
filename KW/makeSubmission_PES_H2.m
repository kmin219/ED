load unixTest_H2_1
load unixTest_H2_2
load unixTest_H2_3
load unixTest_H2_4

%%
% Dryer
H2_1 = [
10 334132 338286 165 165
];
H2_3 = [
10 291936 315242 165 165
10 361697 367863 165 165
];

%% H2_1
unixTest = unixTest_H2_1;
for i=[1:size(H2_1,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_1(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == H2_1(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_1(i,2), H2_1(i,3), H2_1(i,4), H2_1(i,5));
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
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_2(i,2), H2_2(i,3), H2_2(i,4), H2_2(i,5));
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
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_3(i,2), H2_3(i,3), H2_3(i,4), H2_3(i,5));
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
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H2_4(i,2), H2_4(i,3), H2_4(i,4), H2_4(i,5));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%%
writetable(tableSub,'SubTry.csv')