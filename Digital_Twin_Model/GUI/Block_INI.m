
NominalCap = 50; %(Ah)


SOC_init = 0.8;
theta_init = 25;

Ctheta = 400; %(J/degC) Thermal Capacitance
Area = 0.01; % (m^2) Surface area of battery exposed to air
Rtheta = 20;  %(W/m^2/K) Convective heat transfer coefficient

Kc = 1.2; %()
Costar = 1.8e+005; %(As)
Kt_Temps = [25 40 60 75]; % Temperature breakpoints for Kt LUT
Kt = [0.80,1.10,1.20,1.12;]; %() LUT output values
delta = 0.73; %()
Istar = 15; %(A) Nominal Current (=cap/disch_t)
theta_f = -40; %(degC) Electrolyte Freezing Temp

Ep = 1.95; %(V) Parasitic emf
Gpo = 2.0e-011; %(s)
Vpo = 0.12; %(V)
Ap = 2.0; %()
Taup = 3; % (s)

Emo = 2.18; % (V) [max o.c. volts per cell]
Ke = 0.0006; %(V/degC)
Ao = -0.6; % ()
Roo = 0.0042; % (Ohm)
R10 = 0.0010; %(Ohm)
A21 = -10.0; %()
A22 = -8.75; %()
R20 = 0.11; %(Ohm)
Tau1 = 100; %(s)

ns = 6; %() Number of cells in series in each parallel branch

Qe_init = (1-SOC_init)*Kc*Costar*interp1([theta_f Kt_Temps],[0 Kt],theta_init);

