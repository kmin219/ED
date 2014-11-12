function [ unixOutput ] = fgetUnixTime( unixTest, unixSub, eventOn, eventOff )
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
    [~, indexSubOn] = min(abs(unixSub - unixTestOn));
    [~, indexSubOff] = min(abs(unixSub - unixTestOff));
    
end


    
    
% cd('C:\Users\Kyungwoo\Google Drive\Data Mining\Project')
% a = csvread('SampleSubmission.csv');
% 
% unixH1 = csvread('SampleSubmission.csv',1,3,[1,3,1762,3]);
% unixH2 = csvread('SampleSubmission.csv',66957,3,[66957,3,68836,3]);
% unixH3 = csvread('SampleSubmission.csv',136517,3,[136517,3,137788,3]);
% unixH4 = csvread('SampleSubmission.csv',183544,3,[183544,3,184544,3]);
cd('C:\Users\Kyungwoo.ECE-Santoso2\Google Drive\Data Mining\Project')
unixSub = readtable('SampleSubmission.csv');
idxStart = min(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == 1 ));
idxEnd = max(find(strcmp(unixSub.House,'H1') & unixSub.Appliance == 1 ));
unixH1 = unixSub.TimeStamp(idxStart:idxEnd);

idxStart = min(find(strcmp(unixSub.House,'H2') & unixSub.Appliance == 1 ));
idxEnd = max(find(strcmp(unixSub.House,'H2') & unixSub.Appliance == 1 ));
unixH2 = unixSub.TimeStamp(idxStart:idxEnd);

idxStart = min(find(strcmp(unixSub.House,'H3') & unixSub.Appliance == 1 ));
idxEnd = max(find(strcmp(unixSub.House,'H3') & unixSub.Appliance == 1 ));
unixH3 = unixSub.TimeStamp(idxStart:idxEnd);

idxStart = min(find(strcmp(unixSub.House,'H4') & unixSub.Appliance == 1 ));
idxEnd = max(find(strcmp(unixSub.House,'H4') & unixSub.Appliance == 1 ));
unixH4 = unixSub.TimeStamp(idxStart:idxEnd);
