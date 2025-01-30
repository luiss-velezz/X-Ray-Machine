within XRay.Objects.Thermal;

model FixedTemperature "Fixed temperature boundary condition in degree Celsius"
  parameter Modelica.Units.NonSI.Temperature_degC T "Fixed temperature at the port";
  Ports.ThermalPin_2 port annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  port.T = Modelica.Units.Conversions.from_degC(T);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.CrossDiag, extent = {{-100, 100}, {100, -100}}), Line(points = {{-42, 0}, {66, 0}}, color = {191, 0, 0}, thickness = 0.5), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{52, -20}, {52, 20}, {90, 0}, {52, -20}}), Text(textColor = {0, 0, 255}, extent = {{-150, -10}, {150, -50}}, textString = "%T")}),
    Documentation(info = "<html><head></head><body><p>
This icon represents a fixed temperature source model. The temperature is set in Celcius for convenience.</p><p><br></p><p><br></p>
</body></html>"),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{52, -20}, {52, 20}, {90, 0}, {52, -20}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid)}));
end FixedTemperature;
