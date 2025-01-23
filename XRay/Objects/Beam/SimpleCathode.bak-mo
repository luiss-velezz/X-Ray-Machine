within XRay.Objects.Beam;

model SimpleCathode
  // Parameters
  parameter Modelica.Units.SI.Temperature T_ambient = 300; // Ambient temperature in K
  parameter Modelica.Units.SI.Temperature T_operating = 2500; // Operating temperature in K
  parameter Modelica.Units.SI.Area Area = 1e-6; // Area of the cathode in m^2
  parameter Real work_function = 4.5; // Work function in eV
  
  // Variables
  Modelica.Units.SI.Temperature temperature;
  Modelica.Units.SI.CurrentDensity current_density;
  Modelica.Units.SI.Current current;
  
  //Constants
  constant Modelica.Units.SI.Mass m_e = 9.1093837139e-31 "Electron mass"; // (kg)
  constant Real A_Richardson = (4*Modelica.Constants.pi*Modelica.Constants.q*m_e*Modelica.Constants.k^2)/(Modelica.Constants.h^3) "Richardson constant"; // (A/m²K²)
  constant Real k_B = Modelica.Constants.k; 
  constant Real q = 1.602176634e-19;
  
equation 
  // Heating equation (simplified)
  temperature = T_operating;

  // Richardson-Dushman equation for current density
  current_density = A_Richardson * temperature^2 * exp(-(work_function*Modelica.Constants.q) / (k_B * temperature));

  // Total current
  current = current_density * Area;
  
  // Print the current
  annotation (experiment(StopTime=1));
  
end SimpleCathode;
