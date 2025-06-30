
try
    figure(h1_Battery_GUI)
catch
    h1_Battery_GUIs=figure('Name', 'Battery_GUI');
end

% Generate simulation results if they don't exist
if(~exist('simlog_Battery_GUI','var'))
    sim('Battery_GUI')
end

% Plot results
ah(1) = subplot(2,1,1);
plot(simlog_Battery_GUI.Battery_Cell.R0.i.series.time/3600,...
    simlog_Battery_GUI.Battery_Cell.R0.i.series.values,'LineWidth',1);
title('Battery Current');
ylabel('Current (A)');
grid on
ah(2) = subplot(2,1,2);
plot(simlog_Battery_GUI.Battery_Cell.Main_Branch_Voltage_Source_Em.SOC.series.time/3600,...
    simlog_Battery_GUI.Battery_Cell.Main_Branch_Voltage_Source_Em.SOC.series.values,'LineWidth',1);
grid on
title('Battery SOC (Lead Acid)');
ylabel('SOC (0-1)');
xlabel('Time (hr)');

linkaxes(ah,'x');

