within XRay.Objects;

model Anode
  // Parameters
  parameter Modelica.Units.SI.Angle theta_anode = 12  "Anode angle"; // (degrees)   SHOULD THIS BE CONVERTED TO RADS???
  parameter Modelica.Units.SI.Efficiency eta = 0.01  "X-ray conversion efficiency";
  parameter Modelica.Units.SI.Area sigma = 1e-6  "Nominal impact area"; // (m²)

  // Thermal connectors
  Connectors.ThermalPin T_in "Thermal input connection";
  Connectors.ThermalPin T_out "Thermal output connection";

  // Radiation output connector
  Connectors.RadiationPin radiationOutput "Radiation output pin";

  // Variables
  Modelica.Units.SI.Power P_anode "Power delivered to the anode"; // (W)
  Modelica.Units.SI.Power P_xray "X-ray power produced"; // (W)
  Modelica.Units.SI.Power P_heat "Heat power generated"; // (W)
  Modelica.Units.SI.Area A_impact "Impact area of the anode"; // (m²)

equation
  // Calculating impact area using anode angle
  A_impact = sigma * sin(theta_anode * Modelica.Constants.pi / 180);

  // X-ray power is a fraction of the anode power based on efficiency
  P_xray = eta * P_anode;

  // Heat generated is the remaining power after X-ray production
  P_heat = P_anode - P_xray;

  // Radiation intensity output from the anode
  radiationOutput.intensity = P_xray / A_impact;
end Anode;

