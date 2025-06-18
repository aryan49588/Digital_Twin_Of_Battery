filePath = 'C:\Users\owner''s\Desktop\matlab hands on\IDP_MATLAB\RESULTS\Battery_Data_Cleaned.csv';
data = readtable(filePath);
Cref = 2.7; 
Re_ref = 0.002249; 
Rct_ref = 0.2817;
wCap = 0.6; 
wRe = 0.3; 
wRct = 0.1;

% Compute normalized parameters for each cycle
normCap = data.Capacity ./ Cref;     % fraction of rated capacity
normRe  = Re_ref ./ data.Re;         % relative ohmic resistance
normRct = Rct_ref ./ data.Rct;       % relative charge-transfer resistance

% Combine into SOH percentage
data.SOH = 100 * (wCap * normCap + wRe * normRe + wRct * normRct);
data.SOH = round(data.SOH, 2);

% Save to new CSV
outputPath = 'C:\Users\owner''s\Desktop\matlab hands on\IDP_MATLAB\RESULTS\SOH_Results.csv';
writetable(data, outputPath);

% Display message
disp('SOH values calculated and saved to SOH_Results.csv');
figure;
plot(data.test_id, data.SOH, '-o', 'LineWidth', 1.5, 'MarkerSize', 5);
xlabel('Cycle Number');
ylabel('SOH (%)');
title('Battery SOH over 100 Cycles (Capacity + Re + Rct)');
grid on;
