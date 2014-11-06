%% Clear workspace
% clear all; clc;
%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = 'D:\Belkin\H3\H3';
%Find all .mat files starting with Tagged_* or Testing_*

DATA_FILE_FILTER = 'Tagged\w*.mat';  % Training Files
% DATA_FILE_FILTER = 'Testing\w*.mat';  % Testing Files

%% Step 2: Get all file names under the specified folder & subfolders with regex filter	
fileList = getAllFiles('D:\Belkin\H3\H3', 'Testing\w*.mat');
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
temp = ProcessedData.L1_Real;
[power_EventA_test, power_scanA_test] = fdetect_power_twoWindows(temp);  % the x-axis of the returned signal is where the first window is in smoothing

%% plot using unix time stamp
% plot(ProcessedData.L1_TimeTicks(start_idx_L1:stop_idx_L1), ProcessedData.L1_Real(start_idx_L1:stop_idx_L1));
Window_Size = 30;
Window_Shift = 1;

xmarkers1 = power_EventA_test(:,1);  % Index above the threshold
xmarkers2 = (xmarkers1-1).*Window_Shift+Window_Size;
ymarkers1 = power_EventA_test(:,2);   % Power value above the threshold

figure();
n = [1:length(temp)];
ax(1) = subplot(211);plot(n, temp(n), 'r');
ax(2) = subplot(212);plot(n, temp(n), xmarkers2,ymarkers1,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');
linkaxes(ax, 'x');


%% Training Error
% Window_test1 = W_Bedroom_2_Lights{1}{1}; % On
% Window_test2 = W_Bedroom_2_Lights{1}{2}; % Off
% % Window_test2 = W_Bonus_Room_Lights{1}{1}; % On
% % Window_test3 = W_Computer{1}{1}; % On
% % Metric = [];
% 
% N = length(Window_test1);
% k = 1;
% while(k+N-1 < length(power_scanA_test))
%     sample = power_scanA_test(k:k+N-1);
%     Dist = sqrt(sum((sample - Window_test1).^2));
%     Metric{1}(k) = Dist;
%     k = k+1;
% end
% 
% N = length(Window_test2);
% k = 1;
% while(k+N-1 < length(power_scanA_test))
%     sample = power_scanA_test(k:k+N-1);
%     Dist = sqrt(sum((sample - Window_test2).^2));
%     Metric{2}(k) = Dist;
%     k = k+1;
% end
% 
% On = Metric{1};
% On(Metric{1}>200) = 200;
% Off = Metric{2};
% Off(Metric{2}>200) = 200;
% figure()
% n = 1:length(On);
% plot(n,On,n,Off)



% N = length(Window_test2);
% k = 1;
% while(k+N-1 < length(power_scanA_test))
%     sample = power_scanA_test(k:k+N-1);
%     Dist = sqrt(sum((sample - Window_test2).^2));
%     Metric{2}(k) = Dist;
%     k = k+1;
% end
% 
% N = length(Window_test3);
% k = 1;
% while(k+N-1 < length(power_scanA_test))
%     sample = power_scanA_test(k:k+N-1);
%     Dist = sqrt(sum((sample - Window_test3).^2));
%     Metric{3}(k) = Dist;
%     k = k+1;
% end


