function GUI_BATTERY
    % Battery setup
    battery_capacity = 2.7; % Ah
    C_rates = [0.3, 1, 2.5, 7, 20];
    colors = {'b', 'r', 'm', 'g', 'k'};
    shift = @(rate) 0.01 * log(rate);  
    
    screenSize = get(0, 'ScreenSize');
    fig = figure('Name', 'LiFePO_4 Charging & Discharging Simulation - 2.7Ah', ...
                 'NumberTitle', 'off', ...
                 'Units', 'pixels', ...
                 'Position', screenSize, ...
                 'MenuBar', 'none', ...
                 'ToolBar', 'none');

    tabgroup = uitabgroup('Parent', fig);
    tab1 = uitab(tabgroup, 'Title', 'Specifications');
    tab2 = uitab(tabgroup, 'Title', 'Charging Behavior');
    tab3 = uitab(tabgroup, 'Title', 'Discharging Behavior');

    %% === Specifications Tab ===
    specText = {
        'Battery Specifications: LiFePO₄ Cell';
        '----------------------------------------';
        'Nominal Voltage:         3.2 V';
        'Full Charge Voltage:     4.2 V';
        'Cutoff Voltage:          2.7 V';
        'Nominal Capacity:        2.7 Ah';
        'Minimum Charge Rate:     0.3C';
        'Minimum Discharge Rate:  0.3';
        'Maximum Charge Rate:     20C';
        'Maximum Discharge Rate:  20C';
        'Chemistry:               Lithium Iron Phosphate (LiFePO₄)';
        'Cycle Life:              >4000 cycles @ 80% DoD';
        'Temperature Range:       -15°C to 60°C';
    };

    uicontrol('Parent', tab1, ...
              'Style', 'text', ...
              'String', specText, ...
              'Units', 'normalized', ...
              'Position', [0.2 0.25 0.6 0.6], ...
              'FontSize', 14, ...
              'HorizontalAlignment', 'left');

    %% === Charging Plot ===
    capacity = linspace(0, 1, 500);  % Normalized: 0% to 100%
    V_charge_profile = @(x) 2.7 + 1.5 * (0.2*tanh((x - 0.05)*12) + ...
                                        0.6*(1 - exp(-5*x)) + ...
                                        0.2*tanh((x - 0.95)*12));
    V_base = V_charge_profile(capacity);
    
    ax1 = axes('Parent', tab2, 'Position', [0.1 0.15 0.85 0.75]);
    hold(ax1, 'on'); grid(ax1, 'on');
    title(ax1, 'Charging Behavior of LiFePO_4 (2.7Ah)');
    xlabel(ax1, 'Capacity Retention (%)');
    ylabel(ax1, 'Voltage (V)');

    legends1 = cell(1, length(C_rates));
    for i = 1:length(C_rates)
        rate = C_rates(i);
        current = rate * battery_capacity;  % A
        V_curve = V_base + shift(rate);
        plot(ax1, capacity * 100, V_curve, 'Color', colors{i}, 'LineWidth', 2);
        legends1{i} = sprintf('%.1fC', rate);
    end

    legend(ax1, legends1, 'Location', 'southeast');
    ylim(ax1, [2.6 4.3]); xlim(ax1, [0 100]);

    %% === Discharging Plot ===
    capacity_discharge = linspace(1, 0, 500);  % 100% to 0%
    V_discharge_profile = @(x) 2.7 + 1.5 * (0.5*(1 - tanh((x - 0.1) * 10)) + ...
                                           0.4*exp(-5 * x) + ...
                                           0.1*(1 - tanh((x - 0.9) * 10)));
    V_base_discharge = V_discharge_profile(capacity_discharge);
    
    ax2 = axes('Parent', tab3, 'Position', [0.1 0.15 0.85 0.75]);
    hold(ax2, 'on'); grid(ax2, 'on');
    title(ax2, 'Discharging Behavior of LiFePO_4 (2.7Ah)');
    xlabel(ax2, 'Remaining Capacity (%)');
    ylabel(ax2, 'Voltage (V)');

    legends2 = cell(1, length(C_rates));
    for i = 1:length(C_rates)
        rate = C_rates(i);
        current = rate * battery_capacity;
        V_curve = V_base_discharge - shift(rate);
        plot(ax2, capacity_discharge * 100, V_curve, 'Color', colors{i}, 'LineWidth', 2);
        legends2{i} = sprintf('%.1fC', rate);
    end

    legend(ax2, legends2, 'Location', 'southwest');
    ylim(ax2, [2.6 4.3]); xlim(ax2, [0 100]);
end
