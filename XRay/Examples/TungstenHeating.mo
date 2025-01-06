within XRay.Examples;

model TungstenHeating
  // Parameters
  parameter Modelica.Units.SI.Mass mass = 0.05; // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat = 132; // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Temperature initialTemperature = 293.15; // K (20°C)
  parameter Modelica.Units.SI.Power heatingPower = 40; // W

  // Variables
  Modelica.Units.SI.Temperature temperature(start = initialTemperature);

equation
  // Energy balance equation
  mass * specificHeat * der(temperature) = heatingPower;

  // Initial condition
initial equation
    temperature = initialTemperature;
end TungstenHeating;
