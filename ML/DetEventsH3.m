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
load MetricQ_all_off_H3_1.mat
load MetricQ_all_off_H3_2.mat
load MetricQ_all_off_H3_3.mat
load MetricQ_all_off_H3_4.mat

%  Off Events: load distances in Q
load MetricP_all_off_H3_1.mat
load MetricP_all_off_H3_2.mat
load MetricP_all_off_H3_3.mat
load MetricP_all_off_H3_4.mat

%  Load Windows to get thresh
load window_P_H3_all
load window_Q_H3_all

%% Detect On Events
tic;

metPdata = MetricP_all_on_H3_1;
metQdata = MetricQ_all_on_H3_1;
winP = window_P_H3_all;
winQ = window_Q_H3_all;

numApp = length(metPdata);
onEvents = cell(1,numApp);

for i = 1:numApp                 % no. appliances in H3
    if(~isempty(metPdata{i}))    % neglect empty cells
        disp(i);
        
        for j = 1:length(metPdata{i}) % no. windows for app. i
            
            threshP = winP{i}{j}{5}+1;
            threshQ = winQ{i}{j}{6}+1;

            MetricP = metPdata{i}{j};
            MetricQ = metQdata{i}{j};

            onEvents{i}{j} = DetEvents(MetricP, MetricQ, threshP, threshQ);
            %figure()
            %stem(onEvents{i}{j});
           
            %pause;
        end
    end
end

toc;

%% Detect Off Events
tic;

metPdata = MetricP_all_off_H3_1;
metQdata = MetricQ_all_off_H3_1;
winP = window_P_H3_all;
winQ = window_Q_H3_all;

numApp = length(metPdata);
offEvents = cell(1,numApp);

for i = 1:numApp                 % no. appliances in H3
    if(~isempty(metPdata{i}))    % neglect empty cells
        disp(i);
        
        for j = 1:length(metPdata{i}) % no. windows for app. i
            
            threshP = winP{i}{j}{5}+1;
            threshQ = winQ{i}{j}{6}+1;

            MetricP = metPdata{i}{j};
            MetricQ = metQdata{i}{j};

            offEvents{i}{j} = DetEvents(MetricP, MetricQ, threshP, threshQ);
            %figure()
            %stem(onEvents{i}{j});
           
            %pause;
        end
    end
end

toc;

%% combine on off
events = onEvents;
for i = 1:length(onEvents);
    for j = 1:length(onEvents{i});
        if any(onEvents{i}{j})
            firstOn = min(find(onEvents{4}{1}>0));
            offEvents{i}{j}(1:firstOn) = 0;
            events{i}{j} = onEvents{i}{j}+offEvents{i}{j}*-1;
        end
    end
end


%%  Visualize Combined On Off results to verify

for i = 1:numApp
    disp(i)
    if(~isempty(events{i}))
        for j = 1:length(events{i})
            if any(events{i}{j})
            MetricP = metPdata{i}{j};
            MetricQ = metQdata{i}{j};
                
                figure()
                ax(1) = subplot(311);plot(MetricP);
                title(sprintf('MetricP for Appliance %i', i))
                ax(2) = subplot(312);plot(MetricQ);
                title(sprintf('MetricQ for Appliance %i', i))
                ax(3) = subplot(313);stem(events{i}{j});
                title(sprintf('ON Event for Window  %i', j))
                linkaxes(ax, 'x');

                pause; 
            end
        end
    end
end


