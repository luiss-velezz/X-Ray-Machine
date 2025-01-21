within XRay.Objects.Electrical;

model Resistor2
  
  parameter Modelica.Units.SI.Resistance R(start=1)
    "Resistance at temperature T_ref";
  parameter Modelica.Units.SI.Temperature T_ref=300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha=0
    "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
    
  Modelica.Units.SI.Voltage v;
  Modelica.Units.SI.Current i;
  Modelica.Units.SI.Resistance R_actual
    "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
  Modelica.Units.SI.Power LossPower;
  
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 port_a annotation(
    Placement(transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}})));
equation
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  
  assert((1 + alpha*(port_a.T - T_ref)) >= Modelica.Constants.eps,
    "Temperature outside scope of model!");
  R_actual = R*(1 + alpha*(port_a.T - T_ref));
  v = R_actual*i;
  LossPower = v*i;
  port_a.Q_flow = -LossPower;
annotation(
    Icon(graphics = {Rectangle(lineColor = {119, 118, 123},fillColor = {192, 191, 188}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Text(origin = {2, -56}, textColor = {0, 0, 255}, extent = {{150, 20}, {-150, -20}}, textString = "%name"), Text(origin = {2, -1}, extent = {{-150, 15}, {150, -15}}, textString = "R=%R")}));
end Resistor2;