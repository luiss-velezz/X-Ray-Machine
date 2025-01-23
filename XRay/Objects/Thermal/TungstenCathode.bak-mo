within XRay.Objects.Thermal;

model TungstenCathode
  // Parameters
  parameter Modelica.Units.SI.Mass mass(min=0) = 0.0001; // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat(min=0) = 132; // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Temperature initialTemperature(min=0) = 293.15; // K (20°C)
  parameter Modelica.Units.SI.Temperature ambientTemperature(min=0) = 293.15; // K (20°C)
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer heatTransferCoefficient(min=0) = 170; // W/(m^2*K)
  parameter Modelica.Units.SI.Area surfaceArea(min=0) = 1e-6; // m^2

  // Inputs
  Modelica.Blocks.Interfaces.RealInput heatingPower;

  // Variables
  Modelica.Units.SI.Temperature temperature(start = initialTemperature);

equation
  // Energy balance equation with heat loss
  mass * specificHeat * der(temperature) = heatingPower 
                                           - heatTransferCoefficient * surfaceArea * (temperature - ambientTemperature);

  // Initial condition
  initial equation
    temperature = initialTemperature;
end TungstenCathode;
