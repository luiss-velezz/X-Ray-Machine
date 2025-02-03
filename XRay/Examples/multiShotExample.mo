within XRay.Examples;

model multiShotExample
  Objects.Beam.Cathode cathode annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {38, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 25)  annotation(
    Placement(transformation(origin = {86, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-30, -42}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.TemperatureSensor TempSensor annotation(
    Placement(transformation(origin = {20, 40}, extent = {{-18, -18}, {18, 18}})));
  Objects.Electrical.PID_VoltageSource4 pID_VoltageSource4(T_ref = 2573.15, K_p = 10, K_i = 0.00005, K_d = 10)  annotation(
    Placement(transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Logic.OperatorInterface operatorInterface annotation(
    Placement(transformation(origin = {57, 72.6667}, extent = {{-22, -14.6667}, {22, 14.6667}})));
equation
  connect(cathode.n, GND.gnd) annotation(
    Line(points = {{0, -10}, {0, -32}, {-30, -32}}, color = {0, 0, 255}));
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{28, 0}, {10, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{76, 0}, {48, 0}}, color = {191, 0, 0}));
  connect(TempSensor.port_a, cathode.port_a) annotation(
    Line(points = {{20, 22}, {20, 0.36}, {10, 0.36}}, color = {191, 0, 0}));
  connect(pID_VoltageSource4.p, cathode.p) annotation(
    Line(points = {{-54, 10}, {-54, 22}, {0, 22}, {0, 10}}, color = {0, 0, 255}));
  connect(pID_VoltageSource4.n, GND.gnd) annotation(
    Line(points = {{-54, -10}, {-54, -32}, {-30, -32}}, color = {0, 0, 255}));
  connect(TempSensor.Temperature, pID_VoltageSource4.TemperatureInput) annotation(
    Line(points = {{20, 58}, {20, 68}, {-80, 68}, {-80, 0}, {-64, 0}}));
  connect(operatorInterface.CathodeTemperature, TempSensor.Temperature) annotation(
    Line(points = {{34, 72}, {20, 72}, {20, 58}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 2),
    Diagram,
  Documentation(info = "<html><head></head><body><!--StartFragment--><p><strong>Overview</strong><br>The <em>PID_test3</em> model is an integrated example that simulates an X‑ray tube system by combining electrical, thermal, and beam components. The model demonstrates how to use a PID-controlled voltage source to regulate the cathode’s operation, measure its temperature, and process the resulting thermionic emission to ultimately generate an X‑ray beam. The simulation spans multiple physics domains, including electrical control, thermal management, and beam formation.</p><hr><p><strong>Key Components and Their Functions</strong></p><ul><li><p><strong>Cathode (Objects.Beam.Cathode):</strong><br>Represents the X‑ray tube cathode that emits electrons via thermionic emission. It provides a thermal port for heat exchange and electrical pins for voltage application.</p></li><li><p><strong>BodyRadiation (Objects.Thermal.BodyRadiation):</strong><br>Simulates the radiative heat loss from the cathode using the Stefan–Boltzmann law. It is connected to the cathode’s thermal port.</p></li><li><p><strong>FixedTemperature (Objects.Thermal.FixedTemperature):</strong><br>Imposes a fixed ambient temperature (set to 25°C) as a boundary condition on the thermal network, influencing the radiative heat transfer.</p></li><li><p><strong>Ground (Objects.Electrical.Ground):</strong><br>Establishes the electrical reference (0 V) for the circuit. The cathode’s negative terminal is connected to ground.</p></li><li><p><strong>TemperatureSensor (Objects.Thermal.TemperatureSensor):</strong><br>Measures the temperature at the cathode’s thermal port and outputs this value (in Kelvin) for feedback to the control system.</p></li><li><p><strong>PID Voltage Source (Objects.Electrical.PID_VoltageSource4):</strong><br>Provides a controlled voltage to the cathode based on temperature feedback. Its PID controller adjusts the voltage to drive the cathode temperature toward a desired setpoint.</p></li><li><p><strong>ThermionicEmissionCalc (Objects.Beam.ThermionicEmissionCalc):</strong><br>Calculates the thermionic emission current and corresponding radiation power from the cathode based on its temperature.</p></li><li><p><strong>AnodeCalculator (Objects.Beam.AnodeCalculator):</strong><br>Processes the radiation power from the thermionic emission calculation to determine the X‑ray radiation intensity emerging from the anode.</p></li><li><p><strong>Collimator (Objects.Beam.Collimator):</strong><br>Shapes and focuses the X‑ray beam by calculating the radiation dose based on the effective aperture area.</p></li></ul><hr><p><strong>Key Connections</strong></p><ul><li><p><strong>Thermal Connections:</strong></p><ul><li>The <em>BodyRadiation</em> element is connected to the cathode’s thermal port to model heat loss.</li><li>The <em>FixedTemperature</em> element is connected to <em>BodyRadiation</em> to establish a constant ambient temperature.</li><li>The <em>TemperatureSensor</em> is also connected to the cathode’s thermal port to monitor its temperature.</li></ul></li><li><p><strong>Electrical Connections:</strong></p><ul><li>The PID voltage source (<em>PID_VoltageSource4</em>) is connected to the cathode’s positive electrical pin.</li><li>The negative electrical connections of both the cathode and the voltage source are tied to <em>Ground</em>.</li></ul></li><li><p><strong>Control Signal Flow:</strong></p><ul><li>The temperature measured by the <em>TemperatureSensor</em> is fed into the PID voltage source as feedback.</li><li>The PID voltage source adjusts its output voltage based on this feedback to control the cathode’s operation.</li></ul></li><li><p><strong>Beam/Emission Flow:</strong></p><ul><li>The <em>ThermionicEmissionCalc</em> block uses the cathode’s temperature (from the sensor) to compute the emitted radiation power.</li><li>This power is then sent to the <em>AnodeCalculator</em>, which calculates the resulting X‑ray radiation.</li><li>Finally, the <em>Collimator</em> receives the X‑ray radiation and shapes the beam accordingly.</li></ul></li></ul><hr><p><strong>Usage Notes</strong></p><ul><li><p><strong>Simulation Setup:</strong><br>The model is configured for a simulation period of 10,000 seconds with data recorded at 2-second intervals. This long-term simulation allows the observation of both transient and steady-state behaviors in the X‑ray tube system.</p></li><li><p><strong>PID Control:</strong><br>The PID voltage source regulates the cathode by adjusting its applied voltage based on temperature feedback. Tuning the PID gains (<em>K_p</em>, <em>K_i</em>, <em>K_d</em>) and the reference temperature (<em>T_ref</em>) is essential for achieving stable and optimal performance.</p></li><li><p><strong>Multiphysics Integration:</strong><br>This example illustrates how to integrate electrical, thermal, and beam physics into a cohesive simulation. Users can modify individual subsystem parameters (e.g., emissivity in <em>BodyRadiation</em>, ambient temperature in <em>FixedTemperature</em>, or aperture size in the <em>Collimator</em>) to study their impact on overall system performance.</p></li><li><p><strong>Parameter Adjustment:</strong><br>Adjust parameters within each component to match the characteristics of your physical system or to experiment with different operational scenarios.</p></li></ul><!--EndFragment--></body></html>"));
end multiShotExample;
