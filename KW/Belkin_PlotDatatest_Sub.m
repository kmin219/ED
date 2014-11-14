function [figure_handle] = Belkin_PlotData_Sub(ProcessedData, hasLabels, unixSub)
% Belkin_PlotData   Plots various measurement in a single figure with
% linked axis for quickly looking at the data. Plot, real, reactive,
% apparent and power factor for each phase. Also plots the High Frequency
% Continuous EMI (HF).
% ProcessedData = input data structure that Belkin_ProcessRawData returns
% hasLabels = bool. True if TaggingInfo exists inside of ProcessedData
% that encodes device labels and ON/OFF timestamps. Set this TRUE for
% Training datasets as those come with labels/tagging information.
% Next two parameters are optional that indicate start and stop timestamps
% to limit the plot to data between those.
% Belkin_PlotData(ProcessedData, true, start_timestamp, stop_timestamp)
% Returns handle to the figure.


% Labels (TaggingInfo) part relevant only for Training Datasets 
% **************************************************************
% Plot the data on Phase 1 (L1) as blue and Phase 2 (L2) as red
% Plot Real Power(W) and labels. Green is ON and Red line is OFF, along with
% device category ID.
h(1) = subplot(211); 
plot(ProcessedData.L1_TimeTicks, ProcessedData.L1_Real); grid; hold on;
plot(ProcessedData.L2_TimeTicks, ProcessedData.L2_Real, 'r');
title('Real Power (W) and ON/OFF Device Category IDs');



% Draw ON/OFF and device labels. TaggingInfo's each row is:
% <ApplianceID, ApplianceName, Start_UNIX_TimeStamp, Stop_UNIX_TimeStamp>

line([unixSub(1),unixSub(1)],[0,10000],'Color','k','LineWidth',2);
%We add a little offset for display purposes to end marker since event could be +- 30
%seconds of the timestamp.
offset = 0;
line([unixSub(2) + offset,unixSub(2) + offset],[0,10000],'Color','k', 'LineWidth',2);    



% Plot Imaginary/Reactive power (VAR)
h(2) = subplot(212); plot(ProcessedData.L1_TimeTicks, ProcessedData.L1_Imag); grid; hold on;
plot(ProcessedData.L2_TimeTicks, ProcessedData.L2_Imag,'r'); hold off;

title('Imaginary/Reactive power (VAR)');
% Plot Power Factor
% h(3) = subplot(413); plot(ProcessedData.L1_TimeTicks, ProcessedData.L1_Pf); grid; hold on;
% plot(ProcessedData.L2_TimeTicks, ProcessedData.L2_Pf,'r');  hold off;
% title('Power Factor');
% xlabel('Unix Timestamp');

% Plot HF Noise
% freq = linspace(1000000,0,4096); % FFT is of size 4096 point across 1 Mhz
% h(4) = subplot(414);
% imagesc(ProcessedData.HF_TimeTicks, freq, ProcessedData.HF);
% title('High Frequency Noise');
% ylabel('Frequency KHz');
% axis xy;
% y = [0:200000:1e6];
% set(gca,'YTick',y);  % Apply the ticks to the current axes
% set(gca,'YTickLabel', arrayfun(@(v) sprintf('%dK',v/1000), y, 'UniformOutput', false) ); % Define the tick labels based on the user-defined format

linkaxes(h,'x');

figure_handle = h;

end
