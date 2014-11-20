load unixTest_H4_1
load unixTest_H4_2
load unixTest_H4_3
load unixTest_H4_4



%%
H4_1 = [
12 312784 341535 121 69
12  312784	341535	121	69
19	220907	221467	69	69
19	277818	278417	69	69

];
% 
H4_2 = [
12 300086 324709 121 69
12	300086	324709	121	69

];

H4_3 = [
12	313409	351597	121	69
19	222304	223354	69	69
19	260858	261907	69	69
11	289678	318152	48	49
13	260859	261907	73	69
34	234176	243188	61	61
35	277417	285015	67	67
35	290024	294358	67	67
];

%% H4_1
unixTest = unixTest_H4_1;
for i=[1:size(H4_1,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_1(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_1(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H4_1(i,2), H4_1(i,3), H4_1(i,4), H4_1(i,5));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
%     end
end

%% H4_2
unixTest = unixTest_H4_2;
for i=[1:size(H4_2,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_2(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_2(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
%     for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H4_2(i,2), H4_2(i,3), H4_2(i,4), H4_2(i,5));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
%     end
end
%% H4_3
unixTest = unixTest_H4_3;
for i=[1:size(H4_3,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_3(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_3(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H4_3(i,2), H4_3(i,3), H4_3(i,4), H4_3(i,5));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%% H4_4
unixTest = unixTest_H4_4;
for i=[1:size(H4_4,1)] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_4(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_4(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H4_4(i,2), H4_4(i,3), H4_4(i,4), H4_4(i,5));
        tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
    end
end

%%
writetable(tableSub,'SubTry.csv')