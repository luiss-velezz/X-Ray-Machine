within XRay.Objects.Beam;

model Cathode
  Electrical.Resistor ElectricalProperties(R = 5, alpha = .0045, T_ref = 293.5, i(start = 0), useHeatPort = true) annotation(
    Placement(transformation(origin = {-54, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Thermal.ThermalCapacitor ThermalProperties annotation(
    Placement(transformation(origin = {12, 46}, extent = {{-10, -10}, {10, 10}})));
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {2, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-22, 66}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {2, -98}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-36, -32}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 thermal_port annotation(
    Placement(transformation(origin = {76, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {58, 12}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ElectricalProperties.n, n) annotation(
    Line(points = {{-54, 0}, {-45, 0}, {-45, -42}, {-46, -42}, {-46, -51}, {2, -51}, {2, -98}}, color = {0, 0, 255}));
  connect(ElectricalProperties.p, p) annotation(
    Line(points = {{-54, 20}, {-54, 69}, {2, 69}, {2, 100}}, color = {0, 0, 255}));
  connect(ThermalProperties.port, ElectricalProperties.heatPort) annotation(
    Line(points = {{12, 36}, {-11, 36}, {-11, 20}, {-44, 20}, {-44, 10}}, color = {191, 0, 0}));
  connect(ElectricalProperties.heatPort, thermal_port) annotation(
    Line(points = {{-44, 10}, {22, 10}, {22, 0}, {76, 0}}, color = {191, 0, 0}));
  annotation(
    Diagram(graphics = {Rectangle(lineColor = {245, 194, 17}, fillColor = {222, 221, 218}, lineThickness = 0.75, extent = {{-76, 100}, {76, -100}})}, coordinateSystem(extent = {{-76, -100}, {76, 100}})),
    Icon(coordinateSystem(extent = {{-76, -100}, {76, 100}})));
end Cathode;