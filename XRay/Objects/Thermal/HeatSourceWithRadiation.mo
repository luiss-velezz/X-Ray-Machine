within XRay.Objects.Thermal;

model HeatSourceWithRadiation
  parameter Modelica.Units.SI.Power heatingPower = 40; // W
  parameter Modelica.Units.SI.Temperature ambientTemperature = 3000; // K (20°C)
  Modelica.Blocks.Interfaces.RealOutput powerOutput;
  Modelica.Blocks.Interfaces.RealOutput radiatingSurfaceTemperatureOutput;

equation
  //powerOutput = heatingPower;
  //radiatingSurfaceTemperatureOutput = ambientTemperature;
  powerOutput = if (time <= 10000) then heatingPower else 0;
  radiatingSurfaceTemperatureOutput = if (time <= 10000) then ambientTemperature else 300;
end HeatSourceWithRadiation;


