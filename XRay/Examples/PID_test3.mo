within XRay.Examples;

model PID_test3
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
  Objects.Beam.ThermionicEmissionCalc thermionicEmissionCalc annotation(
    Placement(transformation(origin = {40, 62}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.AnodeCalculator anodeCalculator annotation(
    Placement(transformation(origin = {86, 60}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.Collimator collimator annotation(
    Placement(transformation(origin = {130, 58}, extent = {{-10, -10}, {10, 10}})));
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
    Line(points = {{20, 58}, {20, 68}, {-72, 68}, {-72, 0}, {-64, 0}}));
  connect(thermionicEmissionCalc.CathodeTemperature, TempSensor.Temperature) annotation(
    Line(points = {{40, 72}, {40, 84}, {20, 84}, {20, 58}}));
  connect(anodeCalculator.InputPower, thermionicEmissionCalc.RadiationPower) annotation(
    Line(points = {{76, 60}, {64, 60}, {64, 62}, {50, 62}}));
  connect(collimator.AnodeRadiation, anodeCalculator.Radiation_xray) annotation(
    Line(points = {{120, 58}, {108, 58}, {108, 60}, {96, 60}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 2),
    Diagram);
end PID_test3;
