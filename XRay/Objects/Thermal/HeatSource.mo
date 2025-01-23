within XRay.Objects.Thermal;

model HeatSource
  parameter Modelica.Units.SI.Power heatingPower(min=0); // W
  Modelica.Blocks.Interfaces.RealOutput powerOutput;

equation
  //powerOutput = heatingPower;
  powerOutput = if (time <= 180) then heatingPower else 0;
   // Add assertion to check for positive resistance 
  assert(heatingPower >= 0, "Heating Power should be non-negative and a Real number");
end HeatSource;
