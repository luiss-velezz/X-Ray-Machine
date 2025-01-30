within XRay.Objects.Electrical;

model PID3test
  Beam.Cathode cathode annotation(
    Placement(transformation(origin = {-64, -2}, extent = {{-10, -10}, {10, 10}})));
  Thermal.ThermalCapacitor thermalCapacitor annotation(
    Placement(transformation(origin = {-36, 22}, extent = {{-10, -10}, {10, 10}})));
  Thermal.TemperatureSensor temperatureSensor annotation(
    Placement(transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}})));
  PID_VoltageSource4 pID_VoltageSource4 annotation(
    Placement(transformation(origin = {22, -6}, extent = {{-10, -10}, {10, 10}})));
  Ground ground annotation(
    Placement(transformation(origin = {-38, -46}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(thermalCapacitor.port, cathode.port_a) annotation(
    Line(points = {{-36, 12}, {-36, -2}, {-54, -2}}, color = {191, 0, 0}));
  connect(temperatureSensor.port_a, cathode.port_a) annotation(
    Line(points = {{-18, -8}, {-18, -16}, {-36, -16}, {-36, -2}, {-54, -2}}, color = {191, 0, 0}));
  connect(pID_VoltageSource4.TemperatureInput, temperatureSensor.Temperature) annotation(
    Line(points = {{12, -6}, {0, -6}, {0, 20}, {-18, 20}, {-18, 12}}));
  connect(pID_VoltageSource4.p, cathode.p) annotation(
    Line(points = {{22, 4}, {22, 38}, {-64, 38}, {-64, 8}}, color = {0, 0, 255}));
  connect(cathode.n, pID_VoltageSource4.n) annotation(
    Line(points = {{-64, -12}, {-64, -30}, {22, -30}, {22, -16}}, color = {0, 0, 255}));
  connect(ground.gnd, pID_VoltageSource4.n) annotation(
    Line(points = {{-38, -36}, {-38, -30}, {22, -30}, {22, -16}}));
end PID3test;
