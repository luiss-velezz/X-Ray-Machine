within XRay.Examples;

model PID_test_sensing
  Objects.Beam.Cathode cathode annotation(
    Placement(transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 27)  annotation(
    Placement(transformation(origin = {78, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-38, -42}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.PID_VoltageSource2 V_Source(K_p = 10, K_i = 0.00005, K_d = 10, T_ref = 2573.15)  annotation(
    Placement(transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.CurrentMeter currentMeter(R = 0.1, T_ref = 300.15, alpha = 5e-6)  annotation(
    Placement(transformation(origin = {-38, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(cathode.n, GND.gnd) annotation(
    Line(points = {{-8, -10}, {-8, -32}, {-38, -32}}, color = {0, 0, 255}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{68, 0}, {40, 0}}, color = {191, 0, 0}));
  connect(GND.gnd, V_Source.n) annotation(
    Line(points = {{-38, -32}, {-68, -32}, {-68, -10}}));
  connect(V_Source.p, currentMeter.p) annotation(
    Line(points = {{-68, 10}, {-68, 30}, {-48, 30}}, color = {0, 0, 255}));
  connect(cathode.p, currentMeter.n) annotation(
    Line(points = {{-8, 10}, {-8, 30}, {-28, 30}}, color = {0, 0, 255}));
  connect(currentMeter.controlledTemperature, fixedTemperature.port) annotation(
    Line(points = {{-32, 36}, {-32, 62}, {54, 62}, {54, 0}, {68, 0}}, color = {191, 0, 0}));
  connect(currentMeter.CalculatedTemperature, V_Source.TemperatureInput) annotation(
    Line(points = {{-44, 50}, {-46, 50}, {-46, 68}, {-94, 68}, {-94, 0}, {-78, 0}}));
  connect(cathode.port_a, bodyRadiation.port_1) annotation(
    Line(points = {{2, 0}, {20, 0}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
end PID_test_sensing;
