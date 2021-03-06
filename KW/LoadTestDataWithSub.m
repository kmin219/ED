%% Clear workspace
clear; clc;
%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = '..\H3';
%Find all .mat files starting with Tagged_* or Testing_*
%% For running in KW's PC
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));
DATA_DIR_PATH = 'D:\Belkin\Data\Belkin\H3';
%%
%DATA_FILE_FILTER = 'Tagged\w*.mat';  % Training Files
DATA_FILE_FILTER = 'Testing\w*.mat';  % Testing Files

%% Step 2: Get all file names under the specified folder & subfolders with regex filter	
fileList = getAllFiles(DATA_DIR_PATH, DATA_FILE_FILTER);
fprintf(1,'Found %d files matching %s at %s\n', size(fileList,2), DATA_FILE_FILTER, DATA_DIR_PATH);
for i = 1:size(fileList,2)
    [~,fname,~] = fileparts(fileList{i});
    fprintf(1,'%d. %s\n', i, fname);
end
%%
tableSub = readtable('SampleSubmission.csv');
% unixH1= tableSub.TimeStamp(find(strcmp(tableSub.House,'H1') & tableSub.Appliance == 1 ));
% unixH2= tableSub.TimeStamp(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == 1 ));
unixH3= tableSub.TimeStamp(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == 1 ));
% unixH4= tableSub.TimeStamp(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == 1 ));

% unixH1_1 = unixH1(1:442);
% unixH1_2 = unixH1(443:884);
% unixH1_3 = unixH1(885:1325);
% unixH1_4 = unixH1(1326:length(unixH1));
% 
% unixH2_1 = unixH2(1:438);
% unixH2_2 = unixH2(439:921);
% unixH2_3 = unixH2(922:1399);
% unixH2_4 = unixH2(1400:length(unixH2));

unixSubH3{2} = [min(unixH3(1:284)) max(unixH3(1:284))];
unixSubH3{3} = [min(unixH3(285:654)) max(unixH3(285:654))];
unixSubH3{4} = [min(unixH3(655:1016)) max(unixH3(655:1016))];
unixSubH3{1} = [min(unixH3(1017:length(unixH3))) max(unixH3(1017:length(unixH3)))];

% unixH4_1 = unixH4(1:309);
% unixH4_2 = unixH4(310:644);
% unixH4_3 = unixH4(645:length(unixH4));

%% Step 3: Load Data File
for j = 1:size(fileList,2)
% Load one of training files, in partuclar the first.
fname = fileList{j}; % ***** Note: We are only loading one of the files. This should be put in a loop as needed **
clear Buffer;

fprintf(1, 'Loading file: %s\n', fname);
load(fname);
fprintf(1, 'Done loading file.\n');
%%
% For each of 2 phases in a home, compute real, reactive and apparent power from 60Hz and it's harmonic
% content. Also computes power factor. Total power in a home is sum of real
% power on both phases.
ProcessedData = Belkin_ProcessRawData(Buffer);

% Clear Buffer as we will not be using harmonic content for now.
% If you see fit, additional features, such as harmonics etc. can be
% computed from the raw Buffer.
clear Buffer;

%% Step 4: Plot data
% Plot all available data in file. The second argument controls if the
% labels are plotted.
figure (j)
Belkin_PlotDatatest_Sub(ProcessedData, true, unixSubH3{j});

end

