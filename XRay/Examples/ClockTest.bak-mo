within XRay.Examples;

model ClockTest
  Modelica.Blocks.Sources.Ramp ramp(height = 3000, duration = 1000, offset = 200, startTime = 20)  annotation(
    Placement(transformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold = 2300)  annotation(
    Placement(transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp.y, greaterEqualThreshold.u) annotation(
    Line(points = {{-70, 0}, {-48, 0}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 2));
end ClockTest;
