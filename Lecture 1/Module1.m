%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODULE 1 - ECON 722
% Elena Pesavento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear the workspace
clear all;
close all;
clc;

% Load the csv file as a time series object
data = readtable('GDP.csv');
data = table2timetable(data);
data


% Estimate a VAR model with 4 lags
mdl = varm(6,4);
EstMdl = estimate(mdl,data.Variables);

% Compute the impulse response functions
irf = irf(EstMdl,10);

% Plot the impulse response functions
figure;
for i = 1:6
    subplot(2,3,i)
    plot(irf(i))
    title(data.Properties.VariableNames{i})
end

% Save the results
save('results.mat','irf','EstMdl','data')




