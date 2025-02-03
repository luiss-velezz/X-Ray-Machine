within XRay.Objects.Beam;

model Cathode
  //Parameters
  parameter Modelica.Units.SI.Resistance R(min = 0) = 5 "Resistance at temperature T_ref";
  parameter Modelica.Units.SI.Temperature T_ref(min = 0) = 300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha(min = 0)=0.0045
    "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
    
  parameter Modelica.Units.SI.Mass mass(min=0) = 0.01 "Mass of the cathode"; // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat(min=0) = 132 "Specific heat of the chatode's material"; // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Area surfaceArea(min=0) = 1e-6 "Surface area of the cathode";     // m^2
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
    Icon(graphics = {Rectangle(rotation = -90, lineColor = {255, 190, 111}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}), Line(origin = {48, -1.06}, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, -47.06}, rotation = -90, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {-54, 0.94}, rotation = 180, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, 42.94}, rotation = 90, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, color = {224, 27, 36}, thickness = 2, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Text(origin = {0, 24},textColor = {0, 0, 255}, extent = {{-150, 125}, {150, 85}}, textString = "Tungsten Cathode")}),
  Documentation(info = "<html><head></head><body><!--StartFragment--><p><strong>Overview</strong><br>The <strong>Cathode</strong> model represents an X‑ray tube cathode responsible for thermionic emission. It couples electrical and thermal behavior by combining a temperature‐dependent resistor with a thermal capacitor. The resistor simulates the electrical heating effect (with resistance increasing as the cathode heats up), while the thermal capacitor models the cathode’s heat capacity and heat dissipation.</p><hr><p><strong>Key Components and Equations</strong></p><ol><li><p><strong>Temperature-Dependent Electrical Resistance</strong></p><ul><li><strong>Nominal Resistance (R):</strong><br>Defined at a reference temperature, <code>T_ref</code>.</li><li><strong>Temperature Coefficient (alpha):</strong><br>Describes how the resistance changes with temperature.</li><li><strong>Actual Resistance (R_actual):</strong><br>The resistor’s effective resistance is given by:<pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span class=\"hljs-attr\">R_actual</span> = R * (<span class=\"hljs-number\">1</span> + alpha * (T_heatPort - T_ref))
</code></div></div></pre>where <code>T_heatPort</code> is the temperature at the thermal port (provided by the thermal capacitor).</li></ul></li><li><p><strong>Thermal Behavior</strong></p><ul><li><strong>Thermal Capacitor:</strong><br>Represents the cathode’s thermal properties using:<ul><li><strong>Mass:</strong> The mass of the cathode.</li><li><strong>Specific Heat Capacity:</strong> The specific heat of the cathode material (e.g., tungsten).</li><li><strong>Surface Area:</strong> Defines the area for heat exchange.</li></ul></li><li>The thermal capacitor absorbs the heat generated by the electrical resistance, simulating the rise in temperature due to power loss.</li></ul></li><li><p><strong>Electrical and Thermal Coupling</strong></p><ul><li>Both the resistor (electrical behavior) and the thermal capacitor (thermal behavior) are connected to a common thermal port (<code>port_a</code>).</li><li>This coupling allows the resistor’s temperature-dependent behavior to be directly influenced by the thermal state of the cathode.</li></ul></li></ol><hr><p><strong>Model Parameters</strong></p><ul><li><p><strong>R (Resistance):</strong><br>Nominal resistance at the reference temperature (<code>T_ref</code>).</p></li><li><p><strong>T_ref (Reference Temperature):</strong><br>The temperature at which the nominal resistance is defined (in Kelvin).</p></li><li><p><strong>alpha (Temperature Coefficient):</strong><br>The linear temperature coefficient that determines how much the resistance increases with temperature.</p></li><li><p><strong>mass:</strong><br>The mass of the cathode (in kg).</p></li><li><p><strong>specificHeat:</strong><br>The specific heat capacity of the cathode’s material (in J/(kg·K)); for example, tungsten typically has a value around 132 J/(kg·K).</p></li><li><p><strong>surfaceArea:</strong><br>The effective surface area of the cathode (in m²) influencing heat dissipation.</p></li></ul><hr><p><strong>Ports</strong></p><ul><li><p><strong>Electrical Ports:</strong></p><ul><li><strong>PositivePin (p):</strong> Electrical positive connection.</li><li><strong>NegativePin (n):</strong> Electrical negative connection.</li></ul></li><li><p><strong>Thermal Port:</strong></p><ul><li><strong>ThermalPin_1 (port_a):</strong> Shared thermal connection used by both the resistor and the thermal capacitor to exchange heat.</li></ul></li></ul><hr><p><strong>Usage Notes</strong></p><ul><li><p><strong>Thermionic Emission:</strong><br>The model captures how the cathode heats up due to electrical resistance, which in turn affects electron emission.</p></li><li><p><strong>Coupled Behavior:</strong><br>The integration of electrical and thermal sub-models provides a realistic simulation of cathode performance in an X‑ray tube.</p></li><li><p><strong>Parameter Tuning:</strong><br>Adjusting <code>R</code>, <code>alpha</code>, <code>mass</code>, <code>specificHeat</code>, and <code>surfaceArea</code> allows you to model different cathode materials and designs.</p></li><li><p><strong>Thermal Management:</strong><br>The thermal capacitor ensures that the heat generated by electrical power loss is properly accounted for, influencing the resistor’s temperature and, consequently, its resistance.</p></li></ul><!--EndFragment--><!--EndFragment--></body></html>"));
end Cathode;
