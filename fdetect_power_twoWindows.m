function [power_EventA, power_scanA] = fdetect_power_twoWindows(powerVa)
Window_Size_Window1 = 20; % 10-cycle window, 40 default

Window_Size_Window2 = 20; % 10-cycle window, 40 default
Window_Shift = 1;  % 5-cycle window shift, 20 default

Window_Dist = 30;  % 0.5 sec distance between windows

power_thres = 20;

%% Samples From Window 1
        k=1;
        while(Window_Size_Window1+Window_Dist+Window_Size_Window2+(k-1)*Window_Shift<length(powerVa))
            power_sampleA_Window1 = powerVa((k-1)*Window_Shift+1:(k-1)*Window_Shift+Window_Size_Window1);
            power_sampleA_Window2 = powerVa(Window_Size_Window1+Window_Dist+(k-1)*Window_Shift+1:Window_Size_Window1+Window_Dist+Window_Size_Window2+(k-1)*Window_Shift);
            power_scanA(k) = mean(power_sampleA_Window2) - mean(power_sampleA_Window1);
            k = k+1;
        end
        
    count_file = 1;
    tag = 0;
 %% Recorded index is the starting of the first window
    for j = [1:length(power_scanA)]
        if(abs(power_scanA(j)) > power_thres)
            power_EventA(count_file, 1) = j;
            power_EventA(count_file, 2) = power_scanA(j);
            count_file = count_file + 1;
        end
    end
end
 