within XRay.Examples;

model CathodeSensing
  Objects.Beam.Cathode TungstenCathode annotation(
    Placement(transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.VsourceWindow vsourceWindow(Vdc = 3.5, t_Start = 0, t_End = 10000, V_offset = 0)  annotation(
    Placement(transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-78, -56}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature AmbientTemperature(T = 25)  annotation(
    Placement(transformation(origin = {52, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(vsourceWindow.p, TungstenCathode.p) annotation(
    Line(points = {{-78, 10}, {-78, 42}, {-34, 42}, {-34, 10}}, color = {0, 0, 255}));
  connect(vsourceWindow.n, TungstenCathode.n) annotation(
    Line(points = {{-78, -10}, {-78, -32}, {-34, -32}, {-34, -10}}, color = {0, 0, 255}));
  connect(GND.gnd, vsourceWindow.n) annotation(
    Line(points = {{-78, -46}, {-78, -10}}));
  connect(bodyRadiation.port_2, AmbientTemperature.port) annotation(
    Line(points = {{14, 0}, {42, 0}}, color = {191, 0, 0}));
  connect(bodyRadiation.port_1, TungstenCathode.port_a) annotation(
    Line(points = {{-6, 0}, {-24, 0}}, color = {191, 0, 0}));
annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 2));
end CathodeSensing;
