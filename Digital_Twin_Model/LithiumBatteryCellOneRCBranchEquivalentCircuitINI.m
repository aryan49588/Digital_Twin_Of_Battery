SOC_LUT = [0 ,0.1, 0.25, 0.5, 0.75, 0.9, 1]';
Temperature_LUT = [293.15, 393.15];
%% Em Branch Properties
% Battery capacity
Capacity_LUT = [27.6250, 31.892]; %Ampere*hours
% Em open-circuit voltage vs SOC rows and T columns
Em_LUT = [
2.9624 4.2
3.4558 3.9
3.4558 3.6
3.7146 3
3.8337 3.4
3.4558 3.2
3.4558 4.2 ]; %Volts
%% Terminal Resistance Properties
% R0 resistance vs SOC rows and T columns
R0_LUT = [
0.1376 0.142
0.14 0.212
0.1701 0.121
0.1623 0.32
0.3899 0.22
0.2 0.11
0.3 0.11 ]; %Ohms
%% RC Branch 1 Properties
% R1 Resistance vs SOC rows and T columns
R1_LUT = [
0.0233 0.033
0.0089 0.098
0.0153 0.0998
0.0045 0.008
0.2471 0.007
0.0058 0.006
0.0065 0.00998]; %Ohms
% C1 Capacitance vs SOC rows and T columns
C1_LUT = [
0.00032 0.00032
0.00032 0.00099
0.00078 0.00065
0.00098 0.00065
0.00067 0.00032
0.00009 0.00034
0.00045 0.00034]; %Farads
%% Thermal Properties
% Cell dimensions and sizes
cell_thickness = 0.0084; %m
cell_width = 0.215; %m
cell_height = 0.220; %m
% Cell surface area
cell_area = 2 * (...
cell_thickness * cell_width +...
cell_thickness * cell_height +...
cell_width * cell_height); %m^2
% Cell volume
cell_volume = cell_thickness * cell_width * cell_height; %m^3
% Cell mass
cell_mass = 1; %kg
% Volumetric heat capacity (assumes uniform heat capacity throughout the cell)
cell_rho_Cp = 2.04E6; %J/m3/K
% Specific Heat
cell_Cp_heat = cell_rho_Cp * cell_volume; %J/kg/K
h_conv = 5; %W/m^2/K
%% Initial Conditions
% Charge deficit
Qe_init = 15.6845; %Ampere*hours
% Ambient temperature
T_init = 20 + 273.15; %K