clear;
clc;
t = (0:1/(60*100):1);
Vrms = 120;
Vm = Vrms*sqrt(2);
Vm_tr = Vm/14;
Vm_after_diode = Vm_tr - 1.4;
Duty_Cycle = 5/Vm_after_diode;
Vm_buck = Duty_Cycle * Vm_after_diode;


subplot(2,1,1)
input = zeros(1,6001) + Vm_tr;
plot(t, input)
xlabel('Time (s)')
ylabel('Buck Input Voltage (V)')
title("DC Voltage = 12.12 V",'FontWeight','Normal');
xlim([0 0.1]);

subplot(2,1,2)
buck_output = zeros(1,6001) + Vm_buck;
plot(t,buck_output)
xlabel('Time (s)')
ylabel('Buck Output Voltage (V)')
title("DC Voltage = 5 V",'FontWeight','Normal');
xlim([0 0.1]);

