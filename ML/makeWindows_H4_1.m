%% m.file locations

load('H4idx.mat');
H4_1_ID = cell2mat(H4_1Labels(:,1));


for i = [1:size(H4_1,1)]
    if(H4_1(i,1) == 1)
        on_start_idx = fgetindex(Windows_All_L1,H4_1(i,2),H4_1(i,3),H4_1(i,4));
        on_end_idx = fgetindex(Windows_All_L1,H4_1(i,5),H4_1(i,6),H4_1(i,7));
        window_P{i}{1} = featP_scanA_L1(on_start_idx:on_end_idx);  % on windows
        window_Q{i}{1} = featQ_scanA_L1(on_start_idx:on_end_idx);  % on windows

        off_start_idx = fgetindex(Windows_All_L1,H4_1(i,8),H4_1(i,9),H4_1(i,10));
        off_end_idx = fgetindex(Windows_All_L1,H4_1(i,11),H4_1(i,12),H4_1(i,13));
        window_P{i}{2} = featP_scanA_L1(off_start_idx:off_end_idx);  % off windows
        window_Q{i}{2} = featQ_scanA_L1(off_start_idx:off_end_idx);  % off windows
        
        window_P{i}{3} = 1;  % on windows
        window_Q{i}{3} = 1;  % on windows
    end
    
    if(H4_1(i,1) == 2)
        on_start_idx = fgetindex(Windows_All_L2,H4_1(i,2),H4_1(i,3),H4_1(i,4));
        on_end_idx = fgetindex(Windows_All_L2,H4_1(i,5),H4_1(i,6),H4_1(i,7));
        window_P{i}{1} = featP_scanA_L2(on_start_idx:on_end_idx);  % on windows
        window_Q{i}{1} = featQ_scanA_L2(on_start_idx:on_end_idx);  % on windows
        
        off_start_idx = fgetindex(Windows_All_L2,H4_1(i,8),H4_1(i,9),H4_1(i,10));
        off_end_idx = fgetindex(Windows_All_L2,H4_1(i,11),H4_1(i,12),H4_1(i,13));
        window_P{i}{2} = featP_scanA_L2(off_start_idx:off_end_idx);  % off windows
        window_Q{i}{2} = featQ_scanA_L2(off_start_idx:off_end_idx);  % on windows
        
        window_P{i}{3} = 2;  % on windows
        window_Q{i}{3} = 2;  % on windows
    end
    
     if(H4_1(i,1) == 0)
         window_P{i} = [];
         window_Q{i} = [];
     end
     
     window_P{i}{4} = H4_1(i,14);  % on/off
     window_P{i}{5} = H4_1(i,15);  % P threshold
     
     window_Q{i}{4} = H4_1(i,14);  % on/off
     window_Q{i}{6} = H4_1(i,16);  % Q threshold
     
end

window_P_H4_1 = window_P;
window_Q_H4_1 = window_Q;

% load w_H4_1P
% load w_H4_1Q
% 
% % Euclidean Distance Based
% for i = 1:20
%     figure()
%     subplot(211);plot(window_P{i}{1});
%     subplot(212);plot(window_Q{i}{1});
%     pause
% end

