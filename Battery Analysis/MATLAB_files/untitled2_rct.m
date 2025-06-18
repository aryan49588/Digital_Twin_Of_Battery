
baseDir = 'C:\Users\owner''s\Desktop\matlab hands on\IDP_MATLAB\';

Re_data = readtable(fullfile(baseDir, 'Re_verified.csv'));
Re_values = Re_data.Re;

Rct_values = zeros(1000, 1);

I = 1; % Ampere

for k = 1:100
    folderName = sprintf('cycle%d', k);
    fileName = sprintf('discharge%d.csv', k);
    filePath = fullfile(baseDir, folderName, fileName);

    try
        
        T = readtable(filePath);

        
        if height(T) >= 100
            V4 = T.Voltage_load(4);
            V100 = T.Voltage_load(100);
            deltaV = V4 - V100;

            
            Re_k = Re_values(k);

            
            Rct = max(0, (deltaV - I * Re_k) / I);
            Rct_values(k) = Rct;
        else
            Rct_values(k) = NaN; 
        end
    catch ME
        warning("Error processing cycle %d: %s", k, ME.message);
        Rct_values(k) = NaN;
    end
end

Rct_table = table((1:1000)', Rct_values, 'VariableNames', {'Cycle', 'Rct'});
Rct_table.Rct = sort(Rct_table.Rct, 'ascend');
writetable(Rct_table, fullfile(baseDir, 'Rct_Estimated.csv'));

disp('✅ Rct values calculated and saved to Rct_Estimated.csv');
