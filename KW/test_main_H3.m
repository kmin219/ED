function [featP_scanA_L1, featQ_scanA_L1, featP_scanA_L2, featQ_scanA_L2, unixTime] = test_main_H3( fileTag )
%% Clear workspace
startup()
%% m.file locations
path = pwd;
addpath(genpath(path));

%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = fullfile(path,'/Data/Belkin/H3');
%Find all .mat files starting with Tagged_* or Testing_*

DATA_FILE_FILTER = 'Testing\w*.mat';  % Training Files
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
fname = fileList{fileTag}; % ***** Note: We are only loading one of the files. This should be put in a loop as needed **
clear Buffer;

fprintf(1, 'Loading file: %s\n', fname);
load(fname);
fprintf(1, 'Done loading file.\n');

ProcessedData = Belkin_ProcessRawData(Buffer);

SNames = fieldnames(ProcessedData); 

%% Event Detection %%
Window_Size = 20;  %% Window Size in Event Detector
Window_Shift = 1;   %% Window Shift in Event Detector
Window_Dist = 30;
power_thres = 20;


featP_L1 = ProcessedData.L1_Real;  % truncate
[featP_EventA_L1, featP_scanA_L1] = fdetect_power_twoWindows(featP_L1,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing

featQ_L1 = ProcessedData.L1_Imag;  % truncate
[featQ_EventA_L1, featQ_scanA_L1] = fdetect_power_twoWindows(featQ_L1,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing


featP_L2 = ProcessedData.L2_Real;  % truncate
[featP_EventA_L2, featP_scanA_L2] = fdetect_power_twoWindows(featP_L2,Window_Size,Window_Size,Window_Shift,Window_Dist,power_thres);  % the x-axis of the returned signal is where the first window is in smoothing

featQ_L2 = ProcessedData.L1_Imag;  % truncate
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

if(0)
%% Plotting - Phase 1 
figure();
n = [1:length(featP_L1)];
ax(1) = subplot(211);plot(n, featP_L1(n), 'r'); grid;
ax(2) = subplot(212);plot(n, featP_L1(n), xmarkers2_L1,ymarkers1_L1,'r*');grid;
title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

%% Plotting - Phase 2 
figure();
n = [1:length(featP_L2)];
ax(1) = subplot(211);plot(n, featP_L2(n), 'r'); grid;
ax(2) = subplot(212);plot(n, featP_L2(n), xmarkers2_L2,ymarkers1_L2,'r*');grid;
title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

%% Plot - all Phases
figure()
n = [1:length(featP_L1)];
plot(n, featP_L1(n), xmarkers2_L1,ymarkers1_L1,'r*'); hold on;
n = [1:length(featP_L2)];
plot(n, featP_L2(n), xmarkers2_L2,ymarkers1_L2,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');
hold off;
end
unixTime = ProcessedData.L1_TimeTicks;
end