%% Clear workspace
clear all; clc; close all;
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
featP = ProcessedData.L1_Real(start_idx_L1:stop_idx_L1);  % truncate to temp
[featP_EventA, featP_scanA] = fdetect_power_twoWindows(featP);  % the x-axis of the returned signal is where the first window is in smoothing

featQ = ProcessedData.L1_Imag(start_idx_L1:stop_idx_L1);  % truncate to temp
[featQ_EventA, featQ_scanA] = fdetect_power_twoWindows(featQ);  % the x-axis of the returned signal is where the first window is in smoothing
%% Plotting
% plot using unix time stamp
% plot(ProcessedData.L1_TimeTicks(start_idx_L1:stop_idx_L1), ProcessedData.L1_Real(start_idx_L1:stop_idx_L1));

figure ()
Plot_Single(1,ProcessedData, true, min_ts, max_ts);   %% plot real power

Window_Size = 30;  %% Window Size in Event Detector
Window_Shift = 1;   %% Window Shift in Event Detector

xmarkers1 = featP_EventA(:,1);   % Where the events are detected in time difference domain
xmarkers2 = (xmarkers1-1).*Window_Shift+Window_Size*3;   % Where the events are detected in time domain
ymarkers1 = featP_EventA(:,2);   % Power consumption

figure();
n = [1:length(featP)];
ax(1) = subplot(211);plot(n, featP(n), 'r'); 
ax(2) = subplot(212);plot(n, featP(n), xmarkers2,ymarkers1,'r*');
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
 
index = zeros(1,length(featP_scanA));
index(xmarkers1) = ymarkers1;

tag = sign(ymarkers1(1));
Window_On = [];
Window_Off = [];
count = 0;
index_On_Start = xmarkers1(1);
index_Off_Start = 1;
xmarkers1_2 = [xmarkers1' 0];  % dummy variable added at the end to run below code
ymarkers1_2 = [ymarkers1' -ymarkers1(end)];  % dummy variable added at the end to run below code
event_count = 1;
for j = [1:length(ymarkers1_2)]
    if (sign(ymarkers1_2(j)) ~= tag)   % if the sign changes
        tag = sign(ymarkers1_2(j));
        count = count + 1;  % sign count
        if(count == 1)  % if sign changed one time
            index_On_End = xmarkers1_2(j-1);  % End On-Index
            Window_P_On = featP_scanA(index_On_Start:index_On_End);  % Extract On-window
            Window_Q_On = featQ_scanA(index_On_Start:index_On_End);  % Extract On-window
            index_Off_Start = xmarkers1_2(j);  % Start Off-index
        elseif(count == 2)  % if sign changed two times, report
            index_OFF_End = xmarkers1_2(j-1);   % End Off-Index
            Window_P_Off = featP_scanA(index_Off_Start:index_OFF_End);   % Extract Off-Window
            Window_Q_Off = featQ_scanA(index_Off_Start:index_OFF_End);   % Extract Off-Window
            index_On_Start = xmarkers1_2(j);  % Start On-index
            count = 0;

            Windows_P{event_count}{1}= Window_P_On;  %% Sag
            Windows_P{event_count}{2} = Window_P_Off;  %% Sag
            Windows_Q{event_count}{1}= Window_Q_On;  %% Sag
            Windows_Q{event_count}{2} = Window_Q_Off;  %% Sag
            event_count = event_count + 1;
        end
    end
end

%% Window Post-Process
Bedroom_2_Lights = [2 3 4 5];
Bonus_Room_Lights = [6 7 8 9];
Computer = [10 12 13 14];

W_Bedroom_2_Lights_P = Windows_P(Bedroom_2_Lights);
W_Bedroom_2_Lights_Q = Windows_Q(Bedroom_2_Lights);
W_Bonus_Room_Lights = Windows_P(Bonus_Room_Lights);
W_Computer = Windows_P(Computer);


%% Training Error
Window_testP = W_Bedroom_2_Lights_P{1}{1}; % On
Window_testQ = W_Bedroom_2_Lights_Q{1}{1}; % On

N = length(Window_testP);

% Euclidean Distance Based
k = 1;
while(k+N-1 < length(featP_scanA))
    sample = featP_scanA(k:k+N-1);
    Dist = sqrt(sum((sample - Window_testP).^2));
    MetricP(k) = Dist;
    k = k+1;
end

% Euclidean Distance Based
k = 1;
while(k+N-1 < length(featQ_scanA))
    sample = featQ_scanA(k:k+N-1);
    Dist = sqrt(sum((sample - Window_testQ).^2));
    MetricQ(k) = Dist;
    k = k+1;
end

% Correlation Based
% k = 1;
% while(k+N-1 < length(featP_scanA))
%     sample = featP_scanA(k:k+N-1);
%     Temp = corrcoef(sample,Window_testP);
%     Dist = Temp(1,2);
%     MetricCor(k) = Dist;
%     k = k+1;
% end


n = 1:length(MetricP);
figure()
ax(1) = subplot(211);plot(n,MetricP);
ax(2) = subplot(212);plot(n,MetricQ);
linkaxes(ax, 'x');


figure()
n1 = 1:length(featP);
n2 = 1:length(featP_scanA);
n3 = 1:length(MetricP);
ax(1) = subplot(311);plot(n1, featP(n1)); 
ax(2) = subplot(312);plot(n2, featP_scanA(n2));
ax(3) = subplot(313);plot(n3, MetricP(n3));
title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');


% k = find(MetricP == 0);
% sample = featP_scanA(k:k+N-1);
% Dist = sqrt(sum((sample - Window_testP).^2))


% figure()
% plot(W_Computer{1}{1})
% figure()
% plot(W_Computer{2}{1})
% figure()
% plot(W_Computer{3}{1})


figure();
n = [1:length(featP)];
n2 = [1:length(featP_scanA)];
ax(1) = subplot(211);plot(n, featP(n), 'r'); 
ax(2) = subplot(212);plot(n2, featP_scanA(n2), xmarkers1,ymarkers1,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

