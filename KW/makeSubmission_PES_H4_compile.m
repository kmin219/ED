load unixTest_H4_1
load unixTest_H4_2
load unixTest_H4_3
load unixTest_H4_4

%%
H4_1 = [
12 312784 341535 121 69
];

H4_2 = [
12 300086 324709 121 69
];

H4_3 = [
12 313409   351597  121 69
27 251102 253153 69 69
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
% for i=[1:size(H4_3,1)] % for # of appliances
for i=[1] % for # of appliances
    idxStart = min(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_3(i,1) ));
    idxEnd = max(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == H4_3(i,1) ));
    unix_temp = tableSub.TimeStamp(idxStart:idxEnd);
    for j=1 % for # of on/offs
        [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unix_temp, H4_3(i,2), H4_3(i,3), H4_3(i,4), H4_3(i,5));
        
            window_size1 = 20;
            window_dist = 30;
            window_size2 = 20;

            % index is the event index in the test data
            indexOn = ( H4_3(i,2))+ floor((window_size1 + window_size2 + window_dist + H4_3(i,4))/2);
            indexOff = (H4_3(i,3))+ floor((window_size1 + window_size2 + window_dist + H4_3(i,5))/2);

            % eventUnix is the corresponding Unixtimestamp of the index
            unixTestOn = unixTest(indexOn);   
            unixTestOff = unixTest(indexOff);   

            % idx is the index used to mark the event on the submital
            if(unixTestOn<unix_temp(1))
                indexSubOn = 1;
            else
                indexSubOn = min(find((int64(unix_temp) - int64(unixTestOn) > 0)));
            end
            if(unixTestOff>unix_temp(end))
                indexSubOff = length(indexSubOff);
            else
                indexSubOff = min(find((int64(unix_temp) - int64(unixTestOff) > 0)))-1;
            end
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