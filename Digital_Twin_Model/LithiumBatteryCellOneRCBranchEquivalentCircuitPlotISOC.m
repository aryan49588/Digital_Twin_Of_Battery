try
figure(h1_LithiumBatteryCellOneRCBranchEquivalentCircuit)
catch
h1_LithiumBatteryCellOneRCBranchEquivalentCircuit=figure('Name','LithiumBatteryCellOneRCBranchEquivalentCircuit');
end
% Generate simulation results if they don't exist
if(~exist('simlog_LithiumBatteryCellOneRCBranchEquivalentCircuit','var'))
    sim('LithiumBatteryCellOneRCBranchEquivalentCircuit')
end
% Get simulation results
temp_iR0 = simlog_LithiumBatteryCellOneRCBranchEquivalentCircuit.Lithium_Cell_1RC.R0.i.series;
temp_SOC = simlog_LithiumBatteryCellOneRCBranchEquivalentCircuit.Lithium_Cell_1RC.Em_table.SOC.series;
% Plot results
ah(1) = subplot(2,1,1);
plot(temp_iR0.time/3600,temp_iR0.values,'LineWidth',1);
title('Battery Current (Lithium 1RC)');
ylabel('Current (A)');
grid on
ah(2) = subplot(2,1,2);
plot(temp_SOC.time/3600,temp_SOC.values,'LineWidth',1);
grid on
title('Battery SOC (Lithium 1RC)');
ylabel('SOC (0-1)');
xlabel('Time (hr)');
linkaxes(ah,'x');
% Remove temporary variables
clear temp_iR0 temp_SOC ah