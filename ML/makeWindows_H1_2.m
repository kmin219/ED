%% m.file locations

load('H1idx.mat');
H1_2_ID = cell2mat(H1_2Labels(:,1));


for i = [1:size(H1_2,1)]
    if(H1_2(i,1) == 1)
        on_start_idx = fgetindex(Windows_All_L1,H1_2(i,2),H1_2(i,3),H1_2(i,4));
        on_end_idx = fgetindex(Windows_All_L1,H1_2(i,5),H1_2(i,6),H1_2(i,7));
        window_P{i}{1} = featP_scanA_L1(on_start_idx:on_end_idx);  % on windows
        window_Q{i}{1} = featQ_scanA_L1(on_start_idx:on_end_idx);  % on windows

        off_start_idx = fgetindex(Windows_All_L1,H1_2(i,8),H1_2(i,9),H1_2(i,10));
        off_end_idx = fgetindex(Windows_All_L1,H1_2(i,11),H1_2(i,12),H1_2(i,13));
        window_P{i}{2} = featP_scanA_L1(off_start_idx:off_end_idx);  % off windows
        window_Q{i}{2} = featQ_scanA_L1(off_start_idx:off_end_idx);  % off windows
        
        window_P{i}{3} = 1;  % on windows
        window_Q{i}{3} = 1;  % on windows
    end
    
    if(H1_2(i,1) == 2)
        on_start_idx = fgetindex(Windows_All_L2,H1_2(i,2),H1_2(i,3),H1_2(i,4));
        on_end_idx = fgetindex(Windows_All_L2,H1_2(i,5),H1_2(i,6),H1_2(i,7));
        window_P{i}{1} = featP_scanA_L2(on_start_idx:on_end_idx);  % on windows
        window_Q{i}{1} = featQ_scanA_L2(on_start_idx:on_end_idx);  % on windows
        
        off_start_idx = fgetindex(Windows_All_L2,H1_2(i,8),H1_2(i,9),H1_2(i,10));
        off_end_idx = fgetindex(Windows_All_L2,H1_2(i,11),H1_2(i,12),H1_2(i,13));
        window_P{i}{2} = featP_scanA_L2(off_start_idx:off_end_idx);  % off windows
        window_Q{i}{2} = featQ_scanA_L2(off_start_idx:off_end_idx);  % on windows
        
        window_P{i}{3} = 2;  % on windows
        window_Q{i}{3} = 2;  % on windows
    end
    
     if(H1_2(i,1) == 0)
         window_P{i} = [];
         window_Q{i} = [];
     end
end

window_P_H1_2 = window_P;
window_Q_H1_2 = window_Q;

% load w_H1_2P
% load w_H1_2Q
% 
% % Euclidean Distance Based
% for i = 1:20
%     figure()
%     subplot(211);plot(window_P{i}{1});
%     subplot(212);plot(window_Q{i}{1});
%     pause
% end

