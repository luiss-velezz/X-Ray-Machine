within XRay.Objects.Logic;

model OperatorInterface
  // Parameters to be exposed
  parameter Modelica.Units.SI.Voltage HVS(min = 30000) = 50000 "High voltage source that will be used for producing X-Ray radiation";
  parameter Modelica.Units.SI.Area Area_thermionic(min = 0) = 1e-6 "Surface area of the cathode";
  parameter Real work_function_thermionic(min = 0) = 4.5 "Work function of the cathde's material";
  
  parameter Modelica.Units.NonSI.Angle_deg theta_anode(min = 1, max = 89) = 12 "Inclination angle of the anode";
  parameter Modelica.Units.SI.Area sigma_anode(min = 0) = 1e-6;
  
  parameter Modelica.Units.SI.Length length_collimator(min = 0) = 0.24;
  parameter Modelica.Units.SI.Length height_collimator(min = 0) = 0.30;

  // Inputs and sub-models
  RealInput CathodeTemperature annotation(
    Placement(transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
  
  Beam.ThermionicEmissionCalc thermionicEmissionCalc(
    HVS = HVS,
    Area = Area_thermionic,
    work_function = work_function_thermionic) annotation(
    Placement(transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}})));
  
  Beam.AnodeCalculator anodeCalculator(
    theta_anode = theta_anode,
    sigma = sigma_anode,
    HVS = HVS) annotation(
    Placement(transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}})));
  
  Beam.CollimatorCalculator collimator(
    length = length_collimator,
    height = height_collimator) annotation(
    Placement(transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}})));

  equation
    connect(thermionicEmissionCalc.CathodeTemperature, CathodeTemperature) annotation(
      Line(points = {{-46, 10}, {-46, 28}, {-78, 28}, {-78, 0}, {-102, 0}}));
    connect(thermionicEmissionCalc.RadiationPower, anodeCalculator.InputPower) annotation(
      Line(points = {{-36, 0}, {-14, 0}}));
    connect(anodeCalculator.Radiation_xray, collimator.AnodeRadiation) annotation(
      Line(points = {{6, 0}, {32, 0}}));
  
  annotation(
    Icon(graphics = {Rectangle(origin = {-21, 3}, fillColor = {177, 177, 177}, fillPattern = FillPattern.Solid, extent = {{-69, 53}, {69, -53}}), Rectangle(origin = {-21, 3}, fillColor = {170, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-63, 47}, {63, -47}}), Rectangle(origin = {-22, 6}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-30, 30}, {30, -30}}), Line(origin = {-21.5994, -35.1092}, points = {{0, 70}, {0, 10}}), Line(origin = {-24.5994, 4.39981}, points = {{-27, 0}, {33, 0}}), Line(origin = {-36.3629, 19.509}, points = {{0, 7}, {0, -7}, {0, -7}}, thickness = 0.5), Line(origin = {-36.5993, 18.8908}, points = {{-7, 0}, {7, 0}, {7, 0}}, thickness = 0.5), Line(origin = {-6.74484, 18.5817}, points = {{-7, 0}, {7, 0}, {7, 0}}, thickness = 0.5), Line(origin = {-7.05394, -7.30929}, points = {{-7, 0}, {7, 0}, {7, 0}}, thickness = 0.5), Line(origin = {-6.98124, -14.491}, points = {{-7, 0}, {7, 0}, {7, 0}}, thickness = 0.5), Line(origin = {-37.5993, -9.10932}, points = {{-8, 6}, {8, -6}, {8, -6}}, thickness = 0.5), Line(origin = {-37.5993, -9.10932}, points = {{-6, -6}, {6, 6}, {6, 6}}, thickness = 0.5), Text(origin = {14, 78}, textColor = {0, 0, 255}, extent = {{150, 20}, {-150, -20}}, textString = "Operator Interface"), Rectangle(origin = {0, 2}, extent = {{-22, 14}, {-22, 14}}), Rectangle(origin = {-20, -65}, fillColor = {168, 168, 168}, fillPattern = FillPattern.Solid, extent = {{-10, 15}, {10, -15}}), Rectangle(origin = {-19, -85}, fillColor = {164, 164, 164}, fillPattern = FillPattern.Solid, extent = {{-45, 9}, {45, -9}}), Rectangle(origin = {88, -19}, fillColor = {164, 164, 164}, fillPattern = FillPattern.Solid, extent = {{-30, 75}, {30, -75}}), Rectangle(origin = {88, 42}, fillColor = {212, 212, 212}, fillPattern = FillPattern.Solid, extent = {{-20, 4}, {20, -4}}), Rectangle(origin = {88, 30}, fillColor = {212, 212, 212}, fillPattern = FillPattern.Solid, extent = {{-20, 4}, {20, -4}}), Rectangle(origin = {88, 6}, fillColor = {212, 212, 212}, fillPattern = FillPattern.Solid, extent = {{-20, 4}, {20, -4}}), Rectangle(origin = {88, -6}, fillColor = {212, 212, 212}, fillPattern = FillPattern.Solid, extent = {{-20, 4}, {20, -4}}), Ellipse(origin = {89, -40}, fillColor = {170, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 6}, {7, -6}})}, coordinateSystem(extent = {{-90, -60}, {90, 60}})),
    Diagram(coordinateSystem(extent = {{-90, -60}, {90, 60}})));
end OperatorInterface;
