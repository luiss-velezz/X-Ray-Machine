within XRay.Objects;

model Collimator
  // Parameters
  parameter Modelica.Units.SI.Length aperture = 0.01  "Aperture diameter"; // (m)

  // Radiation connectors
  Connectors.RadiationPin radiationInput "Radiation input pin";
  Connectors.RadiationPin radiationOutput "Radiation output pin";

equation
  // Calculating output radiation intensity based on aperture area
  radiationOutput.intensity = radiationInput.intensity / (Modelica.Constants.pi * (aperture / 2)^2);
end Collimator;

