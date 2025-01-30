within XRay.Objects.Thermal;

model TemperatureSensor
  Ports.ThermalPin_1 port_a annotation(
    Placement(transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -98}, extent = {{-10, -10}, {10, 10}})));
  Logic.RealOutput Temperature annotation(
    Placement(transformation(origin = {-2, 68}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 96}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  Temperature = port_a.T;
  port_a.Q_flow = 0;
annotation(
    Icon(graphics = {Rectangle(origin = {0, -15}, lineColor = {170, 255, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-10, 59}, {10, -59}}), Rectangle(origin = {0, -30}, lineColor = {0, 255, 255}, fillColor = {255, 0, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-4, -40}, {4, 40}}), Ellipse(origin = {0, 47}, fillColor = {180, 180, 180}, fillPattern = FillPattern.Solid, extent = {{-36, 35}, {36, -35}}), Rectangle(origin = {0, 47}, fillColor = {0, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-24, 21}, {24, -21}}), Text(origin = {-2, 48}, extent = {{-32, 50}, {32, -50}}, textString = "%Temperature K")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Documentation(info = "<html><head></head><body><!--StartFragment--><p style=\"font-size: 12px;\"><span style=\"font-family: 'MS Shell Dlg 2';\">\"A simple temperature sensor model to measure thermal conditions in the system\"</span></p><div class=\"htmlDoc\" style=\"font-family: 'MS Shell Dlg 2';\"><div><br></div><div>This model represents a temperature sensor that measures the temperature at a thermal port and outputs the value as a real signal. It does not affect the thermal dynamics of the connected system.</div></div><!--EndFragment--></body></html>"));
end TemperatureSensor;
