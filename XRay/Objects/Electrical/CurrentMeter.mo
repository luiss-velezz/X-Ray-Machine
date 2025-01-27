within XRay.Objects.Electrical;

model CurrentMeter

  // Parameters
  parameter Modelica.Units.SI.Resistance R(min=0)=0.1 "Resistance at temperature T_ref";
  parameter Modelica.Units.SI.Temperature T_ref(min=0)=300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha(min=0)=5e-6
    "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
  parameter Real CathodeReferenceTemperature(min=0)=300.15 "Cathode's reference temperature";
  parameter Real CathodeReferenceResistance(min=0)=5 "Cathode's reference resistance";
  parameter Real CathodeTempCoeff(min=0)=0.0045;
  
  //Variables
  Resistor2 PrecisionResistor(
    R=R, 
    T_ref=T_ref, 
    alpha=alpha
  ) annotation(  
    Placement(transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Real V;
  Real I;
  Modelica.Units.SI.Temperature auxTemp;
 
  // Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {-2, 98}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-2, 98}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 controlledTemperature annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {50, -64}, extent = {{-10, -10}, {10, 10}})));
  Logic.RealOutput CalculatedTemperature annotation(
    Placement(transformation(origin = {98, 52}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {195, 67}, extent = {{-15, -15}, {15, 15}})));
equation

  V = n.v;
  I = (p.v - n.v)/R;
  
  V = CathodeReferenceResistance*(1 + CathodeTempCoeff*(CalculatedTemperature - CathodeReferenceTemperature))*I;

//  auxTemp = CathodeReferenceTemperature + ((V / (I * CathodeReferenceResistance)) - 1) / CathodeTempCoeff;
  CalculatedTemperature = auxTemp;

  connect(PrecisionResistor.port_a, controlledTemperature) annotation(
    Line(points = {{4, 2}, {100, 2}, {100, 0}}, color = {191, 0, 0}));
  connect(n, PrecisionResistor.n) annotation(
    Line(points = {{0, -100}, {0, -8}}, color = {0, 0, 255}));
  connect(PrecisionResistor.p, p) annotation(
    Line(points = {{0, 12}, {-2, 12}, {-2, 98}}, color = {0, 0, 255}));
annotation(
    Icon(graphics = {Line(points = {{-40, 100}, {-40, -100}, {40, -100}, {40, 100}, {-40, 100}, {-40, 100}}, pattern = LinePattern.DashDotDot, thickness = 1.5), Ellipse(origin = {1, 0}, lineThickness = 2.5, extent = {{-45, 44}, {45, -44}}), Text(origin = {8, -2}, rotation = -90, extent = {{-22, 32}, {22, -32}}, textString = "A"), Rectangle(origin = {96, 67}, rotation = -90, lineColor = {170, 255, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-10, 59}, {10, -59}}), Rectangle(origin = {78, 66}, rotation = -90, lineColor = {0, 255, 255}, fillColor = {255, 0, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-4, -40}, {4, 40}}), Ellipse(origin = {156, 67}, rotation = -90, fillColor = {180, 180, 180}, fillPattern = FillPattern.Solid, extent = {{-36, 35}, {36, -35}}), Rectangle(origin = {156, 67}, rotation = -90, fillColor = {0, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-24, 21}, {24, -21}}), Text(origin = {154, 68}, rotation = -90, extent = {{-32, 50}, {32, -50}}, textString = "%Temperature K")}),
 experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end CurrentMeter;
