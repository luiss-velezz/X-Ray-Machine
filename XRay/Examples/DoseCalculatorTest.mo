within XRay.Examples;

model DoseCalculatorTest
  XRay.Objects.Beam.Cathode cathode annotation(
    Placement(transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}})));
  XRay.Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}})));
  XRay.Objects.Thermal.FixedTemperature fixedTemperature(T = 25) annotation(
    Placement(transformation(origin = {78, 0}, extent = {{10, -10}, {-10, 10}})));
  XRay.Objects.Electrical.PID_VoltageSource2 V_Source(K_d = 10, K_i = 0.00005, K_p = 10, T_ref = 2573.15) annotation(
    Placement(transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}})));
  XRay.Objects.Thermal.TemperatureSensor TempSensor annotation(
    Placement(transformation(origin = {12, 34}, extent = {{-18, -18}, {18, 18}})));
  XRay.Objects.Electrical.Ground GND1 annotation(
    Placement(transformation(origin = {-62, -36}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.Ground gnd2 annotation(
    Placement(transformation(origin = {78, -78}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.ThermionicEmission thermionicEmission annotation(
    Placement(transformation(origin = {16, -50}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.Resistor resistor(R = 1)  annotation(
    Placement(transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{20, 0}, {2, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{68, 0}, {40, 0}}, color = {191, 0, 0}));
  connect(TempSensor.port_a, cathode.port_a) annotation(
    Line(points = {{12, 16.36}, {12, 0.36}, {2, 0.36}}, color = {191, 0, 0}));
  connect(TempSensor.Temperature, V_Source.TemperatureInput) annotation(
    Line(points = {{12, 51.28}, {12, 70.28}, {-84, 70.28}, {-84, 0.28}, {-78, 0.28}}));
  connect(V_Source.p, cathode.p) annotation(
    Line(points = {{-68, 10}, {-68, 28}, {-8, 28}, {-8, 10}}, color = {0, 0, 255}));
  connect(GND1.gnd, V_Source.n) annotation(
    Line(points = {{-62, -26}, {-68, -26}, {-68, -10}}));
  connect(cathode.n, GND1.gnd) annotation(
    Line(points = {{-8, -10}, {-6, -10}, {-6, -26}, {-62, -26}}, color = {0, 0, 255}));
  connect(thermionicEmission.port_a, cathode.port_a) annotation(
    Line(points = {{16, -40}, {16, -10}, {12, -10}, {12, 0}, {2, 0}}, color = {191, 0, 0}));
  connect(resistor.p, thermionicEmission.p) annotation(
    Line(points = {{50, -50}, {26, -50}}, color = {0, 0, 255}));
  connect(resistor.n, gnd2.gnd) annotation(
    Line(points = {{70, -50}, {78, -50}, {78, -68}}, color = {0, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
end DoseCalculatorTest;
