within XRay.Objects.Thermal;

model HeatSource
  parameter Modelica.Units.SI.Power heatingPower = 80; // W
  Modelica.Blocks.Interfaces.RealOutput powerOutput;

equation
  //powerOutput = heatingPower;
  powerOutput = if (time <= 180) then heatingPower else 0;
end HeatSource;
