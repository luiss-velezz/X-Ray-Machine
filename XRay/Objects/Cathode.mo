within XRay.Objects;

model Cathode
  // Parameters
  parameter Modelica.Units.SI.Voltage V_filament = 10  "Filament voltage"; // (V)
  parameter Modelica.Units.SI.Resistance R_filament = 5 "Filament resistance"; // (Ohm)
  parameter Modelica.Units.SI.Temperature T_ambient = 300 "Ambient temperature"; // (K)
  parameter Modelica.Units.SI.Emissivity epsilon = 0.9 "Filament emissivity";
  parameter Modelica.Units.SI.Area A_filament = 1e-6 "Filament surface area"; // (m²)
  parameter Modelica.Units.SI.Voltage V_applied = 50000 "Applied high voltage"; // (V)

  // Electrical connectors
  Connectors.ElectricalPin p_high "High-voltage pin";
  Connectors.ElectricalPin n_high "Ground pin";   // I DON'T KNOW IF THIS IS GROUND LOL

  // Thermal connector
  Connectors.ThermalPin T "Thermal connection";

  // Variables
  Modelica.Units.SI.Current I_filament "Current through the filament"; // (A)
  Modelica.Units.SI.Current I_electron "Electron current emitted by the cathode"; // (A)
  Modelica.Units.SI.Power P_filament "Power dissipated by the filament"; // (W)
  Modelica.Units.SI.Temperature T_cathode "Temperature of the cathode"; // (K)

  // Constants
  constant Real sigma_thermal = 5.67e-8 "Stefan-Boltzmann constant"; // (W/m²K⁴)

equation
  // Ohm's law for filament
  V_filament = I_filament * R_filament;

  // Power dissipated in the filament
  P_filament = V_filament * I_filament;

  // Heat radiated by the filament (Stefan-Boltzmann law)
  P_filament = sigma_thermal * epsilon * A_filament * (T_cathode^4 - T_ambient^4);

  // Electron emission current (Richardson-Dushman equation)
  I_electron = 4 * Modelica.Constants.pi * Modelica.Constants.e * 
               (Modelica.Constants.k^2 / Modelica.Constants.h^3) * T_cathode^2 * 
               exp(-Modelica.Constants.e * V_applied / (Modelica.Constants.k * T_cathode));
end Cathode;


