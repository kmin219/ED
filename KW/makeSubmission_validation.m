% clc;clear all;close all;
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

unixTest = unixTest_H3_1;
%%
idxStart = min(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_1(1,1) ));
idxEnd = max(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == H3_1(1,1) ));
unix_temp = tableSub.TimeStamp(idxStart:idxEnd);  % submission unix time stamp

unixSub = unix_temp;
unixTest = unixTest_H3_1;
eventOn = H3_1(1,2);
eventOff = H3_1(1,3);

window_size1 = 20;
window_dist = 30;
window_size2 = 20;

% index is the event index in the test data
indexOn = (eventOn-1)+window_size1 + window_size2 + window_dist;
indexOff = (eventOff-1)+window_size1 + window_size2 + window_dist;

% eventUnix is the corresponding Unixtimestamp of the index
unixTestOn = unixTest(indexOn);   
unixTestOff = unixTest(indexOff);   

% idx is the index used to mark the event on the submital
indexSubOn = min(find((int64(unixSub) - int64(unixTestOn) > 0)));
indexSubOff = min(find((int64(unixSub) - int64(unixTestOff) > 0)))-1;

tableSub.Predicted(idxStart+indexSubOn-1:idxStart+indexSubOff-1) = 1;   % Turn the App On



