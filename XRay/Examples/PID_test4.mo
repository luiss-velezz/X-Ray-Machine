within XRay.Examples;

model PID_test4
  Objects.Beam.Cathode cathode annotation(
<<<<<<< HEAD
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
  Objects.Beam.ThermionicEmissionCalc thermionicEmissionCalc annotation(
    Placement(transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}})));
  Objects.Beam.AnodeCalculator anodeCalculator annotation(
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
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2),
    Diagram(coordinateSystem(extent = {{-120, -120}, {120, 120}})),
    Icon(coordinateSystem(extent = {{-120, -120}, {120, 120}})));
=======
    Placement(transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.BodyRadiation bodyRadiation annotation(
    Placement(transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.FixedTemperature fixedTemperature(T = 27)  annotation(
    Placement(transformation(origin = {78, 0}, extent = {{10, -10}, {-10, 10}})));
  Objects.Electrical.Ground GND annotation(
    Placement(transformation(origin = {-38, -42}, extent = {{-10, -10}, {10, 10}})));
  Objects.Electrical.PID_VoltageSource2 V_Source(K_p = 10, K_i = 0.00005, K_d = 10, T_ref = 2573.15)  annotation(
    Placement(transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}})));
  Objects.Thermal.TemperatureSensor TempSensor annotation(
    Placement(transformation(origin = {12, 34}, extent = {{-18, -18}, {18, 18}})));
  Objects.Electrical.CurrentMeter currentMeter(R = 0.1, T_ref = 300.15, alpha = 5e-6)  annotation(
    Placement(transformation(origin = {-38, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(cathode.n, GND.gnd) annotation(
    Line(points = {{-8, -10}, {-8, -32}, {-38, -32}}, color = {0, 0, 255}));
  connect(bodyRadiation.port_1, cathode.port_a) annotation(
    Line(points = {{20, 0}, {2, 0}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, bodyRadiation.port_2) annotation(
    Line(points = {{68, 0}, {40, 0}}, color = {191, 0, 0}));
  connect(GND.gnd, V_Source.n) annotation(
    Line(points = {{-38, -32}, {-68, -32}, {-68, -10}}));
  connect(TempSensor.port_a, cathode.port_a) annotation(
    Line(points = {{12, 16}, {12, 0}, {2, 0}}, color = {191, 0, 0}));
  connect(V_Source.p, currentMeter.p) annotation(
    Line(points = {{-68, 10}, {-68, 30}, {-48, 30}}, color = {0, 0, 255}));
  connect(cathode.p, currentMeter.n) annotation(
    Line(points = {{-8, 10}, {-8, 30}, {-28, 30}}, color = {0, 0, 255}));
  connect(currentMeter.controlledTemperature, fixedTemperature.port) annotation(
    Line(points = {{-32, 36}, {-32, 62}, {54, 62}, {54, 0}, {68, 0}}, color = {191, 0, 0}));
  connect(TempSensor.Temperature, V_Source.TemperatureInput) annotation(
    Line(points = {{12, 52}, {12, 74}, {-88, 74}, {-88, 0}, {-78, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.2));
>>>>>>> origin/main
end PID_test4;
