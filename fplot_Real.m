figure ()
Plot_Single(1,ProcessedData, true, min_ts, max_ts);   %% plot real power

Window_Size = 30;  %% Window Size in Event Detector
Window_Shift = 1;   %% Window Shift in Event Detector

xmarkers1 = Real_EventA(:,1);   % Where the events are detected in time difference domain
xmarkers2 = (xmarkers1-1).*Window_Shift+Window_Size;   % Where the events are detected in time domain
ymarkers1 = Real_EventA(:,2);   % Power consumption

figure();
n = [1:length(Real)];
ax(1) = subplot(211);plot(n, Real(n), 'r'); 
ax(2) = subplot(212);plot(n, Real(n), xmarkers2,ymarkers1,'r*');
title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');