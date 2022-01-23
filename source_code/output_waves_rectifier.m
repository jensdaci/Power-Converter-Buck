clear;
clc;

f = 60;
t = (0:1/(f*100):1);

% Voltage Conversions
Vrms = 120;
Vm = Vrms*sqrt(2);
Vm_tr = Vm/14;
Vm_after_diode = Vm_tr - 1.4;
Duty_Cycle = 5/Vm_after_diode;
Vm_buck = Duty_Cycle * Vm_after_diode;

% Circuit elements
R = 500;
C = 100 * 10^(-6);

% Subplots for the output waves in each stage
subplot(3,2,1:2)
input = Vm * sin(2*pi*f*t);
plot(t,input)
xlabel('Time (s)')
ylabel('Input Voltage (V)')
title("Peak Voltage = 169 V",'FontWeight','Normal');
xlim([0 0.1]);

subplot(3,2,3)
transformed_output = Vm_tr*sin(2*pi*f*t);
plot(t,transformed_output)
xlabel('Time (s)')
ylabel('Transformed Voltage (V)')
title("Peak Voltage = 12.07 V",'FontWeight','Normal');
xlim([0 0.1]);

subplot(3,2,4)
rectified_output = abs((Vm_tr-1.4)*sin(2*pi*f*t));
plot(t,rectified_output)
xlabel('Time (s)')
ylabel('Rectified Voltage (V)')
title("Peak Voltage = 10.67 V",'FontWeight','Normal');
xlim([0 0.1]);

subplot(3,2,5)
input = zeros(1,6001) + Vm_tr;
plot(t, input)
xlabel('Time (s)')
ylabel('Buck Input Voltage (V)')
title("DC Voltage = 12.12 V",'FontWeight','Normal');
xlim([0 0.1]);
% theta = atand(-2*pi*f*R*C);
% exp_term = exp(-(2*pi*f*t-theta)/(2*pi*f*R*C));
% filtered_output = Vm * sin(2*pi*f*t) * sin(theta) .* exp_term;
% plot(t,filtered_output)
% xlabel('Time (s)')
% ylabel('Filtered Voltage (V)')
% xlim([0 0.1]);

subplot(3,2,6)
buck_output = zeros(1,6001) + Vm_buck;
plot(t,buck_output)
xlabel('Time (s)')
ylabel('Buck Output Voltage (V)')
title("DC Voltage = 5 V",'FontWeight','Normal');
xlim([0 0.1]);

suptitle('Rectifier and Buck Converter Circuit - Output Waves on Each Stage') 