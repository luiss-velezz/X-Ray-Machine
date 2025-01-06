within XRay.Objects.Thermal;

model HeatSource
  parameter Modelica.Units.SI.Power heatingPower = 40; // W
  Modelica.Blocks.Interfaces.RealOutput powerOutput;

equation
  //powerOutput = heatingPower;
  powerOutput = if (time <= 400) then heatingPower else 0;
end HeatSource;
