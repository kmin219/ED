function [ indexSubOn, indexSubOff ] = fgetUnixTime( unixTest, unixSub, eventOn, eventOff, sizeOn, sizeOff )
    window_size1 = 20;
    window_dist = 30;
    window_size2 = 20;

    % index is the event index in the test data
    indexOn = (eventOn)+ floor((window_size1 + window_size2 + window_dist + sizeOn)/2);
    indexOff = (eventOff)+ floor((window_size1 + window_size2 + window_dist + sizeOff)/2);
    
    % eventUnix is the corresponding Unixtimestamp of the index
    unixTestOn = unixTest(indexOn);   
    unixTestOff = unixTest(indexOff);   
    
    % idx is the index used to mark the event on the submital
    indexSubOn = min(find((int64(unixSub) - int64(unixTestOn) > 0)));
    indexSubOff = min(find((int64(unixSub) - int64(unixTestOff) > 0)))-1;
end

% indexOn = 169;
% indexOff = 269;
% [~, indexSubOn] = min(abs(unixSub.TimeStamp - unixTestOn))
% [~, indexSubOff] = min(abs(unixSub.TimeStamp - unixTestOff))
% 
% int64(unixSub.TimeStamp(1))