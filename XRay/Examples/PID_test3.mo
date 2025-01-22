within XRay.Examples;

model PID_test3
  Objects.Beam.Cathode cathode annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {38, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 25)  annotation(
    Placement(transformation(origin = {86, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-30, -42}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.TemperatureSensor TempSensor annotation(
    Placement(transformation(origin = {20, 34}, extent = {{-18, -18}, {18, 18}})));
  Objects.Electrical.PID_VoltageSource3 VoltageSource annotation(
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold = 2000)  annotation(
    Placement(transformation(origin = {-82, -18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(cathode.n, GND.gnd) annotation(
    Line(points = {{0, -10}, {0, -32}, {-30, -32}}, color = {0, 0, 255}));
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{28, 0}, {10, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{76, 0}, {48, 0}}, color = {191, 0, 0}));
  connect(TempSensor.port_a, cathode.port_a) annotation(
    Line(points = {{20, 16.36}, {20, 0.36}, {10, 0.36}}, color = {191, 0, 0}));
  connect(VoltageSource.p, cathode.p) annotation(
    Line(points = {{-50, 10}, {-50, 28}, {0, 28}, {0, 10}}, color = {0, 0, 255}));
  connect(VoltageSource.n, GND.gnd) annotation(
    Line(points = {{-50, -10}, {-50, -32}, {-30, -32}}, color = {0, 0, 255}));
  connect(VoltageSource.TemperatureInput, TempSensor.Temperature) annotation(
    Line(points = {{-60.2, 4}, {-66.2, 4}, {-66.2, 60}, {19.8, 60}, {19.8, 52}}));
  connect(greaterEqualThreshold.y, VoltageSource.Switching) annotation(
    Line(points = {{-70, -18}, {-64, -18}, {-64, -4}, {-60, -4}}, color = {255, 0, 255}));
  connect(VoltageSource.TemperatureInput, greaterEqualThreshold.u) annotation(
    Line(points = {{-60, 4}, {-98, 4}, {-98, -18}, {-94, -18}}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
end PID_test3;
