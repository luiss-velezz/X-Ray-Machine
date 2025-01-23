within XRay.Examples;

model DynamicResistor2
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-22, -78}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {44, -28}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature ambientTemperature(T = 20)  annotation(
    Placement(transformation(origin = {78, -28}, extent = {{10, -10}, {-10, 10}})));
  Objects.Thermal.ThermalCapacitor thermalCapacitor annotation(
    Placement(transformation(origin = {8, 26}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.VsourceWindow vsourceWindow(Vdc = 20, t_Start = 1, t_End = 1000)  annotation(
    Placement(transformation(origin = {-78, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Objects.Electrical.Resistor2 TungstenCathode(R=5, alpha=.0045) annotation(
    Placement(transformation(origin = {-18, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ambientTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{68, -28}, {54, -28}}, color = {191, 0, 0}));
  connect(vsourceWindow.n, GND.gnd) annotation(
    Line(points = {{-78, -38}, {-78, -68}, {-22, -68}}, color = {0, 0, 255}));
  connect(vsourceWindow.p, TungstenCathode.p) annotation(
    Line(points = {{-78, -18}, {-78, 2}, {-18, 2}, {-18, -20}}, color = {0, 0, 255}));
  connect(TungstenCathode.n, GND.gnd) annotation(
    Line(points = {{-18, -40}, {-18, -68}, {-22, -68}}, color = {0, 0, 255}));
  connect(TungstenCathode.port_a, thermalCapacitor.port) annotation(
    Line(points = {{-14, -30}, {8, -30}, {8, 16}}, color = {191, 0, 0}));
  connect(bodyRadiation.port_1, TungstenCathode.port_a) annotation(
    Line(points = {{34, -28}, {-14, -28}, {-14, -30}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 0.2));
end DynamicResistor2;