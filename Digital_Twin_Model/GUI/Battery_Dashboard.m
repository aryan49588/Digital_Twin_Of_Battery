%% Battery_GUI
% 
% This example shows how to model a lead-acid battery cell using the
% Simscape(TM) language.
%
% Implementing the nonlinear equations of the equivalent circuit components
% in Simscape as opposed to modeling entirely in Simulink(R) more clearly
% relates the model components to the defining physical equations. For the
% defining equations and their validation, see Jackey, R. "A Simple, Effective
% Battery_GUI Modeling Process for Electrical System Component
% Selection", SAE World Congress & Exhibition, April 2007, ref.
% 2007-01-0778.
% 
% In this simulation, initially the battery is discharged at a constant
% current of 10A. The battery is then recharged at a constant 10A back to
% the initial state of charge. The battery is then discharged and recharged again.
% A simple thermal model is used to model battery temperature. It is
% assumed that cooling is primarily via convection, and that heating is
% primarily from battery internal resistance, R2. A standard 12 V lead-acid
% battery can be modeled by connecting six copies of the 2V battery cell
% block in series.
% 
% This model is constructed using the Simscape example library
% lithium_Battery_lib. The library comes built and on your path so that it
% is readily executable. However, it is recommended that you copy the
% source files to a new directory, for which you have write permission, and
% add that directory to your MATLAB(R) path. This will allow you to make
% changes and rebuild the library for yourself. The source files for the
% example library are in the following package directory:
% matlabroot/toolbox/physmod/simscape/supporting_files/example_libraries/+LeadAcidBattery where
% matlabroot is the MATLAB root directory on your machine, as returned by
% entering matlabroot in the MATLAB Command Window.
% 
% This example includes animations of the current, state of charge, and temperature
% created using a Circular Gauge and two Vertical Gauge blocks from the
% Simulink / Dashboard / Customizable Blocks library.
% 
% Copyright 2012-2021 The MathWorks, Inc.



%% Model

open_system('Lithium_Battery_1RC_Model')

set_param(find_system(bdroot,'FindAll','on','type','annotation','Tag','ModelFeatures'),'Interpreter','off');

%% Battery Cell Subsystem

open_system('Lithium_Battery_1RC_Model/Battery Cell','force')

%% Battery Thermal Model Subsystem

open_system('Lithium_Battery_1RC_Model/Battery Cell/Battery Thermal Model','force')

%% Simulation Results from Scopes

set_param('Lithium_Battery_1RC_Model/Battery Measurements','open','on');
sim('Lithium_Battery_1RC_Model');

%% 

set_param('Lithium_Battery_1RC_Model/Battery Measurements','open','off');
%% Simulation Results from Simscape Logging
%
% The figure below shows the battery current and state of charge in a
% MATLAB figure. You can also view this data in the Simulation Data Inspector
% by clicking the *View battery current SOC* hyperlink in the model canvas or
% by clicking the *Data Inspector* button on the model *Simulation* tab.

Lithium_Battery_1RC_ModelPlotISOC;

%%

