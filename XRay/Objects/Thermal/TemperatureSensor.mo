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
  Documentation(info = "<html><head></head><body><!--StartFragment--><p><strong>Overview</strong><br>The <strong>TemperatureSensor</strong> model provides a simple, non-intrusive way to measure the temperature in a thermal network. It reads the temperature at a thermal port and outputs that value as a real signal (in Kelvin) without affecting the system's thermal dynamics.</p><hr><p><strong>Key Concepts and Equations</strong></p><ol><li><p><strong>Temperature Measurement</strong></p><ul><li>The sensor is connected to a thermal port (<code>port_a</code>), from which it directly reads the temperature.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span><span class=\"hljs-attr\">Temperature</span> = port_a.T
</span></code></div></div></pre>This assigns the temperature from the thermal port directly to the output variable <code>Temperature</code>.</li></ul></li><li><p><strong>Non-Intrusive Behavior</strong></p><ul><li>The sensor is designed not to disturb the thermal network.</li><li><strong>Heat Flow Setting:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span><span class=\"hljs-attr\">port_a.Q_flow</span> = <span class=\"hljs-number\">0</span>
</span></code></div></div></pre>This ensures that the sensor does not contribute to or draw energy from the system.</li></ul></li></ol><hr><p><strong>Ports</strong></p><ul><li><strong>Thermal Port (port_a):</strong><ul><li>Provides the connection to the thermal network.</li><li>Supplies the temperature (<code>T</code>) used for measurement.</li></ul></li><li><strong>Output (Temperature):</strong><ul><li>A real-valued output that reports the measured temperature in Kelvin.</li></ul></li></ul><hr><p><strong>Usage Notes</strong></p><p style=\"font-size: 12px;\"><!--StartFragment--><!--EndFragment--></p><ul><li><p><strong>Integration:</strong><br>Connect the sensor’s thermal port (<code>port_a</code>) to any thermal component to monitor its temperature.</p></li><li><p><strong>Non-Intrusive Measurement:</strong><br>Since the sensor’s heat flow is set to zero, it will not affect the thermal energy balance of the system.</p></li><li><p><strong>Output Application:</strong><br>The temperature signal can be used for system monitoring, control strategies, or logging purposes.</p></li></ul><!--EndFragment--></body></html>"));
end TemperatureSensor;
