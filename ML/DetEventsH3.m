clear all; close all; clc;

path = pwd; 
addpath(genpath(path));
clear path
%% Load Distance Metrics 

%  On Events: load distances in P
load MetricP_all_on_H3_1.mat
load MetricP_all_on_H3_2.mat
load MetricP_all_on_H3_3.mat
load MetricP_all_on_H3_4.mat

%  On Events: load distances in Q
load MetricQ_all_on_H3_1.mat
load MetricQ_all_on_H3_2.mat
load MetricQ_all_on_H3_3.mat
load MetricQ_all_on_H3_4.mat

%  Off Events: load distances in P
load MetricP_all_off_H3_1.mat
load MetricP_all_off_H3_2.mat
load MetricP_all_off_H3_3.mat
load MetricP_all_off_H3_4.mat

%  Off Events: load distances in Q
load MetricQ_all_off_H3_1.mat
load MetricQ_all_off_H3_2.mat
load MetricQ_all_off_H3_3.mat
load MetricQ_all_off_H3_4.mat

%  Load Windows to get thresh
load window_P_H3_all
load window_Q_H3_all

%% Detect On/Off Events for Test 1 Data

% Detect On Events
disp('Looking for On events in H1');
metPdata = MetricP_all_on_H3_1;
metQdata = MetricQ_all_on_H3_1;
winP = window_P_H3_all;
winQ = window_Q_H3_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in H1');
metPdata = MetricP_all_off_H3_1;
metQdata = MetricQ_all_off_H3_1;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH3_1 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH3_1{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end

%% Detect On/Off Events for Test 2 Data

% Detect On Events
disp('Looking for On events in H2');
metPdata = MetricP_all_on_H3_2;
metQdata = MetricQ_all_on_H3_2;
winP = window_P_H3_all;
winQ = window_Q_H3_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in H2');
metPdata = MetricP_all_off_H3_2;
metQdata = MetricQ_all_off_H3_2;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH3_2 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH3_2{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end
%% Detect On/Off Events for Test 3 Data

% Detect On Events
disp('Looking for On events in H3');
metPdata = MetricP_all_on_H3_3;
metQdata = MetricQ_all_on_H3_3;
winP = window_P_H3_all;
winQ = window_Q_H3_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in H3');
metPdata = MetricP_all_off_H3_3;
metQdata = MetricQ_all_off_H3_3;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH3_3 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH3_3{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end

%% Detect On/Off Events for Test 4 Data

% Detect On Events
disp('Looking for On events in H4');
metPdata = MetricP_all_on_H3_4;
metQdata = MetricQ_all_on_H3_4;
winP = window_P_H3_all;
winQ = window_Q_H3_all;

onEvents = FindEvents(metPdata, metQdata, winP, winQ);

% Detect Off Events
disp('Looking for Off events in H4');
metPdata = MetricP_all_off_H3_4;
metQdata = MetricQ_all_off_H3_4;

offEvents = FindEvents(metPdata, metQdata, winP, winQ);

%  Combine On/Off
eventsH3_4 = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{i}{j}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            eventsH3_4{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end

save('events_H3.mat', 'eventsH3_1','eventsH3_2','eventsH3_3','eventsH3_4');

%%  Visualize Combined On Off results to verify
% 
% metPdata = MetricP_all_on_H3_1;
% metQdata = MetricQ_all_on_H3_1;
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
% metPdata = MetricP_all_off_H3_1;
% metQdata = MetricQ_all_off_H3_1;
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
% metPdata = MetricP_all_on_H3_1;
% metQdata = MetricQ_all_on_H3_1;
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

