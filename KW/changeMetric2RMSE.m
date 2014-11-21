clc;clear all;close all;
%% m.file locations
path = pwd;
addpath(genpath(path));
path = 'D:\Belkin\';
addpath(genpath(path));

load window_P_H3_all
load window_Q_H3_all
s=what('D:\Belkin\Data\Metrics\H3'); %change dir for your directory name 
matfiles=s.mat;
for a=1:numel(matfiles)
    % a=1;
    Metric = load(char(matfiles(a)));
    SNames = fieldnames(Metric); 
    Metric = Metric.(SNames{1});
    for i = 1:length(Metric)
        for j = 1:length(Metric{i})
            if(strcmp(SNames{1}(7:15),'P_all_on'))
                Metric{i}{j} = Metric{i}{j} - 1/2*log(   length(window_P_H3_all{i}{j}{1}));  % P-On-window size
            elseif(strcmp(SNames{1}(7:15),'P_all_of'))
                Metric{i}{j} = Metric{i}{j} - 1/2*log(   length(window_P_H3_all{i}{j}{2}));  % P-Off-window size
            elseif(strcmp(SNames{1}(7:15),'Q_all_on'))
                Metric{i}{j} = Metric{i}{j} - 1/2*log(   length(window_Q_H3_all{i}{j}{1}));  % Q-On-window size
            elseif(strcmp(SNames{1}(7:15),'Q_all_of'))
                Metric{i}{j} = Metric{i}{j} - 1/2*log(   length(window_Q_H3_all{i}{j}{2}));  % Q-Off-window size
            end
        end
        save(strcat('RMSE_',char(matfiles(a))), 'Metric')
    end
    a
end