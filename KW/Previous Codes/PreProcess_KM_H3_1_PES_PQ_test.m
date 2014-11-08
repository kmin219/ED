%% Clear workspace
clear all; clc;
%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = 'C:\Users\Kyungwoo.ECE-Santoso2\Documents\GitHub\ED\Data\Belkin\H2';
%Find all .mat files starting with Tagged_* or Testing_*

DATA_FILE_FILTER = 'Tagged\w*.mat';  % Training Files
% DATA_FILE_FILTER = 'Testing\w*.mat';  % Testing Files

%% Step 2: Get all file names under the specified folder & subfolders with regex filter	
fileList = getAllFiles('C:\Users\Kyungwoo.ECE-Santoso2\Documents\GitHub\ED\Data\Belkin\H2', 'Testing\w*.mat');
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
%%
% For each of 2 phases in a home, compute real, reactive and apparent power from 60Hz and it's harmonic
% content. Also computes power factor. Total power in a home is sum of real
% power on both phases.
ProcessedData = Belkin_ProcessRawData(Buffer);

SNames = fieldnames(ProcessedData); 



%% Event Detection %%
featP = ProcessedData.L1_Real;  % truncate to temp
[featP_EventA, featP_scanA] = fdetect_power_twoWindows(featP);  % the x-axis of the returned signal is where the first window is in smoothing

featQ = ProcessedData.L1_Imag;  % truncate to temp
[featQ_EventA, featQ_scanA] = fdetect_power_twoWindows(featQ);  % the x-axis of the returned signal is where the first window is in smoothing

%% plot using unix time stamp
% plot(ProcessedData.L1_TimeTicks(start_idx_L1:stop_idx_L1), ProcessedData.L1_Real(start_idx_L1:stop_idx_L1));
Window_Size = 30;
Window_Shift = 1;

xmarkers1 = featP_EventA(:,1);  % Index above the threshold
xmarkers2 = (xmarkers1-1).*Window_Shift+Window_Size;
ymarkers1 = featP_EventA(:,2);   % Power value above the threshold

figure();
n = [1:length(featP)];
ax(1) = subplot(211);plot(n, featP(n), 'r');
ax(2) = subplot(212);plot(n, featP(n), xmarkers2,ymarkers1,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');
linkaxes(ax, 'x');


%% Test
load P.mat
load Q.mat

N = length(Window_testP);
k = 1;
while(k+N-1 < length(featP_scanA))
    sample = featP_scanA(k:k+N-1);
    Dist = sqrt(sum((sample - Window_testP).^2));
    MetricP(k) = Dist;
    k = k+1;
end

k = 1;
while(k+N-1 < length(featQ_scanA))
    sample = featQ_scanA(k:k+N-1);
    Dist = sqrt(sum((sample - Window_testQ).^2));
    MetricQ(k) = Dist;
    k = k+1;
end
n = 1:length(MetricP);
figure()
MetricP_Plot = MetricP;
MetricP_Plot(MetricP>300) = 300;
MetricQ_Plot = MetricQ;
MetricQ_Plot(MetricQ>30) = 30;
ax(1) = subplot(211);plot(n,MetricP_Plot);
ax(2) = subplot(212);plot(n,MetricQ_Plot);
linkaxes(ax, 'x', 'y');

