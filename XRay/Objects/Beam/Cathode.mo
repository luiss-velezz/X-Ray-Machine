within XRay.Objects.Beam;

model Cathode
  extends Objects.TwoTerminal;
  
  // Parameters
  parameter Modelica.Units.SI.Voltage V_filament = 10  "Filament voltage"; // (V)
  parameter Modelica.Units.SI.Resistance R_filament = 5 "Filament resistance"; // (Ohm)
  parameter Modelica.Units.SI.Temperature T_ambient = 300 "Ambient temperature"; // (K)
  parameter Modelica.Units.SI.Emissivity epsilon = 0.9 "Filament emissivity";
  parameter Modelica.Units.SI.Area A_filament = 1e-6 "Filament surface area"; // (m²)
  parameter Modelica.Units.SI.Energy phi = 2.6*Modelica.Constants.e "Work function of the material"; // (J)
  //parameter Modelica.Units.SI.Voltage V_applied = 50000 "Applied high voltage"; // (V)
  //parameter Modelica.Units.SI.Temperature T_cathode = 1200 "Cat temp"; // (K)

  // Electrical connectors
  //Connectors.ElectricalPin p_high "High-voltage pin";
  //Connectors.ElectricalPin n_high "Ground pin";   // I DON'T KNOW IF THIS IS GROUND LOL

  // Thermal connector
 // Connectors.ThermalPin T "Thermal connection";

  // Variables
  Modelica.Units.SI.Current I_filament "Current through the filament"; // (A)
  Modelica.Units.SI.Current I_electron "Electron current emitted by the cathode"; // (A)
  Modelica.Units.SI.Power P_filament "Power dissipated by the filament"; // (W)
  Modelica.Units.SI.Temperature T_cathode "Temperature of the cathode"; // (K)
  Modelica.Units.SI.CurrentDensity J_thermionic "Thermionic emission current density"; // (A/m²)

  // Constants
  //constant Real sigma_thermal = 5.67e-8 "Stefan-Boltzmann constant"; // (W/m²K⁴)
  constant Real sigma_thermal = Modelica.Constants.sigma;
  constant Real m_e = 9.1093837139e-31 "Electron mass"; // (kg)
  constant Real A_Richardson = (4*Modelica.Constants.pi*Modelica.Constants.q*m_e*Modelica.Constants.k^2)/(Modelica.Constants.h^3) "Richardson constant"; // (A/m²K²)
  
equation
  // Ohm's law for filament
  V_filament = R_filament * I_filament;
  
  // Total voltage drop accross the Cathode
  //v = v - V_filament; 

  // Power dissipated in the filament
  P_filament = V_filament * I_filament;

  // Heat radiated by the filament (Stefan-Boltzmann law)
  P_filament = sigma_thermal * epsilon * A_filament * (T_cathode^4 - T_ambient^4);
  
  //Thermionic emission current density (Richardson-Dushman equation)
  J_thermionic = A_Richardson * T_cathode^2 * exp(-phi / (Modelica.Constants.k * T_cathode));

  // Electron emission current (Richardson-Dushman equation)
  I_electron = J_thermionic * A_filament;
  
  //Assign current
  i = I_electron;
  
end Cathode;