within XRay.Objects.Beam;

model ThermionicEmission2
  // Parameters for Richardson's law
  parameter Real phi = 4.5 "Work function of tungsten (eV)";
  parameter Modelica.Units.SI.Area Area = 1e-6 "Area of Cathode in m2";
  parameter Modelica.Units.SI.Voltage V = 50000 "High voltage source value";
  parameter Modelica.Units.SI.Distance d = 10e-3 "Separation between Anode and Cathode";
  // Constants
  constant Modelica.Units.SI.Mass m_e = 9.1093837139e-31 "Electron mass";
  constant Modelica.Units.SI.Permittivity epsilon_0 = Modelica.Constants.epsilon_0 "Permittivity of free space";
  constant Real A_R = (4*Modelica.Constants.pi*Modelica.Constants.q*m_e*Modelica.Constants.k^2)/(Modelica.Constants.h^3);
  
  // Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 port_a annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}})));
equation

  port_a.Q_flow = 0; // No heat flow
// Richardson's law equation
  A_R*port_a.T^2*exp(-phi*Modelica.Constants.q/(Modelica.Constants.k*port_a.T)) = (4 * epsilon_0 / 9) * sqrt(2 * Modelica.Constants.q / m_e) * (V^(3/2)) / (d^2);

  //p.i = (A_R*port_a.T^2*exp(-phi*Modelica.Constants.q/(Modelica.Constants.k*port_a.T)))*Area;
  

end ThermionicEmission2;
