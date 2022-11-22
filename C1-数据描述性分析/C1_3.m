%% C1.3 Sample Classification
% Author: Alephant
% Date: 22 Nov 2022
clc;
close all;
clear;


%% load data
% the first three are benign tumors
% the last five are malignant tumors
rawdata = [13.54,14.36,87.46,566.3,0.09779;
13.08,15.71,85.63,520,0.1075;
9.504,12.44,60.34,273.9,0.1024;
17.99,10.38,122.8,1001,0.1184;
20.57,17.77,132.9,1326,0.08474;
19.69,21.25,130,1203,0.1096;
11.42,20.38,77.58,386.1,0.1425;
20.29,14.34,135.1,1297,0.1003];

sample = [16.6,28.08,108.3,858.1,0.08455;
20.6,29.33,140.1,1265,0.1178;
7.76,24.54,47.92,181,0.05263];

%% distance
distances = dist(sample, rawdata');