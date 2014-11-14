clear all; close all; clc;

path = pwd; 
addpath(genpath(path));
clear path
%% Load Distance Metrics 

%  On Events: load distances in P
load MetricP_all_on_H1_1.mat
load MetricP_all_on_H1_2.mat
load MetricP_all_on_H1_3.mat
load MetricP_all_on_H1_4.mat

%  On Events: load distances in Q
load MetricQ_all_on_H1_1.mat
load MetricQ_all_on_H1_2.mat
load MetricQ_all_on_H1_3.mat
load MetricQ_all_on_H1_4.mat

%  Off Events: load distances in P
load MetricP_all_off_H1_1.mat
load MetricP_all_off_H1_2.mat
load MetricP_all_off_H1_3.mat
load MetricP_all_off_H1_4.mat

%  Off Events: load distances in Q
load MetricQ_all_off_H1_1.mat
load MetricQ_all_off_H1_2.mat
load MetricQ_all_off_H1_3.mat
load MetricQ_all_off_H1_4.mat

%  Load Windows to get thresh
load window_P_H1_all
load window_Q_H1_all

%% Detect On/Off Events for Test 1 Data

% Detect On Events
disp('Looking for On events in Test 1');
metPdata = MetricP_all_on_H1_1;
metQdata = MetricQ_all_on_H1_1;
winP = window_P_H1_all;
winQ = window_Q_H1_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in Test 1');
metPdata = MetricP_all_off_H1_1;
metQdata = MetricQ_all_off_H1_1;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH1_1 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH1_1{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end

%% Detect On/Off Events for Test 2 Data

% Detect On Events
disp('Looking for On events in Test 2');
metPdata = MetricP_all_on_H1_2;
metQdata = MetricQ_all_on_H1_2;
winP = window_P_H1_all;
winQ = window_Q_H1_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in Test 2');
metPdata = MetricP_all_off_H1_2;
metQdata = MetricQ_all_off_H1_2;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH1_2 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH1_2{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end
%% Detect On/Off Events for Test 3 Data

% Detect On Events
disp('Looking for On events in Test 3');
metPdata = MetricP_all_on_H1_3;
metQdata = MetricQ_all_on_H1_3;
winP = window_P_H1_all;
winQ = window_Q_H1_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in Test 3');
metPdata = MetricP_all_off_H1_3;
metQdata = MetricQ_all_off_H1_3;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH1_3 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH1_3{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end

%% Detect On/Off Events for Test 4 Data

% Detect On Events
disp('Looking for On events in Test 4');
metPdata = MetricP_all_on_H1_4;
metQdata = MetricQ_all_on_H1_4;
winP = window_P_H1_all;
winQ = window_Q_H1_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in Test 4');
metPdata = MetricP_all_off_H1_4;
metQdata = MetricQ_all_off_H1_4;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH1_4 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH1_4{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end

save('events_H1.mat', 'eventsH1_1','eventsH1_2','eventsH1_3','eventsH1_4');

%%  Visualize Combined On Off results to verify
% 
% metPdata = MetricP_all_on_H1_1;
% metQdata = MetricQ_all_on_H1_1;
% 
% for i = 1:numApp
%     disp(i)
%     if(~isempty(events{i}))
%         for j = 1:length(events{i})
%             if any(events{i}{j})
%             MetricP = metPdata{i}{j};
%             MetricQ = metQdata{i}{j};
%                 
%                 figure()
%                 ax(1) = subplot(311);plot(MetricP);
%                 title(sprintf('MetricP for Appliance %i', i))
%                 ax(2) = subplot(312);plot(MetricQ);
%                 title(sprintf('MetricQ for Appliance %i', i))
%                 ax(3) = subplot(313);stem(events{i}{j});
%                 title(sprintf('ON Event for Window  %i', j))
%                 linkaxes(ax, 'x');
% 
%                 pause; 
%             end
%         end
%     end
% end

%%  Visualize Combined Off results to verify
% 
% metPdata = MetricP_all_off_H1_1;
% metQdata = MetricQ_all_off_H1_1;
% 
% for i = 1:numApp
%     disp(i)
%     if(~isempty(offEvents{i}))
%         for j = 1:length(offEvents{i})
%             if any(offEvents{i}{j})
%             MetricP = metPdata{i}{j};
%             MetricQ = metQdata{i}{j};
%                 
%                 figure()
%                 ax(1) = subplot(311);plot(MetricP);
%                 title(sprintf('MetricP for Appliance %i', i))
%                 ax(2) = subplot(312);plot(MetricQ);
%                 title(sprintf('MetricQ for Appliance %i', i))
%                 ax(3) = subplot(313);stem(offEvents{i}{j});
%                 title(sprintf('Off Event for Window  %i', j))
%                 linkaxes(ax, 'x');
% 
%                 pause; 
%             end
%         end
%     end
% end
% 
%%  Visualize Combined On results to verify
% 
% metPdata = MetricP_all_on_H1_1;
% metQdata = MetricQ_all_on_H1_1;
% 
% for i = 1:numApp
%     disp(i)
%     if(~isempty(onEvents{i}))
%         for j = 1:length(onEvents{i})
%             if any(onEvents{i}{j})
%             MetricP = metPdata{i}{j};
%             MetricQ = metQdata{i}{j};
%                 
%                 figure()
%                 ax(1) = subplot(311);plot(MetricP);
%                 title(sprintf('MetricP for Appliance %i', i))
%                 ax(2) = subplot(312);plot(MetricQ);
%                 title(sprintf('MetricQ for Appliance %i', i))
%                 ax(3) = subplot(313);stem(onEvents{i}{j});
%                 title(sprintf('ON Event for Window  %i', j))
%                 linkaxes(ax, 'x');
% 
%                 pause; 
%             end
%         end
%     end
% end

