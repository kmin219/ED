function [ indexSubOn, indexSubOff ] = fgetUnixTime( unixTest, unixSub, eventOn, eventOff )
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
    [~, indexSubOn] = min(unixSub.TimeStamp((int64(unixSub.TimeStamp) - int64(unixTestOn) > 0)));
    [~, indexSubOff] = max(unixSub.TimeStamp((int64(unixSub.TimeStamp) - int64(unixTestOff) < 0)));
end

% indexOn = 169;
% indexOff = 269;
% [~, indexSubOn] = min(abs(unixSub.TimeStamp - unixTestOn))
% [~, indexSubOff] = min(abs(unixSub.TimeStamp - unixTestOff))
% 
% int64(unixSub.TimeStamp(1))