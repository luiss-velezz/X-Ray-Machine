within XRay.Examples;

model BB_test
  Objects.Beam.Cathode TungstenCathode annotation(
    Placement(transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-78, -56}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature AmbientTemperature(T = 25)  annotation(
    Placement(transformation(origin = {52, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Objects.Electrical.BangBangSource VoltageSource annotation(
    Placement(transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(bodyRadiation.port_2, AmbientTemperature.port) annotation(
    Line(points = {{14, 0}, {42, 0}}, color = {191, 0, 0}));
  connect(bodyRadiation.port_1, TungstenCathode.port_a) annotation(
    Line(points = {{-6, 0}, {-24, 0}}, color = {191, 0, 0}));
  connect(VoltageSource.p, TungstenCathode.p) annotation(
    Line(points = {{-78, 10}, {-78, 16}, {-34, 16}, {-34, 10}}, color = {0, 0, 255}));
  connect(GND.gnd, VoltageSource.n) annotation(
    Line(points = {{-78, -46}, {-78, -10}}));
  connect(TungstenCathode.n, VoltageSource.n) annotation(
  //connect(pID_VoltageSource.T_input, TungstenCathode.)
    Line(points = {{-34, -10}, {-34, -22}, {-78, -22}, {-78, -10}}, color = {0, 0, 255}));
//connect(pID_VoltageSource.T_input, TungstenCathode.port_a.T);
  connect(VoltageSource.port_a, TungstenCathode.port_a) annotation(
    Line(points = {{-88, 0}, {-94, 0}, {-94, 34}, {-16, 34}, {-16, 0}, {-24, 0}}, color = {191, 0, 0}));

annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
end BB_test;
