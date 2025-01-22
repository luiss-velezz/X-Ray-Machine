within XRay.Examples;

model PID_test2
  Objects.Beam.Cathode cathode annotation(
    Placement(transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 25)  annotation(
    Placement(transformation(origin = {78, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-38, -42}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.PID_VoltageSource2 V_Source(K_p = 10, K_i = 0.00005, K_d = 10, T_ref = 2573.15)  annotation(
    Placement(transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.TemperatureSensor TempSensor annotation(
    Placement(transformation(origin = {12, 34}, extent = {{-18, -18}, {18, 18}})));
equation
  connect(cathode.n, GND.gnd) annotation(
    Line(points = {{-8, -10}, {-8, -32}, {-38, -32}}, color = {0, 0, 255}));
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{20, 0}, {2, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{68, 0}, {40, 0}}, color = {191, 0, 0}));
  connect(V_Source.p, cathode.p) annotation(
    Line(points = {{-68, 10}, {-68, 36}, {-8, 36}, {-8, 10}}, color = {0, 0, 255}));
  connect(GND.gnd, V_Source.n) annotation(
    Line(points = {{-38, -32}, {-68, -32}, {-68, -10}}));
  connect(TempSensor.port_a, cathode.port_a) annotation(
    Line(points = {{12, 16.36}, {12, 0.36}, {2, 0.36}}, color = {191, 0, 0}));
  connect(TempSensor.Temperature, V_Source.TemperatureInput) annotation(
    Line(points = {{12, 51.28}, {12, 70.28}, {-84, 70.28}, {-84, 0.28}, {-78, 0.28}}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
end PID_test2;
