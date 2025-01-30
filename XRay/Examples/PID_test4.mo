within XRay.Examples;

model PID_test4
  Objects.Beam.Cathode cathode annotation(
    Placement(transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 25) annotation(
    Placement(transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.PID_VoltageSource2 V_Source(K_p = 10, K_i = 0.00005, K_d = 10, T_ref = 2573.15) annotation(
    Placement(transformation(origin = {-96, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.TemperatureSensor TempSensor annotation(
    Placement(transformation(origin = {-16, 34}, extent = {{-18, -18}, {18, 18}})));
  Objects.Electrical.Ground GND1 annotation(
    Placement(transformation(origin = {-90, -36}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.ThermionicEmissionCalc thermionicEmissionCalc(HVS(displayUnit = "kV") = 4.5e5)  annotation(
    Placement(transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.AnodeCalculator anodeCalculator(HVS(displayUnit = "kV"))  annotation(
    Placement(transformation(origin = {52, 50}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.Collimator collimator annotation(
    Placement(transformation(origin = {86, 50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{-8, 0}, {-26, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{40, 0}, {12, 0}}, color = {191, 0, 0}));
  connect(TempSensor.port_a, cathode.port_a) annotation(
    Line(points = {{-16, 16.36}, {-16, 0.36}, {-26, 0.36}}, color = {191, 0, 0}));
  connect(TempSensor.Temperature, V_Source.TemperatureInput) annotation(
    Line(points = {{-16, 51.28}, {-16, 70.28}, {-112, 70.28}, {-112, 0.28}, {-106, 0.28}}));
  connect(V_Source.p, cathode.p) annotation(
    Line(points = {{-96, 10}, {-96, 28}, {-36, 28}, {-36, 10}}, color = {0, 0, 255}));
  connect(GND1.gnd, V_Source.n) annotation(
    Line(points = {{-90, -26}, {-96, -26}, {-96, -10}}));
  connect(cathode.n, GND1.gnd) annotation(
    Line(points = {{-36, -10}, {-34, -10}, {-34, -26}, {-90, -26}}, color = {0, 0, 255}));
  connect(thermionicEmissionCalc.CathodeTemperature, TempSensor.Temperature) annotation(
    Line(points = {{20, 60}, {20, 70}, {-16, 70}, {-16, 52}}));
  connect(anodeCalculator.InputPower, thermionicEmissionCalc.RadiationPower) annotation(
    Line(points = {{42, 50}, {30, 50}}));
  connect(collimator.AnodeRadiation, anodeCalculator.Radiation_xray) annotation(
    Line(points = {{76, 50}, {62, 50}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 2),
    Diagram(coordinateSystem(extent = {{-120, -120}, {120, 120}})),
    Icon(coordinateSystem(extent = {{-120, -120}, {120, 120}})));
end PID_test4;
