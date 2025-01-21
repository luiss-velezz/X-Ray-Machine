within XRay.Objects.Beam;

model Cathode
  //Parameters
  
  //Variables
  Electrical.Resistor2 ResistiveBehavior annotation(
    Placement(transformation(origin = {-55, 1}, extent = {{-25, -25}, {25, 25}}, rotation = -90)));
  Thermal.ThermalCapacitor ThermalBehavior annotation(
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

annotation(
    Icon(graphics = {Rectangle(rotation = -90,lineColor = {255, 190, 111}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}), Line(origin = {48, -1.06}, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, -47.06}, rotation = -90, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {-54, 0.94}, rotation = 180, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, 42.94}, rotation = 90, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier)}));
end Cathode;