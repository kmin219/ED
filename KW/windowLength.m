load winH1All

load window_P_H2_all
load window_Q_H2_all

load window_P_H3_all
load window_Q_H3_all

load winH4All

window_P = window_P_H4_all;
window_Q = window_Q_H4_all;
for i = [1:length(window_P)]  %% # of appliance IDs    
% for i = 18  %% # of appliance IDs    
    i
    for j = [1]
        window_app_P = window_P{i}{j};  % appliance 1 event 1
        window_app_Q = window_Q{i}{j};
        if(window_app_P{4})  %% If 'good' appliance
            
            Non = length(window_app_P{1})  % window length - turn on  (P and Q have same length)
            Noff = length(window_app_P{2})  % window length - turn off             
            figure()             
            subplot(411);plot(window_app_P{1});
    %         title(sprintf('Appliance P Window: "%s"', char(idx_H2_1(i,2))))
            subplot(412);plot(window_app_Q{1});
    %         title(sprintf('Appliance Q Window: "%s"', char(idx_H2_1(i,2))))
    %         pause;

%             figure()            
            subplot(413);plot(window_app_P{2});
    %         title(sprintf('Appliance P Window: "%s"', char(idx_H2_1(i,2))))
            subplot(414);plot(window_app_Q{2});
    %         title(sprintf('Appliance Q Window: "%s"', char(idx_H2_1(i,2))))
            pause;            
        end
    end
end