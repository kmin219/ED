%% Clear workspace
clear all; clc;
%% m.file locations
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));

%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = fullfile(path,'/Data/Belkin/H2');
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
stop_TS = max_ts+100;

start_idx_L1 = min(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(start_TS) ));  %% start tagging index
stop_idx_L1 = max(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(stop_TS) ));   %% end tagging index

%% Event Detection %%
Window_Size = 20;  %% Window Size in Event Detector
Window_Shift = 1;   %% Window Shift in Event Detector
Window_Dist = 30;
power_thres = 20;


featP_L1 = ProcessedData.L1_Real(start_idx_L1:stop_idx_L1);  % truncate
[featP_EventA_L1, featP_scanA_L1] = fdetect_power_twoWindows(featP_L1,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing

featQ_L1 = ProcessedData.L1_Imag(start_idx_L1:stop_idx_L1);  % truncate
[featQ_EventA_L1, featQ_scanA_L1] = fdetect_power_twoWindows(featQ_L1,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing


featP_L2 = ProcessedData.L2_Real(start_idx_L1:stop_idx_L1);  % truncate
[featP_EventA_L2, featP_scanA_L2] = fdetect_power_twoWindows(featP_L2,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing

featQ_L2 = ProcessedData.L2_Imag(start_idx_L1:stop_idx_L1);  % truncate
[featQ_EventA_L2, featQ_scanA_L2] = fdetect_power_twoWindows(featQ_L2,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing



xmarkers1_L1 = featP_EventA_L1(:,1);   % Where the events are detected in time difference domain
xmarkers2_L1 = (xmarkers1_L1-1).*Window_Shift+Window_Size*2+Window_Dist;   % Where the events are detected in time domain
ymarkers1_L1 = featP_EventA_L1(:,2);   % Power consumption

xmarkers1_L2 = featP_EventA_L2(:,1);   % Where the events are detected in time difference domain
xmarkers2_L2 = (xmarkers1_L2-1).*Window_Shift+Window_Size*2+Window_Dist;   % Where the events are detected in time domain
ymarkers1_L2 = featP_EventA_L2(:,2);   % Power consumption
%%  All Windows Extraction - Phase 1
tag = 0;
count = 1;
Windows_All_L1(:,1) = xmarkers1_L1;
Windows_All_L1(:,2) = ymarkers1_L1;
Windows_All_L1(1,3) = count;
for j = [2:length(ymarkers1_L1)]
    if (xmarkers1_L1(j) - xmarkers1_L1(j-1) > 1)   % if the sign changes
        count = count + 1;  % sign count
        tag = sign(ymarkers1_L1(j));
    end
    Windows_All_L1(j,3) = count;
end

%%  All Windows Extraction - Phase 2
tag = 0;
count = 1;
Windows_All_L2(:,1) = xmarkers1_L2;
Windows_All_L2(:,2) = ymarkers1_L2;
Windows_All_L2(1,3) = count;
for j = [2:length(ymarkers1_L2)]
    if (xmarkers1_L2(j) - xmarkers1_L2(j-1) > 1)   % if the sign changes
        count = count + 1;  % sign count
        tag = sign(ymarkers1_L2(j));
    end
    Windows_All_L2(j,3) = count;
end

%% Plotting - Phase 1 
ts_start = (cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,3)));  %% starting Unix Time Stamp for each Event
ts_end = (cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,4)));  %% ending Unix Time Stamp for each Event
for i = 1:length(ts_start)
TS_start = ts_start(i);  % First Unix Time Stamp of each Event
TS_end = ts_end(i);  % First Unix Time Stamp of each Event
start_idx(i) = min(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(TS_start) ));  % First sample Index of each Event
end_idx(i) = max(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(TS_end) ));  % First sample Index of each Event
end
end_idx = end_idx - start_idx(1) + 1;   % truncate the waveform
start_idx = start_idx - start_idx(1) + 1;   % truncate the waveform
% start_idx = start_idx - start_idx_L1 + 1;   % same code

figure();
n = [1:length(featP_L1)];
ax(1) = subplot(211);plot(n, featP_L1(n), 'r'); hold on;grid;
for i=1:length(ts_start)
    line([start_idx(i),start_idx(i)],[0,100],'Color','g','LineWidth',2);
    %We add a little offset for display purposes to end marker since event could be +- 30
    %seconds of the timestamp.
    offset = 0;
    line([end_idx(i),end_idx(i)],[0,100],'Color','r', 'LineWidth',2);    
    text(double(start_idx(i)),100,['ON-' ProcessedData.TaggingInfo{i, 2}] );
    text(double(end_idx(i)),100,['OFF'] );
end
hold off;
ax(2) = subplot(212);plot(n, featP_L1(n), xmarkers2_L1,ymarkers1_L1,'r*');grid;
for i = [1:max(Windows_All_L1(:,3))]
    x_temp = min(find(Windows_All_L1(:,3)==i));
    text((Windows_All_L1(x_temp,1)-1).*Window_Shift+Window_Size*2+Window_Dist, Windows_All_L1(x_temp,2), num2str(Windows_All_L1(x_temp,3)));
end

title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

%% Plotting - Phase 2 
figure();
n = [1:length(featP_L2)];
ax(1) = subplot(211);plot(n, featP_L2(n), 'r'); hold on;grid;
for i=1:length(ts_start)
    line([start_idx(i),start_idx(i)],[0,100],'Color','g','LineWidth',2);
    %We add a little offset for display purposes to end marker since event could be +- 30
    %seconds of the timestamp.
    offset = 0;
    line([end_idx(i),end_idx(i)],[0,100],'Color','r', 'LineWidth',2);    
    text(double(start_idx(i)),100,['ON-' ProcessedData.TaggingInfo{i, 2}] );
    text(double(end_idx(i)),100,['OFF'] );
end
hold off;
ax(2) = subplot(212);plot(n, featP_L2(n), xmarkers2_L2,ymarkers1_L2,'r*');grid;
for i = [1:max(Windows_All_L2(:,3))]
    x_temp = min(find(Windows_All_L2(:,3)==i));
    text((Windows_All_L2(x_temp,1)-1).*Window_Shift+Window_Size*2+Window_Dist, Windows_All_L2(x_temp,2), num2str(Windows_All_L2(x_temp,3)));
end
% for i = [1: floor(length(featP_L2)/50)]
%     line([i*50 i*50], [0 max(featP_L2)]);
% end

title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

%% Plot tagging info in plot versus samples - all Phases
figure()
plot(n, featP_L1(n), xmarkers2_L1,ymarkers1_L1,'r*'); hold on;
plot(n, featP_L2(n), xmarkers2_L2,ymarkers1_L2,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');

for i=1:length(ts_start)
    line([start_idx(i),start_idx(i)],[0,100],'Color','g','LineWidth',2);
    %We add a little offset for display purposes to end marker since event could be +- 30
    %seconds of the timestamp.
    offset = 0;
    line([end_idx(i),end_idx(i)],[0,100],'Color','r', 'LineWidth',2);    
    text(double(start_idx(i)),100,['ON-' ProcessedData.TaggingInfo{i, 2}] );
    text(double(end_idx(i)),100,['OFF'] );
end


hold off;
    