%% Model
open_system('LithiumBatteryCellOneRCBranchEquivalentCircuit')
set_param(find_system(bdroot,'MatchFilter', @Simulink.match.allVariants,'FindAll','on','type','annotation','Tag','ModelFeatures'),'Interpreter','off');
%% Lithium Cell 1RC Subsystem
open_system('LithiumBatteryCellOneRCBranchEquivalentCircuit/Lithium Cell 1RC','force')
%% Simulation Results from Simscape Logging
LithiumBatteryCellOneRCBranchEquivalentCircuitPlotISOC;
%%