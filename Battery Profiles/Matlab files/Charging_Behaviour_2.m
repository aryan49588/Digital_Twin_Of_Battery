clc;
clear;

battery_capacity = 2.7;  

capacity = linspace(0, 1, 500); 

V_profile = @(x) 2.7 + 1.5 * (0.2*tanh((x - 0.05)*12) + ...
                              0.6*(1 - exp(-5*x)) + ...
                              0.2*tanh((x - 0.95)*12));

V_base = V_profile(capacity);

shift = @(rate) 0.01 * log(rate);  

C_rates = [0.3, 1, 2.5, 7, 20];
colors = {'b', 'r', 'm', 'g', 'k'};
V_curves = zeros(length(C_rates), length(capacity));

figure;
hold on;

for i = 1:length(C_rates)
    rate = C_rates(i);
    current = rate * battery_capacity;  
    V_curves(i, :) = V_base + shift(rate);  
    legend_labels{i} = sprintf('%.1fC', rate);
    plot(capacity * 100, V_curves(i, :), 'Color', colors{i}, 'LineWidth', 2);
end

xlabel('Capacity Retention (%)');
ylabel('Voltage (V)');
title('Charging Behavior of 2.7Ah LiFePO_4 Battery at Different C-Rates');
legend(legend_labels, 'Location', 'SouthEast');
grid on;
ylim([2.6 4.3]);
xlim([0 100]);
