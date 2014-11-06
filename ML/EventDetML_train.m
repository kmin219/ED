%% Clear workspace
clear all; clc; close all;
%% Step 1: Location and Filter for Dataset
home = 'H3';
path  = '/Users/Min/Documents/College Files/Projects/EnergyDisag';

addpath(genpath(path));

DATA_DIR_PATH = strcat('/Users/Min/Documents/College Files/Projects/EnergyDisag/RawData/', home);
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

% For each of 2 phases in a home, compute real, reactive and apparent power from 60Hz and it's harmonic
% content. Also computes power factor. Total power in a home is sum of real
% power on both phases.
ProcessedData = Belkin_ProcessRawData(Buffer);

SNames = fieldnames(ProcessedData); 

%% Truncate the training data
min_ts = min(cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,3)));  %% unix time stamp
max_ts = max(cellfun(@(x)x(1), ProcessedData.TaggingInfo(:,4)));  %% unix time stamp

start_TS = min_ts;
stop_TS = max_ts;

start_idx_L1 = min(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(start_TS) ));
stop_idx_L1 = max(find(int64(ProcessedData.L1_TimeTicks(:,1)) == int64(stop_TS) ));

%% Event Detection %%
temp{1} = ProcessedData.L1_Real(start_idx_L1:stop_idx_L1);
temp{2} = ProcessedData.L2_Real(start_idx_L1:stop_idx_L1);
temp{3} = ProcessedData.L1_Imag(start_idx_L1:stop_idx_L1);
temp{4} = ProcessedData.L2_Imag(start_idx_L1:stop_idx_L1);
for i = 1:4
    
    [winDif{i}] = fdetect_power_twoWindows_ML(temp{i});
    winDifpos{i} = find(winDif{i}(:,2) > 0);
    winDifneg{i} = find(winDif{i}(:,2) < 0);
    figure()
    scatter(winDif{i}(winDifpos{i},1),winDif{i}(winDifpos{i},2));
    hold on
    scatter(winDif{i}(winDifneg{i},1),winDif{i}(winDifneg{i},2));
    plot(temp{i})
    hold off
    
    count = 0;
    % count each event and label in column 5 of winDif
    for j = 1 : length(winDif{i})

        if winDif{i}(j,2) ~= 0 && winDif{i}(j-1,2) == 0
            count = count + 1;
        end

        if abs(winDif{i}(j,2)) ~= 0  
            winDif{i}(j,5) = count;
        else
            winDif{i}(j,5) = 0;
        end
    end
    numEvents = max(winDif{i}(:,5));
    disp(strcat(num2str(numEvents), ' Events Detected'));
    
    for k = 1:max(winDif{i}(:,5))
    eventWin{i}{k} = winDif{i}(find(winDif{i}(:,5) == k),2);
    end
   
    figure
    plot(winDif{i}(:,6));
    hold on
    plot(winDif{i}(:,2));
    
% create feature matrix
    ftrMatrix{i}(:,9) = winDif{i}(:,2);

% to shift, just NAN pad and truncate
for k = 1:8
    shift = k;
    
    shiftDwn = padarray(winDif{i}(:,2),[k 0], nan, 'pre');
    ftrMatrix{i}(:,9-k) = shiftDwn(1:length(winDif{i}(:,2)));
    
    shiftUp = padarray(winDif{i}(:,2),[k 0], nan, 'post');
    ftrMatrix{i}(:,9+k) = shiftUp(1+k:length(shiftUp));
    
end


% figure
% maxrow = find(ftrMatrix{i}(:,9) == max(ftrMatrix{i}(:,9)));
% plot(ftrMatrix{i}(maxrow,:));
    
    
%     figure();
%     plot(eventWin{1}{3},'o');
%     hold on
%     plot(eventWin{1}{5},'o');
%     plot(eventWin{1}{7},'o');
%     plot(eventWin{1}{9}(1:length(eventWin{1}{7})),'o');
%     
%     avgWin = (eventWin{1}{7}+eventWin{1}{7}+eventWin{1}{7}+eventWin{1}{7})/4;
%     
%     plot(avgWin)
end




%% Label ON and OFF events
% run KWM code before to genrate variable eventON 

figure
plot(temp{1})
hold on
plot(MetricP)
stem(eventON)

%% add event on to ftr matrix and save as .mat file

ftrMatrix{1}(:,18) = eventON;
testMatrix = ftrMatrix{1};
cd(path)
save('testFtrMatrix', 'testMatrix')




% scatter(A(Apos,1),A(Apos,2));
% hold on 
% [pks,locs] = findpeaks(A(Apos,2),A(Apos,1),'MinPeakWidth' ,7);
% 
% text(locs+.02,pks,num2str((1:numel(pks))'));

% plot using unix time stamp

% Window_Size = 30;
% Window_Shift = 1;
% 
% xmarkers1 = A(:,1);
% xmarkers2 = (xmarkers1-1).*Window_Shift+Window_Size;
% ymarkers1 = A(:,2);
% 
% figure();
% n = [1:length(temp)];
% ax(1) = subplot(211);plot(n, temp(n), 'r');
% title(strcat(home,': Real Power (W) and ON/OFF Device Category IDs'));
% ax(2) = subplot(212);plot(n, temp(n), xmarkers2,ymarkers1,'r*');
% title('Real Power (W) and ON/OFF Device Category IDs');
% linkaxes(ax, 'x');
% hold on
% ha = area([500 1000],[2500 2500]);
% hb = area([500 1000],[-2500 -2500]);


