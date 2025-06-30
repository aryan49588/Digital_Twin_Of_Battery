
try
    figure(h1_LeadAcidBatteryWithDashboardBlocks)
catch
    h1_LeadAcidBatteryWithDashboardBlocks=figure('Name', 'LeadAcidBatteryWithDashboardBlocks');
end

% Generate simulation results if they don't exist
if(~exist('simlog_LeadAcidBatteryWithDashboardBlocks','var'))
    sim('LeadAcidBatteryWithDashboardBlocks')
end

% Plot results
ah(1) = subplot(2,1,1);
plot(simlog_LeadAcidBatteryWithDashboardBlocks.Battery_Cell.R0.i.series.time/3600,...
    simlog_LeadAcidBatteryWithDashboardBlocks.Battery_Cell.R0.i.series.values,'LineWidth',1);
title('Battery Current (Lead Acid)');
ylabel('Current (A)');
grid on
ah(2) = subplot(2,1,2);
plot(simlog_LeadAcidBatteryWithDashboardBlocks.Battery_Cell.Main_Branch_Voltage_Source_Em.SOC.series.time/3600,...
    simlog_LeadAcidBatteryWithDashboardBlocks.Battery_Cell.Main_Branch_Voltage_Source_Em.SOC.series.values,'LineWidth',1);
grid on
title('Battery SOC (Lead Acid)');
ylabel('SOC (0-1)');
xlabel('Time (hr)');

linkaxes(ah,'x');

