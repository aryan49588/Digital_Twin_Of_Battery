baseDir = 'C:\Users\owner''s\Desktop\matlab hands on\IDP_MATLAB\';
Re_values = zeros(1000, 1);  

for k = 1:1000
    folderName = sprintf('cycle%d', k);
    fileName = sprintf('discharge%d.csv', k);
    filePath = fullfile(baseDir, folderName, fileName);

    if isfile(filePath)
        T = readtable(filePath);

        startIdx = 4;
        endIdx = 200;

        if height(T) >= endIdx + 1
            V = T.Voltage_load(startIdx:endIdx);
            V_next = T.Voltage_load(startIdx+1:endIdx+1);
            deltaV = V - V_next;

            Re_series = deltaV;  
            Re_avg = mean(Re_series, 'omitnan');
        else
            Re_avg = NaN;
            fprintf('Not enough data in %s\n', filePath);
        end
    else
        Re_avg = NaN;
        fprintf('Missing file: %s\n', filePath);
    end

    Re_values(k) = Re_avg;
end


Re_table = table((1:1000)', Re_values, 'VariableNames', {'Cycle', 'Re'});
Re_table.Re = sort(Re_table.Re, 'ascend');
writetable(Re_table, fullfile(baseDir, 'Re_verified.csv'));
disp('✅ Saved Re values from delta V method to Re_Averaged_Over_DeltaV.csv');
