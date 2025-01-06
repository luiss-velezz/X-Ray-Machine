within XRay.Examples;

model TungstenHeatingWithLoss
  // Parameters
  parameter Modelica.Units.SI.Mass mass = 0.05; // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat = 132; // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Temperature initialTemperature = 293.15; // K (20°C)
  parameter Modelica.Units.SI.Power heatingPower = 40; // W
  parameter Modelica.Units.SI.Temperature ambientTemperature = 293.15; // K (20°C)
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer heatTransferCoefficient = 10; // W/(m^2*K)
  parameter Modelica.Units.SI.Area surfaceArea = 1e-6; // m^2

  // Variables
  Modelica.Units.SI.Temperature temperature(start = initialTemperature);

equation
  // Energy balance equation with heat loss
  mass * specificHeat * der(temperature) = heatingPower 
                                           - heatTransferCoefficient * surfaceArea * (temperature - ambientTemperature);

  // Initial condition
  initial equation
    temperature = initialTemperature;
end TungstenHeatingWithLoss;
