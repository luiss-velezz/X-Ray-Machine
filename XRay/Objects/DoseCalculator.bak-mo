within XRay.Objects;

model DoseCalculator
  // Parameters
  parameter Modelica.Units.SI.Area targetArea = 0.01  "Target area"; // (m²)
  parameter Modelica.Units.SI.Mass targetMass = 0.1  "Target mass"; // (kg)

  // Radiation input connector
  Connectors.RadiationPin radiationInput "Radiation input pin";

  // Output variable
  output Modelica.Units.SI.AbsorbedDose dose "Absorbed radiation dose"; // (Gy)

equation
  // Calculating absorbed dose based on radiation intensity, target area, and mass
  dose = (radiationInput.intensity * targetArea) / targetMass;
end DoseCalculator;

