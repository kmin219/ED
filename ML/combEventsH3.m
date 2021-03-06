clear all; close all; clc;

path = pwd; 
addpath(genpath(path));
clear path
%% Main - combine event data for each window of each appliance and generate
%  matrix of AppID, OnIdx, OffIdx

%  Load event data  ------------------------------------------------------- 
load events_H3
data{1} = eventsH3_1;
data{2} = eventsH3_2;
data{3} = eventsH3_3;
data{4} = eventsH3_4;

%  Generate Matrix of ON/OFF Pairs  ---------------------------------------

for k = 1:4
    eventsH3 = data{k};         % iterate through each test set

    numApp = length(eventsH3);
    onOffPairs = zeros(1,3);
    count = 0;      %  number of total ON/OFF pairs


    for i = 1:numApp
        sumEvents = 0;

        %  get maximum window length of each appliance  -------------------
        for j = 1:length(eventsH3{i}) 
        winLen(j) = length(eventsH3{i}{j});
        maxWinLen = max(winLen);
        end

        %  pad each window by maxWinLen and add together  -----------------
        for j = 1:length(eventsH3{i})
            winLen = length(eventsH3{i}{j});
            diff = maxWinLen - winLen;
            alignWin = padarray(eventsH3{i}{j}, [0 diff], 'pre');
            sumEvents = sumEvents + alignWin;
        end

        %  search for On and Off pairs  -----------------------------------

        tag = 0;        %  0 = searching for ON, 1 = searching for OFF

        for j = 1:length(sumEvents)
            if sumEvents(j) >=1 && tag == 0
                onIdx = j;
                tag = 1;
                count = count + 1;

            elseif sumEvents(j) <=-1 && tag == 1
                offIdx = j;
                tag = 0;
                onOffPairs(count,:) = [i onIdx offIdx];

            elseif j == length(sumEvents) && tag == 1
                offIdx = j;
                tag = 0;
                onOffPairs(count,:) = [i onIdx offIdx];
            end
        end       
    end
    
    eventPairs{k} = onOffPairs;

end

save('H3pairs', 'eventPairs');

%% visualize

% y = ones(1,6)*2;
% figure
% stem(sumEvents)
% hold on
% scatter(onOffPairs(:,2),y, 'r');
% scatter(onOffPairs(:,3),-y, 'm');


