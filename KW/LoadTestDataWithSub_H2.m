%% Clear workspace
clear; clc;
%% Step 1: Location and Filter for Dataset
DATA_DIR_PATH = '..\H2';
%Find all .mat files starting with Tagged_* or Testing_*
%% For running in KW's PC
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));
DATA_DIR_PATH = 'D:\Belkin\Data\Belkin\H2';
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
unixH2= tableSub.TimeStamp(find(strcmp(tableSub.House,'H2') & tableSub.Appliance == 1 ));
% unixH3= tableSub.TimeStamp(find(strcmp(tableSub.House,'H3') & tableSub.Appliance == 1 ));
% unixH4= tableSub.TimeStamp(find(strcmp(tableSub.House,'H4') & tableSub.Appliance == 1 ));

% unixSubH1{1} = [min(unixH1(1:442)) max(unixH1(1:442)];
% unixSubH1{2} = [min(unixH1(443:884)) max(unixH1(443:884)];
% unixSubH1{3} = [min(unixH1(885:1325)) max(unixH1(885:1325)];
% unixSubH1{4} = [min(unixH1(1326:length(unixH1))) max(unixH1(1326:length(unixH1))];

unixSubH2{1} = [min(unixH2(1:438)) max(unixH2(1:438))];
unixSubH2{2} = [min(unixH2(439:921)) max(unixH2(439:921))];
unixSubH2{3} = [min(unixH2(922:1399)) max(unixH2(922:1399))];
unixSubH2{4} = [min(unixH2(1400:length(unixH2))) max(unixH2(1400:length(unixH2)))];

% unixSubH3{2} = [min(unixH3(1:284)) max(unixH3(1:284))];
% unixSubH3{3} = [min(unixH3(285:654)) max(unixH3(285:654))];
% unixSubH3{4} = [min(unixH3(655:1016)) max(unixH3(655:1016))];
% unixSubH3{1} = [min(unixH3(1017:length(unixH3))) max(unixH3(1017:length(unixH3)))];

% unixSubH4{1} = [min(unixH4(1:309)) max(unixH4(1:309))];
% unixSubH4{2} = [min(unixH4(310:644)) max(unixH4(310:644))];
% unixSubH4{3} = [min(unixH4(645:length(unixH4))) max(unixH4(645:length(unixH4)))];

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
Belkin_PlotDatatest_Sub(ProcessedData, true, unixSubH2{j});

end

