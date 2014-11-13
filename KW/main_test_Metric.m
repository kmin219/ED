clc;clear all;close all;
startup()
path = pwd;
addpath(genpath(path));
% test_H2_1();
% test_H2_2();
% test_H2_3();
% test_H2_4();
% 
% test_H3_1();
% test_H3_2();
% test_H3_3();
% test_H3_4();


% test_H1_1();
% test_H1_2();
% test_H1_3();
% test_H1_4();

tic
test_H4_1();
test_H4_2();
test_H4_3();
test_H4_4();
toc

