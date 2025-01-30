within XRay.Objects.Beam;

model DoseCalc
  extends Ports.TwoTerminal;

  // Parameters for Richardson's law with proper units
  parameter Modelica.Units.SI.CurrentDensity A0 = 60 "Richardson constant for tungsten (A/m^2/K^2), describing the emission capability of the material";
  parameter Modelica.Units.SI.Energy phi = 4.5 * Modelica.Constants.e "Work function of tungsten (J), representing the minimum energy required to release an electron";
  //parameter Modelica.Units.SI.BoltzmannConstant k = Modelica.Constants.k "Boltzmann constant (J/K), relating temperature to energy at the particle level";
  parameter Modelica.Units.SI.Temperature T=2300 "Absolute temperature (K), measuring the thermal energy available to the electrons";

  // Current density
  Modelica.Units.SI.CurrentDensity J_thermionic "Current density from Richardson's law (A/m^2), representing the rate of electron emission per unit area";

equation
  // Thermionic emission (Richardson's law)
  J_thermionic = A0 * T^2 * exp(-phi / (Modelica.Constants.k * T));

  // Relate the thermionic current to the voltage and port connections
  i = J_thermionic * v;

end DoseCalc;
