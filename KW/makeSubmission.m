cd('C:\Users\Kyungwoo.ECE-Santoso2\Google Drive\Data Mining\Project')
unixSub = readtable('SampleSubmission.csv');
for i=[1] % for # of appliances
    idxStart = min(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    idxEnd = max(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == i ));
    unixH1 = unixSub.TimeStamp(idxStart:idxEnd);
    [indexSubOn, indexSubOff] = fgetUnixTime(unixTest, unixH1, eventOn, eventOff);
    unixSub.Predicted(idxStart+indexSubon-1:idxStart+indexSubOff-1) = 1;   % Turn the App On
end