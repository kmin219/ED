%% Clear workspace
clear all; clc;
%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = 'D:\Belkin\H3\H3';
%Find all .mat files starting with Tagged_* or Testing_*

DATA_FILE_FILTER = 'Tagged\w*.mat';  % Training Files
% DATA_FILE_FILTER = 'Testing\w*.mat';  % Testing Files

%% Step 2: Get all file names under the specified folder & subfolders with regex filter	
fileList = getAllFiles(DATA_DIR_PATH, DATA_FILE_FILTER);
fprintf(1,'Found %d files matching %s at %s\n', size(fileList,2), DATA_FILE_FILTER, DATA_DIR_PATH);
for i = 1:size(fileList,2)
    [~,fname,~] = fileparts(fileList{i});
    fprintf(1,'%d. %s\n', i, fname);
end
%% Step 3: Load Data File
% Load one of training files, in partuclar the first.
fname = fileList{1}; % ***** Note: We are only loading one of the files. This should be put in a loop as needed **
clear Buffer;

fprintf(1, 'Loading file: %s\n', fname);
load(fname);
fprintf(1, 'Done loading file.\n');

ProcessedData = Belkin_ProcessRawData(Buffer);

SNames = fieldnames(ProcessedData); 

%% Truncate the training data
min_ts = min(cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,3)));  %% unix time stamp
max_ts = max(cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,4)));  %% unix time stamp

start_TS = min_ts;
stop_TS = max_ts;

start_idx_L1 = min(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(start_TS) ));  %% start tagging index
stop_idx_L1 = max(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(stop_TS) ));   %% end tagging index

%% Event Detection %%
temp = ProcessedData.L1_Real(start_idx_L1:stop_idx_L1);  % truncate to temp
[power_EventA, power_scanA] = fdetect_power_twoWindows(temp);  % the x-axis of the returned signal is where the first window is in smoothing


%% Plotting
% plot using unix time stamp
% plot(ProcessedData.L1_TimeTicks(start_idx_L1:stop_idx_L1), ProcessedData.L1_Real(start_idx_L1:stop_idx_L1));

figure ()
Plot_Single(1,ProcessedData, true, min_ts, max_ts);   %% plot real power

Window_Size = 30;
Window_Shift = 1;

xmarkers1 = power_EventA(:,1);   % Where the events are detected in time difference domain
xmarkers2 = (xmarkers1-1).*Window_Shift+Window_Size;   % Where the events are detected in time domain
ymarkers1 = power_EventA(:,2);   % Power consumption

figure();
n = [1:length(temp)];
ax(1) = subplot(211);plot(n, temp(n), 'r'); 
ax(2) = subplot(212);plot(n, temp(n), xmarkers2,ymarkers1,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

%%  Window Extraction
ts = (cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,3)));  %% starting Unix Time Stamp for each Event

for i = 1:length(ts)
TS = ts(i);  % First Unix Time Stamp of each Event
start_idx(i) = min(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(TS) ));  % First sample Index of each Event
end
start_idx = start_idx - start_idx(1) + 1;   % truncate the waveform
% start_idx = start_idx - start_idx_L1 + 1;   % same code
 
index = zeros(1,length(power_scanA));
index(xmarkers1) = ymarkers1;

clear event;
count_event = 0;
tag_event = 0;
tag = 1;
for i = [1:length(index)]
    if (index(i) ~= 0 && index(i)>0)
        if(sign(index(i)) ~= sign(index(tag)))
            tag_event = tag_event + 1;
            tag = i;
            count_event = count_event + 1;
            event(count_event,1) = i;
            event(count_event,3) = tag_event;
        else
            count_event = count_event + 1;
            event(count_event,1) = i;
            event(count_event,3) = tag_event;
        end
    elseif (index(i) ~= 0 && index(i)<0)
        if(sign(index(i)) ~= sign(index(tag)))
            tag_event = tag_event + 1;
            tag = i;
            count_event = count_event + 1;
            event(count_event,2) = i;
            event(count_event,3) = tag_event;
        else
            count_event = count_event + 1;
            event(count_event,2) = i;
            event(count_event,3) = tag_event;
        end
    end
end


for i = [1:2:max(event(:,3))]
    n = find(event(:,3)==i);
    index_event((i+1)/2,1) = min(n);
    index_event((i+1)/2,2) = max(n);
end


%% Window Post-Process
Bedroom_2_Lights_on = [2 3 4 5];
Bonus_Room_Lights_on = [6 7 8 9];
Computer_on = [10 12 13 14];

% for k = [1:3]
    for i = [1:length(Bedroom_2_Lights_on)]
        truncate = event(index_event(Bedroom_2_Lights_on(i),1)):event(index_event(Bedroom_2_Lights_on(i),2));
        Window_on{i} = power_scanA(truncate);
    end
% end





