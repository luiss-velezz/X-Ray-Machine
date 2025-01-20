within XRay.Examples;

model DynamicResistor
  Objects.Electrical.Resistor TungstenCathode(R=5, alpha=.0045, T_ref=293.5,i(start=0), useHeatPort=true) annotation(
    Placement(transformation(origin = {0, -28}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
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
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor annotation(
    Placement(transformation(origin = {44, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(TungstenCathode.n, GND.gnd) annotation(
    Line(points = {{0, -38}, {0, -68}, {-22, -68}}, color = {0, 0, 255}));
  connect(bodyRadiation.port_1, TungstenCathode.heatPort) annotation(
    Line(points = {{34, -28}, {10, -28}}, color = {191, 0, 0}));
  connect(ambientTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{68, -28}, {54, -28}}, color = {191, 0, 0}));
  connect(thermalCapacitor.port, TungstenCathode.heatPort) annotation(
    Line(points = {{8, 16}, {10, 16}, {10, -28}}, color = {191, 0, 0}));
  connect(vsourceWindow.p, TungstenCathode.p) annotation(
    Line(points = {{-78, -18}, {-78, -4}, {0, -4}, {0, -18}}, color = {0, 0, 255}));
  connect(vsourceWindow.n, GND.gnd) annotation(
    Line(points = {{-78, -38}, {-78, -68}, {-22, -68}}, color = {0, 0, 255}));
  connect(temperatureSensor.port, thermalCapacitor.port) annotation(
    Line(points = {{44, 30}, {44, 16}, {8, 16}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 0.2));
end DynamicResistor;