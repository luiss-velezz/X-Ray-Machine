within XRay.Objects.Beam;

model Cathode
  //Parameters
  parameter Modelica.Units.SI.Resistance R = 5 "Resistance at temperature T_ref";
  parameter Modelica.Units.SI.Temperature T_ref=300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha=0.0045
    "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
    
  parameter Modelica.Units.SI.Mass mass = 0.01 "Mass of the cathode"; // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat = 132 "Specific heat of the chatode's material"; // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Area surfaceArea = 1e-6 "Surface area of the cathode";   // m^2
  //Variables
  Electrical.Resistor ResistiveBehavior(
    R=R, 
    T_ref=T_ref, 
    alpha=alpha
  ) annotation(
    Placement(transformation(origin = {-55, 1}, extent = {{-25, -25}, {25, 25}}, rotation = -90)));
  Thermal.ThermalCapacitor ThermalBehavior(
    mass = mass,
    specificHeat = specificHeat,
    surfaceArea = surfaceArea
  ) annotation(
    Placement(transformation(origin = {40, 40}, extent = {{-24, -24}, {24, 24}})));
  //Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 port_a annotation(
    Placement(transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ResistiveBehavior.port_a, port_a) annotation(
    Line(points = {{-44, 2}, {98, 2}, {98, 0}}, color = {191, 0, 0}));
  connect(ThermalBehavior.port, port_a) annotation(
    Line(points = {{40, 16}, {98, 16}, {98, 0}}, color = {191, 0, 0}));
  connect(ResistiveBehavior.p, p) annotation(
    Line(points = {{-54, 26}, {-56, 26}, {-56, 80}, {0, 80}, {0, 100}}, color = {0, 0, 255}));
  connect(ResistiveBehavior.n, n) annotation(
    Line(points = {{-54, -24}, {-54, -62}, {0, -62}, {0, -100}}, color = {0, 0, 255}));

annotation(
    Icon(graphics = {Rectangle(rotation = -90, lineColor = {255, 190, 111}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}), Line(origin = {48, -1.06}, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, -47.06}, rotation = -90, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {-54, 0.94}, rotation = 180, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, 42.94}, rotation = 90, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier)}),
  Documentation(info = "<html><head></head><body><!--StartFragment--><span style=\"font-family: 'MS Shell Dlg 2'; font-size: 12px;\">This model represents an X-ray tube cathode, responsible for thermionic emission. It consists of electrical resistance, thermal capacity, and heat dissipation mechanisms. The cathode heats up due to electrical resistance, which then influences electron emission.</span><!--EndFragment--></body></html>"));
end Cathode;
