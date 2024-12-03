within XRay.Objects;

model Cathode
  // Parameters for the cathode model
  parameter Modelica.Units.SI.Voltage V_filament = 10;        // Filament voltage (V)
  parameter Modelica.Units.SI.Resistance R_filament = 5;      // Filament resistance (Ohm)
  parameter Modelica.Units.SI.Temperature T_ambient = 300;    // Ambient temperature (K)
  parameter Modelica.Units.SI.Emissivity epsilon = 0.9;       // Emissivity of the filament surface
  parameter Modelica.Units.SI.Area A_filament = 1e-6;         // Filament surface area (m²)
  parameter Modelica.Units.SI.Voltage V_applied = 50000;      // Applied high voltage (V)

  // Connector pins for electrical and thermal connections
  ElectricalPin p_high "High voltage pin";
  ElectricalPin n_high "Ground pin";
  ThermalPin T "Thermal connection for temperature interaction";

  // Variables for electrical and thermal quantities
  Modelica.Units.SI.Current I_filament "Current through the filament (A)";
  Modelica.Units.SI.Current I_electron "Electron current emitted by the cathode (A)";
  Modelica.Units.SI.Power P_filament "Power dissipated in the filament (W)";
  Modelica.Units.SI.Temperature T_cathode "Temperature of the cathode (K)";

  // Constant: Stefan-Boltzmann constant
  constant Real sigma_thermal = 5.67e-8 "Stefan-Boltzmann constant (W/m²K⁴)";

equation
  // Ohm's law for filament voltage and current
  V_filament = I_filament * R_filament;

  // Power dissipated in the filament
  P_filament = V_filament * I_filament;

  // Stefan-Boltzmann law for radiative heat dissipation
  P_filament = sigma_thermal * epsilon * A_filament * (T_cathode^4 - T_ambient^4);

  // Richardson-Dushman equation for thermionic emission of electrons
  I_electron = 4 * Modelica.Constants.pi * Modelica.Constants.e * 
               (Modelica.Constants.k^2 / Modelica.Constants.h^3) * 
               T_cathode^2 * 
               exp(-Modelica.Constants.e * V_applied / (Modelica.Constants.k * T_cathode));
end Cathode;

