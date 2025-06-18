clc;
clear;

battery_capacity = 2.7;  % in Ah

capacity = linspace(1, 0, 500);  


V_profile = @(x) 2.7 + 1.5 * (0.5*(1 - tanh((x - 0.1) * 10)) + ...
                              0.4*exp(-5 * x) + ...
                              0.1*(1 - tanh((x - 0.9) * 10)));

V_base = V_profile(capacity);

drop = @(rate) 0.01 * log(rate);  

C_rates = [0.3, 1, 2.5, 7, 20];
colors = {'b', 'r', 'm', 'g', 'k'};
V_curves = zeros(length(C_rates), length(capacity));

figure;
hold on;

% Plot for each C-rate
for i = 1:length(C_rates)
    rate = C_rates(i);
    current = rate * battery_capacity;  % Current in Amps
    V_curves(i, :) = V_base - drop(rate);  % Discharging → voltage drop
    legend_labels{i} = sprintf('%.1fC', rate);
    plot(capacity * 100, V_curves(i, :), 'Color', colors{i}, 'LineWidth', 2);
end

% Plot formatting
xlabel('Remaining Capacity (%)');
ylabel('Voltage (V)');
title('Discharging Behavior of 2.7Ah LiFePO_4 Battery at Different C-Rates');
legend(legend_labels, 'Location', 'SouthWest');
grid on;
ylim([2.6 4.3]);
xlim([0 100]);
