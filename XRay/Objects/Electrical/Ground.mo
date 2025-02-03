within XRay.Objects.Electrical;

model Ground
  Ports.ElectricalPin gnd annotation(
    Placement(transformation(origin = {0, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 270)));
equation
  gnd.v = 0;
// Sets the voltage at the gnd pin to 0, representing the ground potential
  annotation(
    Documentation(info = "<html><head></head><body><p><strong>Overview</strong><br>The <strong>Ground</strong> model represents the ground node in an electrical circuit. It sets the voltage at the ground node to zero volts, establishing a reference point for all other voltages in the circuit. This model is essential for ensuring proper balancing of the circuit equations.</p><hr><p><strong>Key Concepts and Equations</strong></p><ol><li><strong>Ground Potential</strong><ul><li><strong>Purpose:</strong><br>The ground node is used as the reference point in the electrical network. All node voltages are measured relative to this potential.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span><span class=\"hljs-attr\">gnd.v</span> = <span class=\"hljs-number\">0</span>
</span></code></div></div></pre>This equation ensures that the voltage at the ground pin is fixed at 0 V.</li></ul></li></ol><hr><p><strong>Ports</strong></p><ul><li><strong>ElectricalPin (gnd):</strong><ul><li><strong>Description:</strong><br>The single electrical port provided by the model represents the ground connection. This port is used to connect the ground node to other components in the circuit.</li></ul></li></ul><hr><p><strong>Usage Notes</strong></p><p><!--StartFragment--><!--EndFragment--></p><ul><li><strong>Reference Node:</strong><ul><li>In any electrical circuit simulation, a ground node is required to serve as the reference for measuring all other voltages. The <strong>Ground</strong> model fulfills this role by maintaining a fixed 0 V potential.</li></ul></li><li><strong>Circuit Balancing:</strong><ul><li>Including a ground node is crucial for the proper balancing of equations in the simulation. Without a defined reference potential, the system of equations might become underdetermined.</li></ul></li><li><strong>Integration:</strong><ul><li>Connect the ground port (<code>gnd</code>) from this model to the ground or reference nodes of other electrical components in your circuit.</li></ul></li></ul>
</body></html>", revisions = "<html><head></head><body></body></html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-60, 50}, {60, 50}}, color = {0, 0, 255}), Line(points = {{-40, 30}, {40, 30}}, color = {0, 0, 255}), Line(points = {{-20, 10}, {20, 10}}, color = {0, 0, 255}), Line(points = {{0, 90}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -10}, {150, -50}}, textString = "%name")}));
end Ground;
