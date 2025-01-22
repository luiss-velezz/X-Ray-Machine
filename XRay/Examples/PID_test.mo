within XRay.Examples;

model PID_test
  Objects.Beam.Cathode cathode annotation(
    Placement(transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {18, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 25)  annotation(
    Placement(transformation(origin = {66, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.PID_VoltageSource pID_VoltageSource(K_p = 10, K_i = 0.00005, K_d = 10, T_ref = 2573.15)  annotation(
    Placement(transformation(origin = {-64, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-50, -42}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(pID_VoltageSource.p, cathode.p) annotation(
    Line(points = {{-64, 10}, {-64, 34}, {-20, 34}, {-20, 10}}, color = {0, 0, 255}));
  connect(pID_VoltageSource.n, GND.gnd) annotation(
    Line(points = {{-64, -10}, {-64, -32}, {-50, -32}}, color = {0, 0, 255}));
  connect(cathode.n, GND.gnd) annotation(
    Line(points = {{-20, -10}, {-20, -32}, {-50, -32}}, color = {0, 0, 255}));
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{8, 0}, {-10, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{56, 0}, {28, 0}}, color = {191, 0, 0}));
  connect(pID_VoltageSource.port_a, cathode.port_a) annotation(
    Line(points = {{-74, 0}, {-78, 0}, {-78, 44}, {-2, 44}, {-2, 0}, {-10, 0}}, color = {191, 0, 0}));
annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
end PID_test;
