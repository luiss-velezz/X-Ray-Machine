within XRay.Objects.Thermal;

model FixedTemperature "Fixed temperature boundary condition in degree Celsius"
  parameter Modelica.Units.NonSI.Temperature_degC T(min = -273.15) "Room Temperature";
  Ports.ThermalPin_2 port annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  port.T = Modelica.Units.Conversions.from_degC(T);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.CrossDiag, extent = {{-100, 100}, {100, -100}}), Line(points = {{-42, 0}, {66, 0}}, color = {191, 0, 0}, thickness = 0.5), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{52, -20}, {52, 20}, {90, 0}, {52, -20}}), Text(textColor = {0, 0, 255}, extent = {{-150, -10}, {150, -50}}, textString = "%T"), Text(origin = {0, 16},textColor = {0, 0, 255}, extent = {{-150, 125}, {150, 85}}, textString = "Ambient Temparature")}),
    Documentation(info = "<html><head></head><body><p><strong>Overview</strong><br>The <strong>FixedTemperature</strong> model provides a fixed temperature boundary condition for thermal simulations. It allows the user to specify a constant temperature value in degrees Celsius, which is then converted to Kelvin and applied to the thermal port. This model is useful when you want to maintain a boundary at a constant temperature within a thermal network.</p><hr><p><strong>Key Concepts and Equations</strong></p><ol><li><p><strong>Temperature Setting and Conversion</strong></p><ul><li>The model uses a parameter <strong>T</strong> to set the fixed temperature in degrees Celsius.</li><li>The equation:<pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span><span class=\"hljs-attr\">port.T</span> = Modelica.Units.Conversions.from_degC(T)<span class=\"hljs-comment\">;</span>
</span></code></div></div></pre>converts the provided Celsius temperature to Kelvin, which is the standard unit used by thermal models.</li></ul></li><li><p><strong>Thermal Port</strong></p><ul><li>The model includes a single thermal port (<code>port</code>) of type <code>Ports.ThermalPin_2</code>.</li><li>This port is used to impose the fixed temperature on the connected thermal network.</li></ul></li></ol><hr><p><strong>Model Parameters</strong></p><ul><li><strong>T</strong><ul><li><strong>Description:</strong> The fixed temperature value at the port, specified in degrees Celsius.</li><li><strong>Unit:</strong> °C</li></ul></li></ul><hr><p><strong>Ports</strong></p><ul><li><strong>port (ThermalPin_2)</strong><ul><li><strong>Description:</strong> The thermal connection through which the fixed temperature (converted to Kelvin) is applied to the thermal network.</li></ul></li></ul><hr><p><strong>Usage Notes</strong></p><p><!--StartFragment--><!--EndFragment--></p><ul><li><p><strong>Purpose:</strong><br>Use the <strong>FixedTemperature</strong> model to define a boundary condition with a constant temperature in your thermal simulation.</p></li><li><p><strong>Unit Conversion:</strong><br>The built-in conversion function ensures that the temperature is properly converted from degrees Celsius to Kelvin, maintaining consistency with the SI units used in thermal analysis.</p></li><li><p><strong>Integration:</strong><br>This model can be connected to other thermal components to simulate scenarios where part of the system is held at a fixed temperature.</p></li></ul>
</body></html>"),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{52, -20}, {52, 20}, {90, 0}, {52, -20}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid)}));
end FixedTemperature;
