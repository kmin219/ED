clear all; close all;clc;

%% m.file locations
LoadDataML();
main_H4_1();
load H4idx.mat
labels = H4_1Labels
load window_P_H4_1
load window_Q_H4_1
window_P = window_P_H4_1; 
window_Q = window_Q_H4_1;
%%
% Euclidean Distance Based
% for i = [1:length(window_P)]
for i = 3
    if(~isempty(window_P{i}))
        disp(i)
        N = length(window_P{i}{1});  % P and Q windows are the same length
        k = 1;
        clear MetricP MetricQ
        while(k+N-1 < length(featP_scanA_L1))
            if(window_P{i}{3} == 1)
                sample = featP_scanA_L1(k:k+N-1);
                DistP = sqrt(sum((sample - window_P{i}{1}).^2));
                DistP = log(DistP);
%                 DistP = (sum((sample - window_P{i}{1}).^2));
                sample = featQ_scanA_L1(k:k+N-1);
                DistQ = sqrt(sum((sample - window_Q{i}{1}).^2));
                DistQ = log(DistQ);
%                 DistQ = (sum((sample - window_Q{i}{1}).^2));
            else
                sample = featP_scanA_L2(k:k+N-1);
                DistP = sqrt(sum((sample - window_P{i}{1}).^2));
                DistP = log(DistP);
%                 DistP = (sum((sample - window_P{i}{1}).^2));
                sample = featQ_scanA_L2(k:k+N-1);
                DistQ = sqrt(sum((sample - window_Q{i}{1}).^2));                
                DistQ = log(DistQ);
%                 DistQ = (sum((sample - window_Q{i}{1}).^2));                
            end
            MetricP(k) = DistP;
            MetricQ(k) = DistQ;
            k = k+1;
        end
        MetricP_all{i} = MetricP;
        MetricQ_all{i} = MetricQ;

        n = 1:length(MetricP);
        figure()
%         MetricP(find(MetricP>sqrt(sum(window_P{i}{1}.^2)))) = sqrt(sum(window_P{i}{1}.^2));
        MetricP(find(MetricP>log(sqrt(sum(window_P{i}{1}.^2))))) = log(sqrt(sum(window_P{i}{1}.^2)));
                
%         MetricQ(find(MetricQ>sqrt(sum(window_Q{i}{1}.^2)))) = sqrt(sum(window_Q{i}{1}.^2));
        MetricQ(find(MetricQ>log(sqrt(sum(window_Q{i}{1}.^2))))) = log(sqrt(sum(window_Q{i}{1}.^2)));

%         MetricP(find(MetricP>(sum(window_P{i}{1}.^2)))) = (sum(window_P{i}{1}.^2));
%         MetricQ(find(MetricQ>(sum(window_Q{i}{1}.^2)))) = (sum(window_Q{i}{1}.^2));

%         MetricP(find(MetricP>sqrt(sum(abs(window_P{i}{1}))))) = sqrt(sum(window_P{i}{1}.^2));
%         MetricQ(find(MetricQ>sqrt(sum(abs(window_Q{i}{1}))))) = sqrt(sum(window_Q{i}{1}.^2));
       
        featP_scanA_L1_2 = [zeros(1,70) featP_scanA_L1];
        MetricP_2 = [zeros(1,35+floor(length(window_P{i}{1})/2)) MetricP zeros(1,35+ceil(length(window_P{i}{1})/2))];
        
        featQ_scanA_L1_2 = [zeros(1,70) featQ_scanA_L1];
        MetricQ_2 = [zeros(1,35+floor(length(window_Q{i}{1})/2)) MetricQ zeros(1,35+ceil(length(window_Q{i}{1})/2))];        

%%
left= 0.15;
bottom1=0.82;
bottom2=0.64;
bottom3=0.46;
bottom4=0.28;
bottom5=0.10;
width=0.8;
height=0.15;

n = [1:length(featP_L1)];
ax(1) = subplot(511);
plot(n,featP_L1);
set(gca, 'Position',[left bottom1 width height]);
ylabel('Real (W)');
set(gca, 'XTickLabel', [],'XTick',[])

ax(2) = subplot(512);
plot(n,MetricP_2, 'r-o');
set(gca,'Position',[left bottom2 width height])
ylabel('Distance');
set(gca, 'XTickLabel', [],'XTick',[])

ax(3) = subplot(513);
set(gca, 'Position',[left bottom3 width height]);
plot(n,featQ_L1);
ylabel('Reactive (var)');
set(gca, 'XTickLabel', [],'XTick',[])


ax(4) = subplot(514);plot(n,MetricQ_2, 'r-o');
set(gca,'Position',[left bottom4 width height])
ylabel('Distance');
set(gca, 'XTickLabel', [],'XTick',[])

threshP = H4_1(i,15);
threshQ = H4_1(i,16);
output = DetEvents(MetricP, MetricQ, threshP, threshQ);
output2 = [zeros(1,35+floor(length(window_Q{i}{1})/2)) output zeros(1,35+ceil(length(window_Q{i}{1})/2))];        
ax(5) = subplot(515);stem(output2);       
set(gca,'Position',[left bottom5 width height])
xlabel('Samples');
ylabel(sprintf('Detected "%s"', char(labels(i,2))))
linkaxes(ax, 'x','y');
%%

%%
        pause;
    end
end


%%
figure();
n = [1:length(featP_L1)];
subplot(311);ax(1:2) = plotyy(n, featP_L1(n), n, featQ_L1(n)); hold on;grid;
for i=1:length(ts_start)
    line([start_idx(i),start_idx(i)],[0,100],'Color','g','LineWidth',2);
    %We add a little offset for display purposes to end marker since event could be +- 30
    %seconds of the timestamp.
    offset = 0;
    line([end_idx(i),end_idx(i)],[0,100],'Color','r', 'LineWidth',2);    
    text(double(start_idx(i)),100,['ON-' ProcessedData.TaggingInfo{i, 2}] );
    text(double(end_idx(i)),100,['OFF'] );
end
hold off;
xlabel('Unix Time Stamp');
ylabel(ax(1),'Real Power (W)')
ylabel(ax(2),'Reactive Power (var)')
    
ax(3) = subplot(312);
%plot(window_Q{i}{1});
%title(sprintf('Appliance Q Window: "%s"', char(labels(i,2))))

threshP = H4_1(i,15);
threshQ = H4_1(i,16);
output = DetEvents(MetricP, MetricQ, threshP, threshQ);
stem(output);
title(sprintf('Detected Events: "%s"', char(labels(i,2))))
linkaxes(ax, 'x')

title('Real Power (W) and ON/OFF Device Category IDs');
hline = refline([0 0]);
linkaxes(ax, 'x');

