 function [rms_EventA, rms_scanA] = fdetect_rms_twoWindows(rmsVa, rmsVb, rmsVc)
clear rms_EventA
wWidth = 256;
wMove = 64;
Window_Size_Window1 = 20*wWidth/wMove; % 10-cycle window, 40 default
Window_Shift_Window1 = 2*wWidth/wMove;  % 5-cycle window shift, 20 default

Window_Size_Window2 = 20*wWidth/wMove; % 10-cycle window, 40 default
Window_Shift_Window2 = 2*wWidth/wMove;  % 5-cycle window shift, 20 default

Window_Dist = 20*wWidth/wMove;  % 0.5 sec distance between windows

rms_thres = 3;

%% Samples From Window 1
    for i=[1:size(rmsVa,1)] % # of event files
        % RMS Domain Event Detection
        % Store the max rms - min rms
        j=1;
        while(Window_Dist+(j-1)*Window_Shift_Window2+Window_Size_Window2<size(rmsVa,2))
            rms_sampleA_Window1 = rmsVa(i,((j-1)*Window_Shift_Window1+1:(j-1)*Window_Shift_Window1+Window_Size_Window1));
            rms_sampleA_Window2 = rmsVa(i,Window_Dist+((j-1)*Window_Shift_Window2+1:(j-1)*Window_Shift_Window2+Window_Size_Window2));
            rms_scanA(i,j) = mean(rms_sampleA_Window2) - mean(rms_sampleA_Window1);
            j = j+1;
        end
    end
    
    count_file = 0;
    tag = 0;
    for i = [1:size(rms_scanA,1)]
    count_event = 0;
    for j = [1:size(rms_scanA,2)]
        if(abs(rms_scanA(i,j)) > rms_thres)
            count_event = count_event +1;
            if(tag~=i)  %% if the event is in new file, switch line
                count_file = count_file + 1;
            end
            rms_EventA(count_file, 3*count_event-2) = i;
            rms_EventA(count_file, 3*count_event-1) = j;
            rms_EventA(count_file, 3*count_event) = rms_scanA(i,j);
            tag = i;
        end
    end
    end

 end
 